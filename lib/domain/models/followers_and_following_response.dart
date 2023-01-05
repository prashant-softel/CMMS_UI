// To parse this JSON data, do
//
//     final followersAndFollowingResponse = followersAndFollowingResponseFromJson(jsonString);

import 'dart:convert';

FollowersAndFollowingResponse followersAndFollowingResponseFromJson(
        String str) =>
    FollowersAndFollowingResponse.fromJson(
        json.decode(str) as Map<String, dynamic>);

String followersAndFollowingResponseToJson(
        FollowersAndFollowingResponse data) =>
    json.encode(data.toJson());

class FollowersAndFollowingResponse {
  FollowersAndFollowingResponse({
    this.message,
    this.data,
  });

  factory FollowersAndFollowingResponse.fromJson(Map<String, dynamic> json) =>
      FollowersAndFollowingResponse(
        message: json['message'] as String? ?? '',
        data: json['data'] != null
            ? List<FollowersAndFollowingData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                    (dynamic x) => FollowersAndFollowingData.fromJson(
                        x as Map<String, dynamic>)))
            : [],
      );

  String? message;
  List<FollowersAndFollowingData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'data': data,
      };
}

class FollowersAndFollowingData {
  FollowersAndFollowingData({
    this.userId,
    this.firstName,
    this.lastName,
    this.userType,
    this.profilePic,
    this.followAt,
    this.isFollow,
    this.username,
  });

  factory FollowersAndFollowingData.fromJson(Map<String, dynamic> json) =>
      FollowersAndFollowingData(
        userId: json['userId'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        userType: json['userType'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        followAt: json['followAt'] as int? ?? 0,
        isFollow: json['isFollow'] as int? ?? 0,
        username: json['username'] as String? ?? '',
      );

  String? userId;
  String? firstName;
  String? lastName;
  String? userType;
  String? profilePic;
  int? followAt;
  int? isFollow;
  String? username;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId == null ? null : userId,
        'firstName': firstName == null ? null : firstName,
        'lastName': lastName == null ? null : lastName,
        'userType': userType == null ? null : userType,
        'profilePic': profilePic == null ? null : profilePic,
        'followAt': followAt == null ? null : followAt,
        'isFollow': isFollow == null ? null : isFollow,
        'username': username == null ? null : username,
      };
}