// To parse this JSON data, do
//
//     final collectionListResponse = collectionListResponseFromJson(jsonString);

import 'dart:convert';

CollectionListResponse collectionListResponseFromJson(String str) =>
    CollectionListResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String collectionListResponseToJson(CollectionListResponse data) =>
    json.encode(data.toJson());

class CollectionListResponse {
  CollectionListResponse({
    this.message,
    this.data,
  });

  factory CollectionListResponse.fromJson(Map<String, dynamic> json) =>
      CollectionListResponse(
        message: json['message'] as String? ?? '',
        data: json['data'] != null
            ? List<CollectionListData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                    (dynamic x) =>
                        CollectionListData.fromJson(x as Map<String, dynamic>)))
            : [],
      );

  String? message;
  List<CollectionListData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'data': data,
      };
}

class CollectionListData {
  CollectionListData({
    this.title,
    this.coverImage,
    this.collectionId,
    this.totalCount,
    this.isVisible,
  });

  factory CollectionListData.fromJson(Map<String, dynamic> json) =>
      CollectionListData(
        title: json['title'] as String? ?? '',
        coverImage: json['coverImage'] as String? ?? '',
        collectionId: json['collectionId'] as String? ?? '',
        totalCount: json['totalCount'] as int? ?? 0,
        isVisible: json['isVisible'] as int? ?? 0,
      );

  String? title;
  String? coverImage;
  String? collectionId;
  int? totalCount;
  int? isVisible;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title == null ? null : title,
        'coverImage': coverImage == null ? null : coverImage,
        'collectionId': collectionId == null ? null : collectionId,
        'totalCount': totalCount == null ? null : totalCount,
        'isVisible': isVisible == null ? null : isVisible,
      };
}
