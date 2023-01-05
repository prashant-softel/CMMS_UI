// To parse this JSON data, do
//
//     final ratings = ratingsFromJson(jsonString);

import 'dart:convert';

Ratings ratingsFromJson(String str) =>
    Ratings.fromJson(json.decode(str) as Map<String, dynamic>);

String ratingsToJson(Ratings data) => json.encode(data.toJson());

class Ratings {
  factory Ratings.fromJson(Map<String, dynamic> json) => Ratings(
        message: json['message'] as String? ?? '',
        data: List<RatingsData>.from((json['data'] as List<dynamic>)
            .map<dynamic>((dynamic x) =>
                RatingsData.fromJson(x as Map<String, dynamic>))),
      );
  Ratings({
    this.message,
    this.data,
  });

  String? message;
  List<RatingsData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
      };
}

class RatingsData {
  factory RatingsData.fromJson(Map<String, dynamic> json) => RatingsData(
        id: json['_id'] as String? ?? '',
        linkedWith: json['linkedWith'] as String? ?? '',
        defaultValue: json['defaultValue'] as num? ?? 0,
        title: json['title'] as String? ?? '',
      );
  RatingsData({
    this.id,
    this.linkedWith,
    this.defaultValue,
    this.title,
  });

  String? id;
  String? linkedWith;
  num? defaultValue;
  String? title;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'linkedWith': linkedWith,
        'defaultValue': defaultValue,
        'title': title,
      };
}
