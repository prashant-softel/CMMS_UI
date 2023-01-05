// To parse this JSON data, do
//
//     final banner = bannerFromJson(jsonString);

import 'dart:convert';

AppBanner bannerFromJson(String str) =>
    AppBanner.fromJson(json.decode(str) as Map<String, dynamic>);

String bannerToJson(AppBanner data) => json.encode(data.toJson());

class AppBanner {
  AppBanner({
    this.message,
    this.data,
  });

  factory AppBanner.fromJson(Map<String, dynamic> json) => AppBanner(
        message: json['message'] as String? ?? '',
        data: List<BannerData>.from(
            (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                (dynamic x) => BannerData.fromJson(x as Map<String, dynamic>))),
      );

  String? message;
  List<BannerData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
      };
}

class BannerData {
  BannerData({
    this.id,
    this.title,
    this.webImage,
    this.appImage,
    this.linkedWith,
    this.linkedValue,
    this.createdTs,
    this.post,
    this.user,
  });

  factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
        id: json['_id'] as String? ?? '',
        title: json['title'] as String? ?? '',
        webImage: json['webImage'] as String? ?? '',
        appImage: json['appImage'] as String? ?? '',
        linkedWith: json['linkedWith'] as String? ?? '',
        linkedValue: json['linkedValue'] as String? ?? '',
        createdTs: json['createdTs'] as int? ?? 0,
        post: json['post'] != null
            ? List<BannerPost>.from((json['post'] as List<dynamic>)
                .map<dynamic>((dynamic x) =>
                    BannerPost.fromJson(x as Map<String, dynamic>)))
            : [],
        user: json['post'] != null
            ? List<BannerUser>.from((json['user'] as List<dynamic>)
                .map<dynamic>((dynamic x) =>
                    BannerUser.fromJson(x as Map<String, dynamic>)))
            : [],
      );

  String? id;
  String? title;
  String? webImage;
  String? appImage;
  String? linkedWith;
  String? linkedValue;
  int? createdTs;
  List<BannerPost>? post;
  List<BannerUser>? user;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'title': title,
        'webImage': webImage,
        'appImage': appImage,
        'linkedWith': linkedWith,
        'linkedValue': linkedValue,
        'createdTs': createdTs,
        'post': List<dynamic>.from(post!.map<dynamic>((x) => x.toJson())),
        'user': List<dynamic>.from(user!.map<dynamic>((x) => x.toJson())),
      };
}

class BannerPost {
  BannerPost({
    this.id,
    this.description,
    this.postData,
  });

  factory BannerPost.fromJson(Map<String, dynamic> json) => BannerPost(
        id: json['_id'] as String? ?? '',
        description: json['description'] as String? ?? '',
        postData: json['postData'] != null
            ? List<BannerPostData>.from(
                (json['postData'] as List<dynamic>).map<dynamic>(
                  (dynamic x) =>
                      BannerPostData.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
      );

  String? id;
  String? description;
  List<BannerPostData>? postData;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'description': description,
        'postData':
            List<dynamic>.from(postData!.map<dynamic>((x) => x.toJson())),
      };
}

class BannerPostData {
  BannerPostData({
    this.seqId,
    this.type,
    this.url,
  });

  factory BannerPostData.fromJson(Map<String, dynamic> json) => BannerPostData(
        seqId: json['seqId'] as int? ?? 0,
        type: json['type'] as int? ?? 0,
        url: json['url'] as String? ?? '',
      );

  int? seqId;
  int? type;
  String? url;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'seqId': seqId,
        'type': type,
        'url': url,
      };
}

class BannerUser {
  BannerUser({
    this.id,
    this.userTypeCode,
    this.username,
    this.fullName,
  });

  factory BannerUser.fromJson(Map<String, dynamic> json) => BannerUser(
        id: json['_id'] as String? ?? '',
        userTypeCode: json['userTypeCode'] as int? ?? 0,
        username: json['username'] as String? ?? '',
        fullName: json['fullName'] as String? ?? '',
      );

  String? id;
  int? userTypeCode;
  String? username;
  String? fullName;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'userTypeCode': userTypeCode,
        'username': username,
        'fullName': fullName,
      };
}
