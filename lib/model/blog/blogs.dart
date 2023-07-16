import 'package:space_news/model/blog/blog.dart';

class Blogs {
  int? count;
  String? next;
  Null? previous;
  List<Blog>? results;

  Blogs({this.count, this.next, this.previous, this.results});

  Blogs.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Blog>[];
      json['results'].forEach((v) {
        results!.add(new Blog.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}