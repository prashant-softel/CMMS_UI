// To parse this JSON data, do
//
//     final bookmark = bookmarkFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/domain/domain.dart';

Bookmark bookmarkFromJson(String str) =>
    Bookmark.fromJson(json.decode(str) as Map<String, dynamic>);

String bookmarkToJson(Bookmark data) => json.encode(data.toJson());

class Bookmark {
  Bookmark({
    this.message,
    this.data,
  });

  factory Bookmark.fromJson(Map<String, dynamic> json) => Bookmark(
        message: json['message'] as String? ?? '',
        data: BookmarkData.fromJson(json['data'] as Map<String, dynamic>),
      );

  String? message;
  BookmarkData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': data!.toJson(),
      };
}

class BookmarkData {
  BookmarkData({
    this.totalCount,
    this.data,
  });

  factory BookmarkData.fromJson(Map<String, dynamic> json) => BookmarkData(
        totalCount: json['totalCount'] as int? ?? 0,
        data: List<BookmarkPost>.from((json['data'] as List).map<dynamic>(
            (dynamic x) => BookmarkPost.fromJson(x as Map<String, dynamic>))),
      );

  int? totalCount;
  List<BookmarkPost>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'totalCount': totalCount,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
      };
}

class BookmarkPost {
  BookmarkPost({
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
    // this.taggedUsers,
    this.isLike,
    this.totalLike,
    this.isVisible,
  });

  factory BookmarkPost.fromJson(Map<String, dynamic> json) => BookmarkPost(
        userId: json['userId'] as String? ?? '',
        username: json['username'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        postType: json['postType'] as String? ?? '',
        sharedOnPersonalFeed: json['sharedOnPersonalFeed'] as bool? ?? false,
        description: json['description'] as String? ?? '',
        postedAt: json['postedAt'] as int? ?? 0,
        price: json['price'] as String? ?? '',
        postData: List<PostData>.from((json['postData'] as List).map<dynamic>(
            (dynamic x) => PostData.fromJson(x as Map<String, dynamic>))),
        viewCount: json['viewCount'] as String? ?? '',
        commentCount: json['commentCount'],
        totalTipReceived: json['totalTipReceived'] as String? ?? '',
        currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
        postId: json['postId'] as String? ?? '',
        postedOn: json['postedOn'] as String? ?? '',
        allowComments: json['allowComments'] as bool? ?? false,
        allowDownload: json['allowDownload'] as bool? ?? false,
        allowShare: json['allowShare'] as bool? ?? false,
        // taggedUsers: List<dynamic>.from(json['taggedUsers'].map((x) => x)),
        isLike: json['isLike'],
        totalLike: json['totalLike'],
        isVisible: json['isVisible'],
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
  dynamic commentCount;
  String? totalTipReceived;
  Currency? currency;
  String? postId;
  String? postedOn;
  bool? allowComments;
  bool? allowDownload;
  bool? allowShare;
  // List<dynamic> taggedUsers;
  dynamic isLike;
  dynamic totalLike;
  dynamic isVisible;

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
        // 'taggedUsers': List<dynamic>.from(taggedUsers.map((x) => x)),
        'isLike': isLike,
        'totalLike': totalLike,
        'isVisible': isVisible,
      };
}
