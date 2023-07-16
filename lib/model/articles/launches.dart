class Launches {
  String? launchId;
  String? provider;

  Launches({this.launchId, this.provider});

  Launches.fromJson(Map<String, dynamic> json) {
    launchId = json['launch_id'];
    provider = json['provider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['launch_id'] = this.launchId;
    data['provider'] = this.provider;
    return data;
  }
}