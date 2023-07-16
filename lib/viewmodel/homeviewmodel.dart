import 'package:flutter/material.dart';
import 'package:space_news/get_it.dart';
import 'package:space_news/model/articles/article.dart';
import 'package:space_news/service/homeservice.dart';

class HomeViewModel with ChangeNotifier{
  HomeService homeService=locator<HomeService>();

  Future<List<Article>> getArticles()async{
    List<Article>? articles= await homeService.getArticle();
    return articles;
  }

}