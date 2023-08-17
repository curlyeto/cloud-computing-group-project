import 'package:space_news/model/favourites/favourite.dart';

class Favorites {
  bool? success;
  List<Favourite>? data;
  String? message;

  Favorites({this.success, this.data, this.message});

  Favorites.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Favourite>[];
      json['data'].forEach((v) {
        data!.add(new Favourite.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}