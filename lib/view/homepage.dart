import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:space_news/model/articles/article.dart';
import 'package:space_news/view/webview.dart';
import 'package:space_news/viewmodel/favouriteviewmodel.dart';
import 'package:space_news/viewmodel/homeviewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> articles=[];
  Future getHomePage()async{
    articles=await context.read<HomeViewModel>().getArticles();
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("News",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemCount: articles.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 2,),
          itemBuilder: (context,index){
            return ListTile(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WebViewPage(url: articles[index].url!,title: articles[index].title!,)),
                );
              },
              leading: Image.network(
                articles[index].imageUrl!,
                height: 60,
                width: 60,
              ),
              title: Text(articles[index].title!),
              subtitle: Text(articles[index].summary!),
              trailing:   GestureDetector(
                  onTap : () async{
                    addFavourite(articles[index],context);
                  },
                  child: Icon(Icons.favorite,color: articles[index].Fav?Colors.red:Colors.grey,)),
            );
          },
        ),
      ),
    );
  }

   addFavourite(Article articl,BuildContext context) async{
    if(articl.Fav){
      var response=await context.read<FavouriteViewModel>().deleteFavourite(articl.id!);
      if(response['success']==true){
        articl.Fav=false;
        setState(() {

        });
        Fluttertoast.showToast(
            msg: response['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }else{
        Fluttertoast.showToast(
            msg: response['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }else{
      var response=await context.read<FavouriteViewModel>().addFavourite(articl.id!);
      if(response['success']==true){
        articl.Fav=true;
        setState(() {

        });
        Fluttertoast.showToast(
            msg: response['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }else{
        Fluttertoast.showToast(
            msg: response['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }

    }



   }
}
