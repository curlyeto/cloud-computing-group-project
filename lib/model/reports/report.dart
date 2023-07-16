class Report {
  int? id;
  String? title;
  String? url;
  String? imageUrl;
  String? newsSite;
  String? summary;
  String? publishedAt;
  String? updatedAt;

  Report(
      {this.id,
        this.title,
        this.url,
        this.imageUrl,
        this.newsSite,
        this.summary,
        this.publishedAt,
        this.updatedAt});

  Report.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    imageUrl = json['image_url'];
    newsSite = json['news_site'];
    summary = json['summary'];
    publishedAt = json['published_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}