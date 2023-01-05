// To parse this JSON data, do
//
//     final creatorType = creatorTypeFromJson(jsonString);

import 'dart:convert';

CreatorType creatorTypeFromJson(String str) =>
    CreatorType.fromJson(json.decode(str) as Map<String, dynamic>);

String creatorTypeToJson(CreatorType data) => json.encode(data.toJson());

class CreatorType {
  CreatorType({
    this.message,
    this.data,
  });

  factory CreatorType.fromJson(Map<String, dynamic> json) => CreatorType(
        message: json['message'] as String? ?? '',
        data: json['data'] != null
            ? List<CreatorTypeData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                    (dynamic x) =>
                        CreatorTypeData.fromJson(x as Map<String, dynamic>)))
            : [],
      );

  String? message;
  List<CreatorTypeData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'data': data,
      };
}

class CreatorTypeData {
  CreatorTypeData({
    this.id,
    this.title,
    this.webUrl,
    this.appUrl,
    this.heroCategory,
  });

  factory CreatorTypeData.fromJson(Map<String, dynamic> json) =>
      CreatorTypeData(
        id: json['_id'] as String? ?? '',
        title: json['title'] as String? ?? '',
        webUrl: json['webUrl'] as String? ?? '',
        appUrl: json['appUrl'] as String? ?? '',
        heroCategory: json['heroCategory'] as bool? ?? false,
      );

  String? id;
  String? title;
  String? webUrl;
  String? appUrl;
  bool? heroCategory;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id == null ? null : id,
        'title': title == null ? null : title,
        'webUrl': webUrl == null ? null : webUrl,
        'appUrl': appUrl == null ? null : appUrl,
        'heroCategory': heroCategory == null ? null : heroCategory,
      };
}
