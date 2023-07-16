import 'package:flutter/material.dart';
import 'package:space_news/get_it.dart';
import 'package:space_news/model/blog/blog.dart';
import 'package:space_news/service/blogservice.dart';

class BlogViewModel with ChangeNotifier{
  BlogService homeService=locator<BlogService>();

  Future<List<Blog>> getBlogs()async{
    List<Blog>? blogs= await homeService.getBlog();
    return blogs;
  }

}