// To parse this JSON data, do
//
//     final assetsResponse = assetsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/domain/domain.dart';
import 'package:flutter/material.dart';

UserAsset userAssetFromJson(String str) =>
    UserAsset.fromJson(json.decode(str) as Map<String, dynamic>);

String userAssetToJson(UserAsset data) => json.encode(data.toJson());

class UserAsset {
  UserAsset({
    this.message,
    this.result,
    this.totalCount,
  });

  factory UserAsset.fromJson(Map<String, dynamic> json) => UserAsset(
        message: json['message'] as String? ?? '',
        result: json['result'] != null
            ? List<AssetsData>.from(
                (json['result'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                    (dynamic x) =>
                        AssetsData.fromJson(x as Map<String, dynamic>)))
            : [],
        totalCount: json['totalCount'] as int? ?? 0,
      );
  String? message;
  List<AssetsData>? result;
  int? totalCount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'result': result,
        'totalCount': totalCount == null ? null : totalCount,
      };
}

class AssetsData {
  AssetsData({
    this.postId,
    this.userId,
    this.userType,
    this.postType,
    this.postTypeText,
    this.assetType,
    this.assetTypeText,
    this.price,
    this.postTo,
    this.description,
    this.sharedOnPersonalFeed,
    this.sharedOnStory,
    this.sharedOnGroupFeed,
    this.creationIsoDate,
    this.postedAt,
    this.creationTs,
    this.mediaCount,
    this.mediaType,
    this.status,
    this.statusText,
    this.details,
    this.currency,
    this.platform,
    this.hashTags,
    this.ipAddress,
    this.postData,
    this.postedOn,
    this.taggedUserIds,
    this.taggedUserData,
    this.likeCount,
    this.commentCountX,
    this.allowComments,
    this.allowDownload,
    this.allowShare,
    this.location,
    this.lat,
    this.long,
    this.numberFacet,
    this.stringFacet,
    this.isNsfw,
    this.addressName,
    this.area,
    this.city,
    this.state,
    this.country,
    this.zip,
    this.userNsfwStatus,
    this.totalTipReceived,
    this.firstName,
    this.lastName,
    this.email,
    this.profilePic,
    this.countryCode,
    this.phoneNumber,
    this.username,
    this.isLike,
    this.isBookmarked,
    this.isVisible,
    this.totalLike,
    this.commentCountY,
    this.commentCount,
    this.reportedCount,
    this.taggedUsers,
    this.globalKey,
  });

