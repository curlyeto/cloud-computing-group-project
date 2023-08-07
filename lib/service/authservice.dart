import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_news/model/user/response.dart' as userResponse;
import 'package:space_news/model/user/user.dart';

class AuthService{
  static bool isLoading=false;
  static Future<User?> currentUser()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('user_id');
    final String? token = prefs.getString('token');
    print(token);
    print(userId);
    var dio = new Dio();
    if(userId!=null && token!=null){
      dio.options.headers["Authorization"] = "Bearer ${token}";
      Response response = await dio.get("http://10.0.2.2:8000/api/user/${userId}");
      print(response.data);
      if(response.data['success']==true){
        userResponse.Response reponse=userResponse.Response.fromJson(response.data);
        isLoading=true;
        return reponse.data;
      }else{
        return null;
      }
    }
    isLoading=true;
    return null;
  }


  static Future<userResponse.Response?> register(String fullName,String email,String password) async{
    try{
      Dio dio = new Dio();
      var params =  {
        "name": fullName,
        "email": email,
        "password": password,
        "photo": "https://t3.ftcdn.net/jpg/01/65/63/94/360_F_165639425_kRh61s497pV7IOPAjwjme1btB8ICkV0L.jpg",
      };
      var response = await dio.post("http://10.0.2.2:8000/api/user/register",data: params);
      print("Response ${response.data}");
      userResponse.Response reponse=userResponse.Response.fromJson(response.data);
      return reponse;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  static Future<userResponse.Response?> login(String email,String password) async{
    try{
      Dio dio = new Dio();
      var params =  {
        "email": email,
        "password": password,
      };
      var response = await dio.post("http://10.0.2.2:8000/api/user/login",data: params);
      print("Response ${response.data}");
      userResponse.Response reponse=userResponse.Response.fromJsonLogin(response.data);
      if(reponse.success!){
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', reponse.token!);
        await prefs.setInt('user_id', reponse.data!.id!);
      }
      return reponse;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  static  Future<userResponse.Response?> updateUser(String nameSurname,String photo,String email,String password) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('user_id');
    final String? token = prefs.getString('token');
    Dio dio = new Dio();
    if(userId!=null && token!=null ){
      try{
        dio.options.headers["Authorization"] = "Bearer ${token}";
        var params={};
        print("Password ${password}");
        if(password !=""){
           params =  {
            "name": nameSurname,
            "photo": photo,
            "email": email,
            "password": password,
            "user_id": userId,
          };
        }else{
           params =  {
            "name": nameSurname,
            "photo": photo,
            "email": email,
            "user_id": userId,
          };
        }
        print(params);
        var response = await dio.post("http://10.0.2.2:8000/api/user",data: params);
        print("Response ${response.data}");
        userResponse.Response reponse=userResponse.Response.fromJson(response.data);
        return reponse;
      }catch(e){
        print(e.toString());
        return null;
      }
    }


  }
  static Future<bool?> logout()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('token');
    await prefs.remove('user_id');
    return true;
  }
}