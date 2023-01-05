// To parse this JSON data, do
//
//     final featuredCollection = featuredCollectionFromJson(jsonString);

import 'dart:convert';

FeaturedCollection featuredCollectionFromJson(String str) =>
    FeaturedCollection.fromJson(json.decode(str) as Map<String, dynamic>);

String featuredCollectionToJson(FeaturedCollection data) =>
    json.encode(data.toJson());

class FeaturedCollection {
  FeaturedCollection({
    this.message,
    this.data,
  });

  factory FeaturedCollection.fromJson(Map<String, dynamic> json) =>
      FeaturedCollection(
        message: json['message'] as String? ?? '',
        data: List<FeaturedCollectionData>.from((json['data']
                    as List<dynamic>? ??
                <dynamic>[])
            .map<dynamic>((dynamic x) =>
                FeaturedCollectionData.fromJson(x as Map<String, dynamic>))),
      );

  String? message;
  List<FeaturedCollectionData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
      };
}

class FeaturedCollectionData {
  FeaturedCollectionData({
    this.title,
    this.coverImage,
    this.featCollectionId,
    this.totalCount,
    this.isVisible,
  });

  factory FeaturedCollectionData.fromJson(Map<String, dynamic> json) =>
      FeaturedCollectionData(
        title: json['title'] as String? ?? '',
        coverImage: json['coverImage'] as String? ?? '',
        featCollectionId: json['featCollectionId'] as String? ?? '',
        totalCount: json['totalCount'] as int? ?? 0,
        isVisible: json['isVisible'] as int? ?? 0,
      );

  String? title;
  String? coverImage;
  String? featCollectionId;
  int? totalCount;
  int? isVisible;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'coverImage': coverImage,
        'featCollectionId': featCollectionId,
        'totalCount': totalCount,
        'isVisible': isVisible,
      };
}
