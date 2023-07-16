import 'package:space_news/model/articles/article.dart';

class Articles{
  int? count;
  String? next;
  Null? previous;
  List<Article>? results;

  Articles({this.count, this.next, this.previous, this.results});

  Articles.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Article>[];
      json['results'].forEach((v) {
        results!.add(new Article.fromJson(v));
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