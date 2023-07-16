import 'package:dio/dio.dart';
import 'package:space_news/model/blog/blog.dart';
import 'package:space_news/model/blog/blogs.dart';

class BlogService{
  Future<List<Blog>> getBlog() async{
    try{
      Dio dio = new Dio();
      var response = await dio.get("https://api.spaceflightnewsapi.net/v4/blogs");
      print("Response ${response.data}");
      Blogs adresList=Blogs.fromJson(response.data);
      return adresList.results!;
    }catch(e){
      print(e.toString());
      return [];
    }
  }
}