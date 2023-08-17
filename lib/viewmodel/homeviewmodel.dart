import 'package:flutter/material.dart';
import 'package:space_news/get_it.dart';
import 'package:space_news/model/articles/article.dart';
import 'package:space_news/service/favouriteservice.dart';
import 'package:space_news/service/homeservice.dart';

class HomeViewModel with ChangeNotifier{
  HomeService homeService=locator<HomeService>();
  FavouriteService favouriteService=locator<FavouriteService>();
  Future<List<Article>> getArticles()async{
    List<Article>? articles= await homeService.getArticle();
    var favList=await favouriteService.getFavList();
    favList.forEach((fav) {
      articles.forEach((article) {
        if(article.id == fav!.newsId!){
          article.Fav=true;
        }
      });
    });

    return articles;
  }

}