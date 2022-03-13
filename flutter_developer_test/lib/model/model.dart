// To parse this JSON data, do
//
//     final weatherDataModel = weatherDataModelFromJson(jsonString);

import 'dart:convert';

List<WeatherDataModel> weatherDataModelFromJson(String str) =>
    List<WeatherDataModel>.from(
        json.decode(str).map((x) => WeatherDataModel.fromJson(x)));

String weatherDataModelToJson(List<WeatherDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WeatherDataModel {
  WeatherDataModel({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  String? id;
  String? author;
  int? width;
  int? height;
  String? url;
  String? downloadUrl;

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) =>
      WeatherDataModel(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
      };
}
