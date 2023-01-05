// To parse this JSON data, do
//
//     final userLikedPostsResponse = userLikedPostsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/domain/domain.dart';

UserLikedPostsResponse userLikedPostsResponseFromJson(String str) =>
    UserLikedPostsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String userLikedPostsResponseToJson(UserLikedPostsResponse data) =>
    json.encode(data.toJson());

class UserLikedPostsResponse {
  UserLikedPostsResponse({
    this.message,
    this.data,
  });

  factory UserLikedPostsResponse.fromJson(Map<String, dynamic> json) =>
      UserLikedPostsResponse(
        message: json['message'] as String? ?? '',
        data: json['data'] != null
            ? List<UserLikedPostData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                    (dynamic x) =>
                        UserLikedPostData.fromJson(x as Map<String, dynamic>)))
            : [],
      );

  String? message;
  List<UserLikedPostData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'data': data,
      };
}

class UserLikedPostData {
  UserLikedPostData({
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
    this.isVisible,
    this.totalLike,
    this.isBookmarked,
    this.userType,
  });

  factory UserLikedPostData.fromJson(Map<String, dynamic> json) =>
      UserLikedPostData(
        userId: json['userId'] as String? ?? '',
        userType: json['userType'] as String? ?? '',
        username: json['username'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        postType: json['postType'] as String? ?? '',
        sharedOnPersonalFeed: json['sharedOnPersonalFeed'] as bool? ?? false,
        description: json['description'] as String? ?? '',
        postedAt: json['postedAt'] as int? ?? 0,
        price: json['price'],
        postData: json['postData'] != null
            ? List<PostData>.from(
                (json['postData'] as List<dynamic>? ?? <dynamic>[])
                    .map<dynamic>((dynamic x) =>
                        PostData.fromJson(x as Map<String, dynamic>)))
            : [],
        viewCount: json['viewCount'],
        commentCount: json['commentCount'],
        totalTipReceived: json['totalTipReceived'],
        currency: json['currency'] == null
            ? null
            : Currency.fromJson(json['currency'] as Map<String, dynamic>),
        postId: json['postId'] as String? ?? '',
        postedOn: json['postedOn'] as String? ?? '',
        allowComments: json['allowComments'] as bool? ?? false,
        allowDownload: json['allowDownload'] as bool? ?? false,
        allowShare: json['allowShare'] as bool? ?? false,
        // taggedUsers: json['taggedUsers'] != null
        //     ? List<String>.from(json['taggedUsers'] as List<dynamic>)
        //     : [],
        isVisible: json['isVisible'] as int? ?? 0,
        totalLike: json['totalLike'] as int? ?? 0,
        isBookmarked: json['isBookmarked'] as int? ?? 0,
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
  dynamic price;
  List<PostData>? postData;
  dynamic viewCount;
  dynamic commentCount;
  dynamic totalTipReceived;
  Currency? currency;
  String? postId;
  String? postedOn;
  String? userType;
  bool? allowComments;
  bool? allowDownload;
  bool? allowShare;
  List<String>? taggedUsers;
  int? isVisible;
  int? totalLike;
  int? isBookmarked;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId == null ? null : userId,
        'username': username == null ? null : username,
        'firstName': firstName == null ? null : firstName,
        'lastName': lastName == null ? null : lastName,
        'profilePic': profilePic == null ? null : profilePic,
        'postType': postType == null ? null : postType,
        'sharedOnPersonalFeed':
            sharedOnPersonalFeed == null ? null : sharedOnPersonalFeed,
        'description': description == null ? null : description,
        'postedAt': postedAt == null ? null : postedAt,
        'price': price == null ? null : price,
        'userType': userType == null ? null : userType,
        'postData': postData,
        'viewCount': viewCount,
        'commentCount': commentCount == null ? null : commentCount,
        'totalTipReceived': totalTipReceived == null ? null : totalTipReceived,
        'currency': currency,
        'postId': postId == null ? null : postId,
        'postedOn': postedOn == null ? null : postedOn,
        'allowComments': allowComments == null ? null : allowComments,
        'allowDownload': allowDownload == null ? null : allowDownload,
        'allowShare': allowShare == null ? null : allowShare,
        'taggedUsers': taggedUsers,
        'isVisible': isVisible == null ? null : isVisible,
        'totalLike': totalLike == null ? null : totalLike,
        'isBookmarked': isBookmarked == null ? null : isBookmarked,
      };
}