  factory AssetsData.fromJson(Map<String, dynamic> json) => AssetsData(
        globalKey: GlobalKey(),
        postId: json['postId'] as String? ?? '',
        userId: json['userId'] as String? ?? '',
        postType: json['postType'] as String? ?? '',
        postTypeText: json['postTypeText'] as String? ?? '',
        assetType: json['assetType'] as String? ?? '',
        assetTypeText: json['assetTypeText'] as String? ?? '',
        price: json['price'],
        postTo: json['postTo'] as String? ?? '',
        description: json['description'] as String? ?? '',
        sharedOnPersonalFeed: json['sharedOnPersonalFeed'] as bool? ?? false,
        sharedOnStory: json['sharedOnStory'] as bool? ?? false,
        sharedOnGroupFeed: json['sharedOnGroupFeed'] as bool? ?? false,
        creationIsoDate: json['creationIsoDate'] as String? ?? '',
        postedAt: json['postedAt'] as int? ?? 0,
        creationTs: json['creationTs'] as int? ?? 0,
        mediaCount: json['mediaCount'] as int? ?? 0,
        mediaType: json['mediaType'] as int? ?? 0,
        status: json['status'] as int? ?? 0,
        statusText: json['statusText'] as String? ?? '',
        details: json['details'] as List<dynamic>? ?? <dynamic>[],
        currency: json['currency'] == null
            ? null
            : Currency.fromJson(json['currency'] as Map<String, dynamic>),
        platform: json['platform'] as String? ?? '',
        hashTags: json['hashTags'] != null
            ? List<String>.from(json['hashTags'] as List<dynamic>)
            : [],
        ipAddress: json['ipAddress'] as String? ?? '',
        postData: json['postData'] != null
            ? List<PostData>.from(
                (json['postData'] as List<dynamic>? ?? <dynamic>[])
                    .map<dynamic>((dynamic x) =>
                        PostData.fromJson(x as Map<String, dynamic>)))
            : [],
        postedOn: json['postedOn'] as String? ?? '',
        // taggedUserIds: json['taggedUserIds'] == null
        //     ? null
        //     : List<String>.from(
        //         json['taggedUserIds'].map((dynamic x) => x) as List<dynamic>),
        taggedUserData: json['taggedUserData'],
        likeCount: json['likeCount'],
        commentCountX: json['commentCount_x'],
        allowComments: json['allowComments'] as bool? ?? false,
        allowDownload: json['allowDownload'] as bool? ?? false,
        allowShare: json['allowShare'] as bool? ?? false,
        location: json['location'] == null
            ? null
            : HashtagLocation.fromJson(
                json['location'] as Map<String, dynamic>),
        lat: json['lat'] as String? ?? '',
        long: json['long'] as String? ?? '',
        // numberFacet: json['number_facet'] == null
        //     ? null
        //     : List<dynamic>.from(
        //         json['number_facet'].map((dynamic x) => x) as List<dynamic>),
        // stringFacet: json['string_facet'] == null
        //     ? null
        //     : List<dynamic>.from(
        //         json['string_facet'].map((dynamic x) => x) as List<dynamic>),
        isNsfw: json['isNSFW'],
        addressName: json['addressName'] as String? ?? '',
        area: json['area'] as String? ?? '',
        city: json['city'] as String? ?? '',
        state: json['state'] as String? ?? '',
        country: json['country'] as String? ?? '',
        zip: json['zip'] as String? ?? '',
        userNsfwStatus: json['userNSFWStatus'],
        totalTipReceived: json['totalTipReceived'],
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        email: json['email'] as String? ?? '',
        userType: json['userType'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        countryCode: json['countryCode'] as String? ?? '',
        phoneNumber: json['phoneNumber'] as String? ?? '',
        username: json['username'] as String? ?? '',
        isLike: json['isLike'] as bool? ?? false,
        isBookmarked: json['isBookmarked'],
        isVisible: json['isVisible'],
        totalLike: json['totalLike'],
        commentCountY: json['commentCount_y'],
        commentCount: json['commentCount'] as int? ?? 0,
        reportedCount: num.tryParse(json['reportedCount'].toString()) ??
            (json['reportedCount'].toString() == 'true' ? 1 : 0),
        // reportedCount: json['reportedCount'] as double? ?? 0.0,
        taggedUsers: json['taggedUsers'] != null
            ? List<TaggedUser>.from(
                (json['postData'] as List<dynamic>? ?? <dynamic>[])
                    .map<dynamic>((dynamic x) =>
                        TaggedUser.fromJson(x as Map<String, dynamic>)))
            : [],
      );

  String? postId;
  String? userId;
  String? postType;
  String? postTypeText;
  String? assetType;
  String? assetTypeText;
  String? userType;
  dynamic price;
  String? postTo;
  String? description;
  bool? sharedOnPersonalFeed;
  bool? sharedOnStory;
  bool? sharedOnGroupFeed;
  String? creationIsoDate;
  int? postedAt;
  int? creationTs;
  int? mediaCount;
  int? mediaType;
  int? status;
  String? statusText;
  List<dynamic>? details;
  Currency? currency;
  String? platform;
  List<String>? hashTags;
  String? ipAddress;
  List<PostData>? postData;
  String? postedOn;
  List<String>? taggedUserIds;
  dynamic taggedUserData;
  dynamic likeCount;
  dynamic commentCountX;
  bool? allowComments;
  bool? allowDownload;
  bool? allowShare;
  HashtagLocation? location;
  String? lat;
  String? long;
  List<dynamic>? numberFacet;
  List<dynamic>? stringFacet;
  dynamic isNsfw;
  String? addressName;
  String? area;
  String? city;
  String? state;
  String? country;
  String? zip;
  dynamic userNsfwStatus;
  dynamic totalTipReceived;
  String? firstName;
  String? lastName;
  String? email;
  String? profilePic;
  String? countryCode;
  String? phoneNumber;
  String? username;
  bool? isLike;
  dynamic isBookmarked;
  dynamic isVisible;
  dynamic totalLike;
  dynamic commentCountY;
  int? commentCount;
  num? reportedCount;
  List<TaggedUser>? taggedUsers;
  GlobalKey? globalKey;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'postId': postId,
        'userId': userId,
        'postType': postType,
        'postTypeText': postTypeText,
        'assetType': assetType,
        'assetTypeText': assetTypeText,
        'price': price,
        'postTo': postTo,
        'description': description,
        'sharedOnPersonalFeed': sharedOnPersonalFeed,
        'sharedOnStory': sharedOnStory,
        'sharedOnGroupFeed': sharedOnGroupFeed,
        'creationIsoDate': creationIsoDate,
        'postedAt': postedAt,
        'creationTs': creationTs,
        'mediaCount': mediaCount,
        'mediaType': mediaType,
        'status': status,
        'statusText': statusText,
        'details': details,
        'currency': currency,
        'platform': platform,
        'hashTags': hashTags,
        'ipAddress': ipAddress,
        'postData': postData,
        'postedOn': postedOn,
        'taggedUserIds': taggedUserIds,
        'taggedUserData': taggedUserData,
        'userType': userType,
        'likeCount': likeCount,
        'commentCount_x': commentCountX,
        'allowComments': allowComments,
        'allowDownload': allowDownload,
        'allowShare': allowShare,
        'location': location,
        'lat': lat,
        'long': long,
        'number_facet': numberFacet,
        'string_facet': stringFacet,
        'isNSFW': isNsfw,
        'addressName': addressName,
        'area': area,
        'city': city,
        'state': state,
        'country': country,
        'zip': zip,
        'userNSFWStatus': userNsfwStatus,
        'totalTipReceived': totalTipReceived,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'profilePic': profilePic,
        'countryCode': countryCode,
        'phoneNumber': phoneNumber,
        'username': username,
        'isLike': isLike,
        'isBookmarked': isBookmarked,
        'isVisible': isVisible,
        'totalLike': totalLike,
        'commentCount_y': commentCountY,
        'commentCount': commentCount,
        'reportedCount': reportedCount,
        'taggedUsers': taggedUsers,
      };
}

class TaggedUser {
  TaggedUser({
    this.lastName,
    this.firstName,
    this.profilePic,
    this.userId,
    this.username,
  });

  factory TaggedUser.fromJson(Map<String, dynamic> json) => TaggedUser(
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
