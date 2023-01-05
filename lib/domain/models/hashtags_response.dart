// To parse this JSON data, do
//
//     final hashTagsResponse = hashTagsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/domain/domain.dart';

HashTagsResponse hashTagsResponseFromJson(String str) =>
    HashTagsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String hashTagsResponseToJson(HashTagsResponse data) =>
    json.encode(data.toJson());

class HashTagsResponse {
  HashTagsResponse({
    this.message,
    this.result,
    this.totalCount,
    this.isHashtagFollow,
  });

  factory HashTagsResponse.fromJson(Map<String, dynamic> json) =>
      HashTagsResponse(
        message: json['message'] as String? ?? '',
        result: json['result'] != null
            ? List<HashTagData>.from(
                (json['result'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                    (dynamic x) =>
                        HashTagData.fromJson(x as Map<String, dynamic>)))
            : [],
        totalCount: json['totalCount'] as int? ?? 0,
        isHashtagFollow: json['isHashtagFollow'] as bool? ?? false,
      );

  String? message;
  List<HashTagData>? result;
  int? totalCount;
  bool? isHashtagFollow;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'result': result,
        'totalCount': totalCount == null ? null : totalCount,
        'isHashtagFollow': isHashtagFollow == null ? null : isHashtagFollow,
      };
}

class HashTagData {
  HashTagData({
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
    this.sharedOnStory,
    this.sharedOnGroupFeed,
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
    this.likeCount,
    this.commentCountX,
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
    this.userType,
  });

