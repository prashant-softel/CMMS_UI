// To parse this JSON data, do
//
//     final popularPostsResp = popularPostsRespFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/domain/domain.dart';

PopularPostsResp popularPostsRespFromJson(String str) =>
    PopularPostsResp.fromJson(json.decode(str) as Map<String, dynamic>);

String popularPostsRespToJson(PopularPostsResp data) =>
    json.encode(data.toJson());

class PopularPostsResp {
  PopularPostsResp({
    this.message,
    this.result,
    this.totalCount,
  });

  factory PopularPostsResp.fromJson(Map<String, dynamic> json) =>
      PopularPostsResp(
        message: json['message'] as String? ?? '',
        result: json['result'] != null
            ? List<PopularPostData>.from(
                (json['result'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                    (dynamic x) =>
                        PopularPostData.fromJson(x as Map<String, dynamic>)))
            : [],
        totalCount: json['totalCount'] as int? ?? 0,
      );

  String? message;
  List<PopularPostData>? result;
  int? totalCount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'result': result,
        'totalCount': totalCount == null ? null : totalCount,
      };
}

class PopularPostData {
  PopularPostData({
    this.postId,
    this.userId,
    this.postType,
    this.postTypeText,
    this.assetType,
    this.assetTypeText,
    this.price,
    this.postTo,
    this.description,
    this.sharedOnPersonalFeed,
    this.postedAt,
    this.creationTs,
    this.mediaType,
    this.status,
    this.statusText,
    this.currency,
    this.hashTags,
    this.postData,
    this.postedOn,
    this.taggedUserIds,
    this.totalTipReceived,
    this.username,
    this.firstName,
    this.lastName,
    this.profilePic,
    this.phoneNumber,
    this.countryCode,
    this.email,
    this.isLike,
    this.isBookmarked,
    this.isFollowed,
    this.isVisible,
    this.likeCount,
    this.totalLike,
    this.commentCount,
    this.taggedUsers,
    this.allowComments,
    this.allowDownload,
    this.allowShare,
    required this.userType,
  });

