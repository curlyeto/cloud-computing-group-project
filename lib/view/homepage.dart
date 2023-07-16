import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_news/model/articles/article.dart';
import 'package:space_news/view/webview.dart';
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
        child: FutureBuilder<List<Article>>(
            future: context.read<HomeViewModel>().getArticles(),
            builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator(),);
              }
              List<Article> articles=snapshot.data!;
              return ListView.separated(
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
                    trailing:  const Icon(Icons.favorite),
                  );
                },
              );
            }
        ),
      ),
    );
  }
}
