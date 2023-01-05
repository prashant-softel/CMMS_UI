// To parse this JSON data, do
//
//     final likeDislikeResponse = likeDislikeResponseFromJson(jsonString);

import 'dart:convert';

LikeDislikeResponse likeDislikeResponseFromJson(String str) =>
    LikeDislikeResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String likeDislikeResponseToJson(LikeDislikeResponse data) =>
    json.encode(data.toJson());

class LikeDislikeResponse {
  factory LikeDislikeResponse.fromJson(Map<String, dynamic> json) =>
      LikeDislikeResponse(
        likeDislikedata: json['result'] == null
            ? []
            : List<LikeDislikeData>.from(
                (json['result'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                    (dynamic x) =>
                        LikeDislikeData.fromJson(x as Map<String, dynamic>))),
        totalCount: json['totalCount'] as int? ?? 0,
        message: json['message'] as String? ?? '',
      );
  LikeDislikeResponse({
    this.likeDislikedata,
    this.totalCount,
    this.message,
  });

  List<LikeDislikeData>? likeDislikedata;
  int? totalCount;
  String? message;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'likeDislikedata': List<dynamic>.from(
            likeDislikedata!.map<dynamic>((x) => x.toJson())),
        'totalCount': totalCount,
        'message': message,
      };
}

class LikeDislikeData {
  factory LikeDislikeData.fromJson(Map<String, dynamic> json) =>
      LikeDislikeData(
        id: json['_id'] as String? ?? '',
        userId: json['userId'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        username: json['username'] as String? ?? '',
        creationTs: json['creationTs'] as num? ?? 0,
        userTypeCode: json['userTypeCode'] as num? ?? 0,
        email: json['email'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        statusCode: json['status_code'] as int? ?? 0,
        ipAddress: json['ipAddress'] as String? ?? '',
        city: json['city'] as String? ?? '',
        country: json['country'] as String? ?? '',
        latitude: json['latitude'] as String? ?? '',
        longitude: json['longitude'] as String? ?? '',
        userTypeText: json['userTypeText'] as String? ?? '',
        isFollow: json['isFollow'] as bool? ?? false,
      );
  LikeDislikeData({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.username,
    this.creationTs,
    this.email,
    this.profilePic,
    this.statusCode,
    this.ipAddress,
    this.city,
    this.country,
    this.latitude,
    this.longitude,
    this.isFollow,
    this.userTypeCode,
    this.userTypeText,
  });

  String? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? username;
  num? creationTs;
  num? userTypeCode;
  String? email;
  String? profilePic;
  int? statusCode;
  String? ipAddress;
  String? city;
  String? country;
  String? latitude;
  String? userTypeText;
  String? longitude;
  bool? isFollow;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'userId': userId,
        'userTypeCode': userTypeCode,
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'creationTs': creationTs,
        'email': email,
        'userTypeText': userTypeText,
        'profilePic': profilePic,
        'status_code': statusCode,
        'ipAddress': ipAddress,
        'city': city,
        'country': country,
        'latitude': latitude,
        'longitude': longitude,
        'isFollow': isFollow,
      };
}
