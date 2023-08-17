class Favourite {
  int? userId;
  int? newsId;
  int? status;
  String? updatedAt;
  String? createdAt;
  int? id;

  Favourite(
      {this.userId,
        this.newsId,
        this.status,
        this.updatedAt,
        this.createdAt,
        this.id});

  Favourite.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    newsId = json['news_id'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['news_id'] = this.newsId;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}