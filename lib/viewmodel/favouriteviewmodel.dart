import 'package:flutter/material.dart';
import 'package:space_news/get_it.dart';
import 'package:space_news/model/favourites/favourite.dart';
import 'package:space_news/service/favouriteservice.dart';

class FavouriteViewModel with ChangeNotifier{
  FavouriteService favouriteService=locator<FavouriteService>();

  Future<List<Favourite?>> getFavList()async{
    List<Favourite?> articles= await favouriteService.getFavList();
    return articles;
  }
  Future addFavourite(int newsId)async{
    return await favouriteService.addFavorite(newsId);
  }
  Future deleteFavourite(int newsId)async{
    return await favouriteService.deleteFavourite(newsId);
  }

}