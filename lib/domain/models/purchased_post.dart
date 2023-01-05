// To parse this JSON data, do
//
//     final PurchasedPost = purchasedPostFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/domain/domain.dart';

PurchasedPost purchasedPostFromJson(String str) =>
    PurchasedPost.fromJson(json.decode(str) as Map<String, dynamic>);

String purchasedPostToJson(PurchasedPost data) => json.encode(data.toJson());

class PurchasedPost {
  PurchasedPost({
    this.message,
    this.data,
  });

  factory PurchasedPost.fromJson(Map<String, dynamic> json) => PurchasedPost(
        message: json['message'] as String? ?? '',
        data: List<PurchasedPostData>.from((json['data'] as List<dynamic>)
            .map<dynamic>((dynamic x) =>
                PurchasedPostData.fromJson(x as Map<String, dynamic>))),
      );

  String? message;
  List<PurchasedPostData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
      };
}

class PurchasedPostData {
  PurchasedPostData({
    this.userId,
    this.username,
    this.firstName,
    this.lastName,
    this.profilePic,
    this.postType,
    this.sharedOnPersonalFeed,
    this.description,
    this.postedAt,
    this.price,
    this.postData,
    this.viewCount,
    this.commentCount,
    this.totalTipReceived,
    this.currency,
    this.postId,
    this.postedOn,
    this.allowComments,
    this.allowDownload,
    this.allowShare,
    this.taggedUsers,
    this.isLike,
    this.totalLike,
    this.isBookmarked,
    this.isVisible,
  });

  factory PurchasedPostData.fromJson(Map<String, dynamic> json) =>
      PurchasedPostData(
        userId: json['userId'] as String? ?? '',
        username: json['username'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        postType: json['postType'] as String? ?? '',
        sharedOnPersonalFeed: json['sharedOnPersonalFeed'] as bool? ?? false,
        description: json['description'] as String? ?? '',
        postedAt: json['postedAt'],
        price: json['price'] as String? ?? '',
        postData: json['postData'] != null
            ? List<PostData>.from(
                (json['postData'] as List<dynamic>? ?? <dynamic>[])
                    .map<dynamic>((dynamic x) =>
                        PostData.fromJson(x as Map<String, dynamic>)))
            : [],
        viewCount: json['viewCount'] as String? ?? '',
        commentCount: json['commentCount'] as int? ?? 0,
        totalTipReceived: json['totalTipReceived'] as String? ?? '',
        currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
        postId: json['postId'] as String? ?? '',
        postedOn: json['postedOn'] as String? ?? '',
        allowComments: json['allowComments'] as bool? ?? false,
        allowDownload: json['allowDownload'] as bool? ?? false,
        allowShare: json['allowShare'] as bool? ?? false,
        // taggedUsers: List<dynamic>.from(json['taggedUsers'].map((x) => x)),
        isLike: json['isLike'] as int? ?? 0,
        totalLike: json['totalLike'] as int? ?? 0,
        isBookmarked: json['isBookmarked'] as int? ?? 0,
        isVisible: json['isVisible'] as int? ?? 0,
      );

  String? userId;
  String? username;
  String? firstName;
  String? lastName;
  String? profilePic;
  String? postType;
  bool? sharedOnPersonalFeed;
  String? description;
  dynamic postedAt;
  String? price;
  List<PostData>? postData;
  dynamic viewCount;
  int? commentCount;
  String? totalTipReceived;
  Currency? currency;
  String? postId;
  String? postedOn;
  bool? allowComments;
  bool? allowDownload;
  bool? allowShare;
  List<dynamic>? taggedUsers;
  int? isLike;
  int? totalLike;
  int? isBookmarked;
  int? isVisible;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId,
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'profilePic': profilePic,
        'postType': postType,
        'sharedOnPersonalFeed': sharedOnPersonalFeed,
        'description': description,
        'postedAt': postedAt,
        'price': price,
        'postData': postData,
        'viewCount': viewCount,
        'commentCount': commentCount,
        'totalTipReceived': totalTipReceived,
        'currency': currency!.toJson(),
        'postId': postId,
        'postedOn': postedOn,
        'allowComments': allowComments,
        'allowDownload': allowDownload,
        'allowShare': allowShare,
        'taggedUsers': taggedUsers,
        'isLike': isLike,
        'totalLike': totalLike,
        'isBookmarked': isBookmarked,
        'isVisible': isVisible,
      };
}
