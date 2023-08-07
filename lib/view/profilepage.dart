import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:space_news/service/authservice.dart';
import 'package:space_news/model/user/user.dart';
import 'package:space_news/model/user/response.dart' as userResponse;
import 'package:space_news/view/auth/landingpage.dart';
import 'package:space_news/view/buttomNavigationBar.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _fullNameControlller=TextEditingController();
  TextEditingController _photoContoller=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  bool photoEdit=false;
  User? user;
  Future getUserData()async{
    user=await AuthService.currentUser();
    _fullNameControlller.text=user!.name!;
    _photoContoller.text=user!.photo!;
    _emailController.text=user!.email!;

    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(onPressed: ()async{
              bool? logOut=await AuthService.logout();
              if(logOut!){
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LandingPage()));
              }
          }, icon: Icon(Icons.logout))
        ],

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network("https://t3.ftcdn.net/jpg/01/65/63/94/360_F_165639425_kRh61s497pV7IOPAjwjme1btB8ICkV0L.jpg",height: 80,),
                          Text("Edit Photo"),
                          Checkbox(value: photoEdit, onChanged: (value){
                            setState(() {
                              photoEdit= value!;
                            });
                          })
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: _photoContoller,
                          enabled: photoEdit,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Photo',
                              hintText: 'Paste image url'),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: _fullNameControlller,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Name Surname',
                              hintText: 'Enter name surname'),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'Enter valid email id as abc@gmail.com'),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'Enter valid password'),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          onPressed: () async{
                            if(_passwordController.text != null){
                              userResponse.Response? response= await AuthService.updateUser(_fullNameControlller.text,_photoContoller.text,_emailController.text,_passwordController.text);
                              if(response!.success!){
                                Fluttertoast.showToast(
                                    msg: response.message!,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (_) => const BottomNavigationBarExample()));
                              }else{
                                Fluttertoast.showToast(
                                    msg: response.message!,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }

                            }
                          },
                          child: const Text(
                            'Edit Profile',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }
}