  factory PopularPostData.fromJson(Map<String, dynamic> json) =>
      PopularPostData(
        postId: json['postId'] as String? ?? '',
        userId: json['userId'] as String? ?? '',
        postType: json['postType'] as String? ?? '',
        userType: json['userType'] as String? ?? '',
        postTypeText: json['postTypeText'] as String? ?? '',
        assetType: json['assetType'] as String? ?? '',
        assetTypeText: json['assetTypeText'] as String? ?? '',
        price: json['price'],
        postTo: json['postTo'] as String? ?? '',
        description: json['description'] as String? ?? '',
        sharedOnPersonalFeed: json['sharedOnPersonalFeed'] as bool? ?? false,
        allowComments: json['allowComments'] as bool? ?? true,
        allowDownload: json['allowDownload'] as bool? ?? true,
        allowShare: json['allowShare'] as bool? ?? true,
        postedAt: json['postedAt'] as int? ?? 0,
        creationTs: json['creationTs'] as int? ?? 0,
        mediaType: json['mediaType'] as int? ?? 0,
        status: json['status'] as int? ?? 0,
        statusText: json['statusText'] as String? ?? '',
        currency: json['currency'] == null
            ? null
            : Currency.fromJson(json['currency'] as Map<String, dynamic>),
        hashTags: json['hashTags'] != null
            ? List<String>.from(json['hashTags'] as List<dynamic>)
            : [],
        postData: json['postData'] != null
            ? List<PostData>.from(
                (json['postData'] as List<dynamic>? ?? <dynamic>[])
                    .map<dynamic>((dynamic x) =>
                        PostData.fromJson(x as Map<String, dynamic>)))
            : [],
        postedOn: json['postedOn'] as String? ?? '',
        taggedUserIds: json['taggedUserIds'] != null
            ? List<String>.from(json['taggedUserIds'] as List<dynamic>)
            : [],
        totalTipReceived: json['totalTipReceived'],
        username: json['username'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        phoneNumber: json['phoneNumber'] as String? ?? '',
        countryCode: json['countryCode'] as String? ?? '',
        email: json['email'] as String? ?? '',
        isLike: json['isLike'],
        isBookmarked: json['isBookmarked'],
        isFollowed: json['isFollowed'] as int? ?? 0,
        isVisible: json['isVisible'] as int? ?? 0,
        likeCount: json['likeCount'],
        totalLike: json['totalLike'],
        commentCount: json['commentCount'],
        // taggedUsers: json['taggedUsers'] != null
        //     ? List<PopularTaggedUsers>.from(
        //         (json['taggedUsers'] as List<dynamic>? ?? <dynamic>[])
        //             .map<dynamic>((dynamic x) =>
        //                 PopularTaggedUsers.fromJson(x as Map<String, dynamic>)))
        //     : [],
      );

  String? postId;
  String? userId;
  String? postType;
  String? postTypeText;
  String? assetType;
  String? assetTypeText;
  dynamic price;
  String? postTo;
  String? description;
  bool? sharedOnPersonalFeed;
  bool? allowComments;
  bool? allowDownload;
  bool? allowShare;
  int? postedAt;
  int? creationTs;
  int? mediaType;
  int? status;
  String? statusText;
  Currency? currency;
  List<String>? hashTags;
  List<PostData>? postData;
  String? postedOn;
  List<String>? taggedUserIds;
  dynamic totalTipReceived;
  String? username;
  String? firstName;
  String? lastName;
  String? profilePic;
  String? phoneNumber;
  String? countryCode;
  String? email;
  String? userType;
  dynamic isLike;
  dynamic isBookmarked;
  int? isFollowed;
  int? isVisible;
  dynamic likeCount;
  dynamic totalLike;
  dynamic commentCount;
  List<PopularTaggedUsers>? taggedUsers;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'postId': postId == null ? null : postId,
        'userId': userId == null ? null : userId,
        'postType': postType == null ? null : postType,
        'postTypeText': postTypeText,
        'assetType': assetType == null ? null : assetType,
        'userType': userType == null ? null : userType,
        'assetTypeText': assetTypeText,
        'price': price,
        'postTo': postTo == null ? null : postTo,
        'description': description == null ? null : description,
        'sharedOnPersonalFeed':
            sharedOnPersonalFeed == null ? null : sharedOnPersonalFeed,
        'postedAt': postedAt == null ? null : postedAt,
        'creationTs': creationTs == null ? null : creationTs,
        'mediaType': mediaType == null ? null : mediaType,
        'status': status == null ? null : status,
        'statusText': statusText,
        'currency': currency,
        'hashTags': hashTags,
        'postData': postData,
        'postedOn': postedOn == null ? null : postedOn,
        'taggedUserIds': taggedUserIds,
        'totalTipReceived': totalTipReceived,
        'username': username == null ? null : username,
        'firstName': firstName == null ? null : firstName,
        'lastName': lastName == null ? null : lastName,
        'profilePic': profilePic == null ? null : profilePic,
        'phoneNumber': phoneNumber == null ? null : phoneNumber,
        'countryCode': countryCode == null ? null : countryCode,
        'email': email == null ? null : email,
        'isLike': isLike == null ? null : isLike,
        'isBookmarked': isBookmarked == null ? null : isBookmarked,
        'isFollowed': isFollowed == null ? null : isFollowed,
        'isVisible': isVisible == null ? null : isVisible,
        'likeCount': likeCount,
        'totalLike': totalLike == null ? null : totalLike,
        'commentCount': commentCount == null ? null : commentCount,
        'allowShare': allowShare == null ? null : allowShare,
        'allowComments': allowComments == null ? null : allowComments,
        'allowDownload': allowDownload == null ? null : allowDownload,
        'taggedUsers': taggedUsers,
      };
}

class PostData {
  PostData({
    this.seqId,
    this.type,
    this.url,
    this.thumbnail,
    this.text,
    this.bgColorCode,
    this.colorCode,
    this.mobile,
  });

  factory PostData.fromJson(Map<String, dynamic> json) => PostData(
        seqId: json['seqId'] as int? ?? 0,
        type: json['type'] as int? ?? 0,
        url: json['url'] as String? ?? '',
        thumbnail: json['thumbnail'] as String? ?? '',
        text: json['text'] as String? ?? '',
        bgColorCode: json['bgColorCode'] as String? ?? '',
        colorCode: json['colorCode'] as String? ?? '',
        mobile: json['mobile'] as String? ?? '',
      );

  int? seqId;
  int? type;
  String? url;
  String? thumbnail;
  String? text;
  String? bgColorCode;
  String? colorCode;
  String? mobile;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'seqId': seqId == null ? null : seqId,
        'type': type == null ? null : type,
        'url': url == null ? null : url,
        'thumbnail': thumbnail == null ? null : thumbnail,
        'text': text == null ? null : text,
        'bgColorCode': bgColorCode == null ? null : bgColorCode,
        'colorCode': colorCode == null ? null : colorCode,
      };
}

class PopularTaggedUsers {
  PopularTaggedUsers({
    this.lastName,
    this.firstName,
    this.profilePic,
    this.userId,
    this.username,
  });

  factory PopularTaggedUsers.fromJson(Map<String, dynamic> json) =>
      PopularTaggedUsers(
        lastName: json['lastName'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        userId: json['userId'] as String? ?? '',
        username: json['username'] as String? ?? '',
      );

  String? lastName;
  String? firstName;
  String? profilePic;
  String? userId;
  String? username;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'lastName': lastName == null ? null : lastName,
        'firstName': firstName == null ? null : firstName,
        'profilePic': profilePic == null ? null : profilePic,
        'userId': userId == null ? null : userId,
        'username': username == null ? null : username,
      };
}
