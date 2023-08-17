import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_news/model/favourites/favourite.dart';
import 'package:space_news/model/favourites/favourites.dart';

class FavouriteService{
  Future<List<Favourite?>> getFavList()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('user_id');
    final String? token = prefs.getString('token');
    print(token);
    print(userId);
    var dio = new Dio();
    if(userId!=null && token!=null){
      dio.options.headers["Authorization"] = "Bearer ${token}";
      Response response = await dio.get("http://10.0.2.2:8000/api/favorite/${userId}");
      print(response.data);
      if(response.data['success']==true){
        Favorites reponse=Favorites.fromJson(response.data);

        return reponse.data!;
      }else{
        return [];
      }
    }

    return [];
  }
  Future addFavorite(int newsId) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('user_id');
    final String? token = prefs.getString('token');

    var dio = new Dio();
    if(userId!=null && token!=null){
      dio.options.headers["Authorization"] = "Bearer ${token}";
      var params =  {
        "user_id": userId,
        "news_id": newsId,
        "status": 1,

      };

      Response response = await dio.post("http://10.0.2.2:8000/api/favorite",data: params);
      print(response.data);
      if(response.data['success']==true){
        return response.data;
      }else{
        return response.data;
      }
    }
  }
  Future deleteFavourite(int newsId) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('user_id');
    final String? token = prefs.getString('token');

    var dio = new Dio();
    if(userId!=null && token!=null){
      dio.options.headers["Authorization"] = "Bearer ${token}";
      var params =  {
        "user_id": userId,
        "news_id": newsId,
      };

      Response response = await dio.post("http://10.0.2.2:8000/api/favorite/delete",data: params);
      print(response.data);
      if(response.data['success']==true){
        return response.data;
      }else{
        return response.data;
      }
    }
  }
}