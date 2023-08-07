import 'package:space_news/model/user/user.dart';

class Response {
  bool? success;
  User? data;
  String? message;
  String? token;

  Response({this.success, this.data, this.message,this.token});

  Response.fromJsonLogin(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new User.fromJson(json['data']) : null;
    message = json['message'];
    token = json['token'];
  }
  Response.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new User.fromJson(json['data']) : null;
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['token'] = this.token;
    return data;
  }
}