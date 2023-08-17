import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:space_news/model/articles/article.dart';
import 'package:space_news/view/webview.dart';
import 'package:space_news/viewmodel/favouriteviewmodel.dart';
import 'package:space_news/viewmodel/homeviewmodel.dart';

class FavPage extends StatefulWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  List<Article> articles=[];


  Future getData()async{
    var favList=await context.read<FavouriteViewModel>().getFavList();
    print("FavList Count ${favList.length}");
    var articleList=await context.read<HomeViewModel>().getArticles();
    print("Articles Count ${articleList.length}");
    favList.forEach((fav) {
      articleList.forEach((article) {

            if(article.id == fav!.newsId!){
                articles.add(article);
            }
        });
    });
    print("Articles Count1 ${articles.length}");
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
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favourite",style: TextStyle(
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
                onTap: ()async{
                  deleteFavourite(articles[index],context);
                },
                child: Icon(Icons.favorite,color: Colors.red,)),
          );
        },
      ),
      ),
    );
  }
  deleteFavourite(Article articl,BuildContext context) async{
    var response=await context.read<FavouriteViewModel>().deleteFavourite(articl.id!);
    if(response['success']==true){
      articles.remove(articl);
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
