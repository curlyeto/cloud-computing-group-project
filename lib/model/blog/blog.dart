import 'package:space_news/model/articles/launches.dart';

class Blog{
  int? id;
  String? title;
  String? url;
  String? imageUrl;
  String? newsSite;
  String? summary;
  String? publishedAt;
  String? updatedAt;
  bool? featured;
  List<Launches>? launches;
  List? events;

  Blog(
      {this.id,
        this.title,
        this.url,
        this.imageUrl,
        this.newsSite,
        this.summary,
        this.publishedAt,
        this.updatedAt,
        this.featured,
        this.launches,
        this.events});

  Blog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    imageUrl = json['image_url'];
    newsSite = json['news_site'];
    summary = json['summary'];
    publishedAt = json['published_at'];
    updatedAt = json['updated_at'];
    featured = json['featured'];

    if (json['launches'] != null) {
      launches = <Launches>[];
      json['launches'].forEach((v) {
        launches!.add(new Launches.fromJson(v));
      });
    }
    events = json['events'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    data['news_site'] = this.newsSite;
    data['summary'] = this.summary;
    data['published_at'] = this.publishedAt;
    data['updated_at'] = this.updatedAt;
    data['featured'] = this.featured;
    if (this.launches != null) {
      data['launches'] = this.launches!.map((v) => v.toJson()).toList();
    }
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}