  factory HashTagData.fromJson(Map<String, dynamic> json) => HashTagData(
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
        postedAt: json['postedAt'] as int? ?? 0,
        creationTs: json['creationTs'] as int? ?? 0,
        mediaCount: json['mediaCount'] as int? ?? 0,
        mediaType: json['mediaType'] as int? ?? 0,
        status: json['status'] as int? ?? 0,
        statusText: json['statusText'] as String? ?? '',
        details: json['details'] as List<dynamic>,
        currency: json['currency'] == null
            ? null
            : Currency.fromJson(json['currency'] as Map<String, dynamic>),
        platform: json['platform'] as String? ?? '',
        hashTags: List<String>.from(
            (json['hashTags'] as List<dynamic>? ?? <dynamic>[])
                .map<dynamic>((dynamic x) => x)),
        ipAddress: json['ipAddress'] as String? ?? '',
        postData: List<PostData>.from(
            (json['postData'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                (dynamic x) => PostData.fromJson(x as Map<String, dynamic>))),
        postedOn: json['postedOn'] as String? ?? '',
        taggedUserIds: List<String>.from(
            (json['taggedUserIds'] as List<dynamic>? ?? <dynamic>[])
                .map<dynamic>((dynamic x) => x)),
        allowComments: json['allowComments'] as bool? ?? false,
        allowDownload: json['allowDownload'] as bool? ?? false,
        allowShare: json['allowShare'] as bool? ?? false,
        location: json['location'] == null
            ? null
            : HashtagLocation.fromJson(
                json['location'] as Map<String, dynamic>),
        lat: json['lat'] as String? ?? '',
        long: json['long'] as String? ?? '',
        numberFacet: List<String>.from(
            (json['number_facet'] as List<dynamic>? ?? <dynamic>[])
                .map<dynamic>((dynamic x) => x)),
        stringFacet: List<String>.from(
            (json['string_facet'] as List<dynamic>? ?? <dynamic>[])
                .map<dynamic>((dynamic x) => x)),
        isNsfw: json['isNSFW'] as bool? ?? false,
        addressName: json['addressName'] as String? ?? '',
        area: json['area'] as String? ?? '',
        city: json['city'] as String? ?? '',
        userType: json['userType'] as String? ?? '',
        state: json['state'] as String? ?? '',
        country: json['country'] as String? ?? '',
        zip: json['zip'] as String? ?? '',
        userNsfwStatus: json['userNSFWStatus'] as bool? ?? false,
        likeCount: json['likeCount'],
        commentCountX: json['commentCount_x'],
        totalTipReceived: json['totalTipReceived'],
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        email: json['email'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        countryCode: json['countryCode'] as String? ?? '',
        phoneNumber: json['phoneNumber'] as String? ?? '',
        username: json['username'] as String? ?? '',
        isLike: json['isLike'] as bool? ?? false,
        isBookmarked: num.tryParse(json['isBookmarked'].toString()) ??
            (json['isBookmarked'].toString() == 'true' ? 1 : 0),
        isVisible: json['isVisible'] as int? ?? 0,
        totalLike: json['totalLike'],
        commentCountY: json['commentCount_y'],
        commentCount: json['commentCount'] as int? ?? 0,
        reportedCount: json['reportedCount'] as num? ?? 0,
        taggedUsers: List<String>.from(
            (json['taggedUsers'] as List<dynamic>? ?? <dynamic>[])
                .map<dynamic>((dynamic x) => x)),
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
  String? userType;
  bool? sharedOnPersonalFeed;
  bool? sharedOnStory;
  bool? sharedOnGroupFeed;
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
  List<dynamic>? taggedUserIds;
  bool? allowComments;
  bool? allowDownload;
  bool? allowShare;
  HashtagLocation? location;
  String? lat;
  String? long;
  List<dynamic>? numberFacet;
  List<dynamic>? stringFacet;
  bool? isNsfw;
  String? addressName;
  String? area;
  String? city;
  String? state;
  String? country;
  String? zip;
  bool? userNsfwStatus;
  dynamic likeCount;
  dynamic commentCountX;
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
  int? isVisible;
  dynamic talLike;
  dynamic totalLike;
  dynamic commentCountY;
  int? commentCount;
  num? reportedCount;
  List<dynamic>? taggedUsers;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'postId': postId == null ? null : postId,
        'userId': userId == null ? null : userId,
        'postType': postType == null ? null : postType,
        'postTypeText': postTypeText == null ? null : postTypeText,
        'assetType': assetType == null ? null : assetType,
        'assetTypeText': assetTypeText == null ? null : assetTypeText,
        'price': price == null ? null : price,
        'postTo': postTo == null ? null : postTo,
        'description': description == null ? null : description,
        'sharedOnPersonalFeed':
            sharedOnPersonalFeed == null ? null : sharedOnPersonalFeed,
        'sharedOnStory': sharedOnStory == null ? null : sharedOnStory,
        'sharedOnGroupFeed':
            sharedOnGroupFeed == null ? null : sharedOnGroupFeed,
        'postedAt': postedAt == null ? null : postedAt,
        'creationTs': creationTs == null ? null : creationTs,
        'mediaCount': mediaCount == null ? null : mediaCount,
        'mediaType': mediaType == null ? null : mediaType,
        'status': status == null ? null : status,
        'statusText': statusText == null ? null : statusText,
        'details': details,
        'currency': currency,
        'platform': platform == null ? null : platform,
        'userType': userType == null ? null : userType,
        'hashTags': hashTags,
        'ipAddress': ipAddress == null ? null : ipAddress,
        'postData': postData,
        'postedOn': postedOn == null ? null : postedOn,
        'taggedUserIds': taggedUserIds,
        'allowComments': allowComments == null ? null : allowComments,
        'allowDownload': allowDownload == null ? null : allowDownload,
        'allowShare': allowShare == null ? null : allowShare,
        'location': location,
        'lat': lat == null ? null : lat,
        'long': long == null ? null : long,
        'number_facet': numberFacet,
        'string_facet': stringFacet,
        'isNSFW': isNsfw == null ? null : isNsfw,
        'addressName': addressName == null ? null : addressName,
        'area': area == null ? null : area,
        'city': city == null ? null : city,
        'state': state == null ? null : state,
        'country': country == null ? null : country,
        'zip': zip == null ? null : zip,
        'userNSFWStatus': userNsfwStatus == null ? null : userNsfwStatus,
        'likeCount': likeCount == null ? null : likeCount,
        'commentCount_x': commentCountX == null ? null : commentCountX,
        'totalTipReceived': totalTipReceived,
        'firstName': firstName == null ? null : firstName,
        'lastName': lastName == null ? null : lastName,
        'email': email == null ? null : email,
        'profilePic': profilePic == null ? null : profilePic,
        'countryCode': countryCode == null ? null : countryCode,
        'phoneNumber': phoneNumber == null ? null : phoneNumber,
        'username': username == null ? null : username,
        'isLike': isLike == null ? null : isLike,
        'isBookmarked': isBookmarked == null ? null : isBookmarked,
        'isVisible': isVisible == null ? null : isVisible,
        'totalLike': totalLike,
        'commentCount_y': commentCountY,
        'commentCount': commentCount == null ? null : commentCount,
        'reportedCount': reportedCount == null ? null : reportedCount,
        'taggedUsers': taggedUsers,
      };
}

class HashtagLocation {
  HashtagLocation({
    this.lat,
    this.lon,
  });

  factory HashtagLocation.fromJson(Map<String, dynamic> json) =>
      HashtagLocation(
        lat: json['lat'] == null ? null : json['lat'],
        lon: json['lon'] == null ? null : json['lon'],
      );

  dynamic lat;
  dynamic lon;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'lat': lat == null ? null : lat,
        'lon': lon == null ? null : lon,
      };
}
