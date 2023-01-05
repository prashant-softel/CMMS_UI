// To parse this JSON data, do
//
//     final activeStory = activeStoryFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/domain/domain.dart';

ActiveStory activeStoryFromJson(String str) =>
    ActiveStory.fromJson(json.decode(str) as Map<String, dynamic>);

String activeStoryToJson(ActiveStory data) => json.encode(data.toJson());

class ActiveStory {
  ActiveStory({
    this.message,
    this.data,
  });

  factory ActiveStory.fromJson(Map<String, dynamic> json) => ActiveStory(
        message: json['message'] as String? ?? '',
        data: json['data'] != null
            ? List<ActiveStoryData>.from((json['data'] as List<dynamic>)
                .map<dynamic>((dynamic x) =>
                    ActiveStoryData.fromJson(x as Map<String, dynamic>)))
            : [],
      );

  String? message;
  List<ActiveStoryData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
      };
}

class ActiveStoryData {
  ActiveStoryData({
    this.id,
    this.storyId,
    this.storyType,
    this.description,
    this.allowShare,
    this.taggedUserIds,
    this.price,
    this.currency,
    this.createdTs,
    this.expireIn,
    this.type,
    this.totalTipReceived,
    this.storyData,
    this.totalViews,
  });

  factory ActiveStoryData.fromJson(Map<String, dynamic> json) =>
      ActiveStoryData(
        id: json['_id'] as String? ?? '',
        storyId: json['storyId'] as String? ?? '',
        storyType: json['storyType'] as int? ?? 0,
        description: json['description'] as String? ?? '',
        allowShare: json['allowShare'] as bool? ?? false,
        // taggedUserIds: List<dynamic>.from(json['taggedUserIds'].map((x) => x)),
        price: json['price'] as String? ?? '',
        currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
        createdTs: json['createdTs'] as int? ?? 0,
        expireIn: json['expireIn'] as int? ?? 0,
        type: json['type'] as String? ?? '',
        totalTipReceived: json['totalTipReceived'] as int? ?? 0,
        storyData:
            StoryData.fromJson(json['storyData'] as Map<String, dynamic>),
        totalViews: json['totalViews'] as int? ?? 0,
      );

  String? id;
  String? storyId;
  int? storyType;
  String? description;
  bool? allowShare;
  List<dynamic>? taggedUserIds;
  String? price;
  Currency? currency;
  int? createdTs;
  int? expireIn;
  String? type;
  int? totalTipReceived;
  StoryData? storyData;
  int? totalViews;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'storyId': storyId,
        'storyType': storyType,
        'description': description,
        'allowShare': allowShare,
        // 'taggedUserIds': List<dynamic>.from(taggedUserIds.map((x) => x)),
        'price': price,
        'currency': currency!.toJson(),
        'createdTs': createdTs,
        'expireIn': expireIn,
        'type': type,
        'totalTipReceived': totalTipReceived,
        'storyData': storyData!.toJson(),
        'totalViews': totalViews,
      };
}
