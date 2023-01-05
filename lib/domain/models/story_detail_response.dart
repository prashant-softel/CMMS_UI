// To parse this JSON data, do
//
//     final storyDetailResponse = storyDetailResponseFromJson(jsonString);

import 'dart:convert';
import 'package:cmms/domain/domain.dart';

StoryDetailResponse storyDetailResponseFromJson(String str) =>
    StoryDetailResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String storyDetailResponseToJson(StoryDetailResponse data) =>
    json.encode(data.toJson());

class StoryDetailResponse {
  StoryDetailResponse({
    this.message,
    this.data,
  });

  factory StoryDetailResponse.fromJson(Map<String, dynamic> json) =>
      StoryDetailResponse(
        message: json['message'] as String? ?? '',
        data: json['data'] != null
            ? List<StoryDetailData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                    (dynamic x) =>
                        StoryDetailData.fromJson(x as Map<String, dynamic>)))
            : [],
      );

  String? message;
  List<StoryDetailData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'data': data,
      };
}

class StoryDetailData {
  StoryDetailData({
    this.storyType,
    this.description,
    this.createdAt,
    this.storyData,
    this.totalTipReceived,
    this.storyId,
    this.allowShare,
    this.id,
    this.price,
    this.currency,
    this.isViewed,
    this.isVisible,
    this.taggedUsers,
  });

  factory StoryDetailData.fromJson(Map<String, dynamic> json) =>
      StoryDetailData(
        storyType: json['storyType'] as String? ?? '',
        description: json['description'] as String? ?? '',
        createdAt: json['createdAt'] as int? ?? 0,
        storyData: json['storyData'] == null
            ? null
            : PostData.fromJson(json['storyData'] as Map<String, dynamic>),
        totalTipReceived: json['totalTipReceived'] as String? ?? '',
        storyId: json['storyId'] as String? ?? '',
        allowShare: json['allowShare'] as bool? ?? false,
        id: json['_id'] as String? ?? '',
        price: json['price'] as String? ?? '',
        currency: json['currency'] == null
            ? null
            : Currency.fromJson(json['currency'] as Map<String, dynamic>),
        isViewed: json['isViewed'] as int? ?? 0,
        isVisible: json['isVisible'] as int? ?? 0,
        taggedUsers: json['taggedUsers'] != null
            ? List<PopularTaggedUsers>.from(
                (json['taggedUsers'] as List<dynamic>? ?? <dynamic>[])
                    .map<dynamic>((dynamic x) =>
                        PopularTaggedUsers.fromJson(x as Map<String, dynamic>)))
            : <PopularTaggedUsers>[],
      );

  String? storyType;
  String? description;
  int? createdAt;
  PostData? storyData;
  String? totalTipReceived;
  String? storyId;
  bool? allowShare;
  String? id;
  String? price;
  Currency? currency;
  int? isViewed;
  int? isVisible;
  List<PopularTaggedUsers>? taggedUsers;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'storyType': storyType == null ? null : storyType,
        'description': description == null ? null : description,
        'createdAt': createdAt == null ? null : createdAt,
        'storyData': storyData,
        'totalTipReceived': totalTipReceived == null ? null : totalTipReceived,
        'storyId': storyId == null ? null : storyId,
        'allowShare': allowShare == null ? null : allowShare,
        '_id': id == null ? null : id,
        'price': price == null ? null : price,
        'currency': currency,
        'isViewed': isViewed == null ? null : isViewed,
        'isVisible': isVisible == null ? null : isVisible,
        'taggedUsers': taggedUsers,
      };
}
