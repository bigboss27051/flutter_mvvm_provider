class Magazine {
  Magazine.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    name = json['name'];
    url = json['url'];
    count = json['count'];
  }

  Magazine({this.malId, this.name, this.url, this.count});
  int? malId;
  String? name;
  String? url;
  int? count;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['mal_id'] = malId;
    data['name'] = name;
    data['url'] = url;
    data['count'] = count;
    return data;
  }
}
