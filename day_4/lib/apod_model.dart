
class ApodModel {
  String date;
  String explanation;
  String hdurl;
  String mediaType;
  String serviceVersion;
  String title;
  String url;

  ApodModel({this.date, this.explanation, this.hdurl, this.mediaType, this.serviceVersion, this.title, this.url});

  ApodModel.fromJson(Map<String, dynamic> json) {
    if(json["date"] is String)
      this.date = json["date"];
    if(json["explanation"] is String)
      this.explanation = json["explanation"];
    if(json["hdurl"] is String)
      this.hdurl = json["hdurl"];
    if(json["media_type"] is String)
      this.mediaType = json["media_type"];
    if(json["service_version"] is String)
      this.serviceVersion = json["service_version"];
    if(json["title"] is String)
      this.title = json["title"];
    if(json["url"] is String)
      this.url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["date"] = this.date;
    data["explanation"] = this.explanation;
    data["hdurl"] = this.hdurl;
    data["media_type"] = this.mediaType;
    data["service_version"] = this.serviceVersion;
    data["title"] = this.title;
    data["url"] = this.url;
    return data;
  }
}