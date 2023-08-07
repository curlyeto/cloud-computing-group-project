import 'package:flutter/material.dart';
import 'package:space_news/model/user/user.dart';
import 'package:space_news/service/authservice.dart';
import 'package:space_news/view/auth/login.dart';
import 'package:space_news/view/buttomNavigationBar.dart';


class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  User? user;
  getData()async{
    user=await AuthService.currentUser();
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

  }

  @override
  Widget build(BuildContext context) {

    if(AuthService.isLoading){
      if(user!=null){
          return BottomNavigationBarExample();
      }else{
        // Navigator.pushNamed(context, LoginRoutes.loginPage,
        //     arguments: null);
        return const Login();
      }
    }else{
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircularProgressIndicator()
            ],
          ),
        ),
      );

    }


  }
}