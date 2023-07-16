import 'package:dio/dio.dart';
import 'package:space_news/model/articles/article.dart';
import 'package:space_news/model/articles/articles.dart';

class HomeService{
  Future<List<Article>> getArticle() async{
    try{
      Dio dio = new Dio();
      var response = await dio.get("https://api.spaceflightnewsapi.net/v4/articles");
      print("Response ${response.data}");
      Articles adresList=Articles.fromJson(response.data);
      return adresList.results!;
    }catch(e){
      print(e.toString());
      return [];
    }
  }
}