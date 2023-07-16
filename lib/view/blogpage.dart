import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_news/model/blog/blog.dart';
import 'package:space_news/view/webview.dart';
import 'package:space_news/viewmodel/blogviewmodel.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Blogs",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Blog>>(
            future: context.read<BlogViewModel>().getBlogs(),
            builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              List<Blog> blogs=snapshot.data!;
              return ListView.separated(
                itemCount: blogs.length,
                separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 2,),
                itemBuilder: (context,index){
                  return ListTile(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WebViewPage(url: blogs[index].url!,title: blogs[index].title!,)),
                      );
                    },
                    leading: Image.network(
                      blogs[index].imageUrl!,
                      height: 60,
                      width: 60,
                    ),
                    title: Text(blogs[index].title!),
                    subtitle: Text(blogs[index].summary!),
                  );
                },
              );
            }
        ),
      ),
    );
  }
}
