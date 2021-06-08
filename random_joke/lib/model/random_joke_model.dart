class RandomJokeModel {
  String type;
  Value value;

  RandomJokeModel({this.type, this.value});

  RandomJokeModel.fromJson(Map<String, dynamic> json) {
    if (json["type"] is String) this.type = json["type"];
    if (json["value"] is Map)
      this.value = json["value"] == null ? null : Value.fromJson(json["value"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["type"] = this.type;
    if (this.value != null) data["value"] = this.value.toJson();
    return data;
  }
}

class Value {
  int id;
  String joke;
  List<dynamic> categories;

  Value({this.id, this.joke, this.categories});

  Value.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["joke"] is String) this.joke = json["joke"];
    if (json["categories"] is List) this.categories = json["categories"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["joke"] = this.joke;
    if (this.categories != null) data["categories"] = this.categories;
    return data;
  }
}
