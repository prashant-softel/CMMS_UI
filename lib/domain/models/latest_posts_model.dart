// To parse this JSON data, do
//
//     final latestPostsModel = latestPostsModelFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/domain/domain.dart';

LatestPostsModel latestPostsModelFromJson(String str) =>
    LatestPostsModel.fromJson(json.decode(str) as Map<String, dynamic>);

String latestPostsModelToJson(LatestPostsModel data) =>
    json.encode(data.toJson());

class LatestPostsModel {
  LatestPostsModel({
    this.message,
    this.data,
  });

  factory LatestPostsModel.fromJson(Map<String, dynamic> json) =>
      LatestPostsModel(
        message: json['message'] as String? ?? '',
        data: List<LatestPostData>.from(
            (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                (dynamic x) =>
                    LatestPostData.fromJson(x as Map<String, dynamic>))),
      );

  String? message;
  List<LatestPostData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
      };
}

class LatestPostData {
  LatestPostData({
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
    this.isVisible,
    this.isBookmarked,
    this.isHashtagPost,
    this.userType,
  });

  factory LatestPostData.fromJson(Map<String, dynamic> json) => LatestPostData(
        userId: json['userId'] as String? ?? '',
        username: json['username'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        userType: json['userType'] as String? ?? '',
        postType: json['postType'] as String? ?? '',
        sharedOnPersonalFeed: json['sharedOnPersonalFeed'] as bool? ?? false,
        description: json['description'] as String? ?? '',
        postedAt: json['postedAt'] as int? ?? 0,
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
        currency: json['currency'] == null
            ? null
            : Currency.fromJson(json['currency'] as Map<String, dynamic>),
        postId: json['postId'] as String? ?? '',
        postedOn: json['postedOn'] as String? ?? '',
        allowComments: json['allowComments'] as bool? ?? false,
        allowDownload: json['allowDownload'] as bool? ?? false,
        allowShare: json['allowShare'] as bool? ?? false,
        // taggedUsers: List<dynamic>.from(json['taggedUsers'].map((x) => x)),
        isLike: json['isLike'],
        totalLike: json['totalLike'],
        isVisible: json['isVisible'],
        isBookmarked: json['isBookmarked'],
        isHashtagPost: json['isHashtagPost'] as int? ?? 0,
      );

  String? userId;
  String? username;
  String? firstName;
  String? lastName;
  String? profilePic;
  String? postType;
  bool? sharedOnPersonalFeed;
  String? description;
  int? postedAt;
  String? price;
  List<PostData>? postData;
  dynamic viewCount;
  int? commentCount;
  String? totalTipReceived;
  Currency? currency;
  String? postId;
  String? userType;
  String? postedOn;
  bool? allowComments;
  bool? allowDownload;
  bool? allowShare;
  List<PopularTaggedUsers>? taggedUsers;
  dynamic isLike;
  dynamic totalLike;
  dynamic isVisible;
  dynamic isBookmarked;
  dynamic isHashtagPost;

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
        'postData':
            List<dynamic>.from(postData!.map<dynamic>((x) => x.toJson())),
        'viewCount': viewCount,
        'commentCount': commentCount,
        'totalTipReceived': totalTipReceived,
        'currency': currency!.toJson(),
        'postId': postId,
        'postedOn': postedOn,
        'allowComments': allowComments,
        'allowDownload': allowDownload,
        'allowShare': allowShare,
        'taggedUsers': List<dynamic>.from(taggedUsers!.map<dynamic>((x) => x)),
        'isLike': isLike,
        'totalLike': totalLike,
        'isVisible': isVisible,
        'isBookmarked': isBookmarked,
        'isHashtagPost': isHashtagPost,
        'userType': userType,
      };
}
