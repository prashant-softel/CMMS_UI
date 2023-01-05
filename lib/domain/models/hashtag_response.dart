// To parse this JSON data, do
//
//     final hashtagResponse = hashtagResponseFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/domain/domain.dart';

HashtagResponse hashtagResponseFromJson(String str) =>
    HashtagResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String hashtagResponseToJson(HashtagResponse data) =>
    json.encode(data.toJson());

class HashtagResponse {
  HashtagResponse({
    this.recordsTotal,
    this.result,
  });

  factory HashtagResponse.fromJson(Map<String, dynamic> json) =>
      HashtagResponse(
        recordsTotal: json['recordsTotal'] as int? ?? 0,
        result: json['result'] != null
            ? List<Result>.from(
                (json['result'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                    (dynamic x) => Result.fromJson(x as Map<String, dynamic>)))
            : [],
      );

  int? recordsTotal;
  List<Result>? result;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'recordsTotal': recordsTotal,
        'result': List<dynamic>.from(result!.map<dynamic>((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.name,
    this.noOfPost,
    this.posts,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json['name'] as String? ?? '',
        noOfPost: json['noOfPost'] as int? ?? 0,
        posts: List<Post>.from((json['posts'] as List<dynamic>? ?? <dynamic>[])
            .map<dynamic>(
                (dynamic x) => Post.fromJson(x as Map<String, dynamic>))),
      );

  String? name;
  int? noOfPost;
  List<Post>? posts;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'noOfPost': noOfPost,
        'posts': List<dynamic>.from(posts!.map<dynamic>((x) => x.toJson())),
      };
}

class Post {
  Post({
    this.postId,
    this.description,
    this.userId,
    this.postType,
    this.postTypeText,
    this.price,
    this.creationTs,
    this.status,
    this.currency,
    this.hashTags,
    this.postData,
    this.mediaType,
    this.isVisible,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        postId: json['postId'] as String? ?? '',
        description: json['description'] as String? ?? '',
        userId: json['userId'] as String? ?? '',
        postType: json['postType'] as String? ?? '',
        postTypeText: json['postTypeText'] as String? ?? '',
        price: json['price'] as int? ?? 0,
        creationTs: json['creationTs'] as int? ?? 0,
        status: json['status'] as int? ?? 0,
        currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
        hashTags: List<String>.from(
            (json['hashTags'] as List<dynamic>? ?? <dynamic>[])
                .map<dynamic>((dynamic x) => x)),
        postData: List<PostData>.from(
            (json['postData'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                (dynamic x) => PostData.fromJson(x as Map<String, dynamic>))),
        mediaType: json['mediaType'] as int? ?? 0,
        isVisible: json['isVisible'] as int? ?? 0,
      );

  String? postId;
  String? description;
  String? userId;
  String? postType;
  String? postTypeText;
  int? price;
  int? creationTs;
  int? status;
  Currency? currency;
  List<String>? hashTags;
  List<PostData>? postData;
  int? mediaType;
  int? isVisible;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'postId': postId,
        'description': description,
        'userId': userId,
        'postType': postType,
        'postTypeText': postTypeText,
        'price': price,
        'creationTs': creationTs,
        'status': status,
        'currency': currency!.toJson(),
        'hashTags': List<dynamic>.from(hashTags!.map<dynamic>((x) => x)),
        'postData':
            List<dynamic>.from(postData!.map<dynamic>((x) => x.toJson())),
        'mediaType': mediaType,
        'isVisible': isVisible,
      };
}
