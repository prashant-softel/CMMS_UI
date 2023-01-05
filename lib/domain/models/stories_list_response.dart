// To parse this JSON data, do
//
//     final storiesListResponse = storiesListResponseFromJson(jsonString);

import 'dart:convert';

StoriesListResponse storiesListResponseFromJson(String str) =>
    StoriesListResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String storiesListResponseToJson(StoriesListResponse data) =>
    json.encode(data.toJson());

class StoriesListResponse {
  StoriesListResponse({
    this.message,
    this.data,
  });

  factory StoriesListResponse.fromJson(Map<String, dynamic> json) =>
      StoriesListResponse(
        message: json['message'] as String? ?? '',
        data: json['data'] != null
            ? List<StoriesListData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                    (dynamic x) =>
                        StoriesListData.fromJson(x as Map<String, dynamic>)))
            : [],
      );

  String? message;
  List<StoriesListData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'data': data,
      };
}

class StoriesListData {
  StoriesListData({
    this.userId,
    this.username,
    this.firstName,
    this.lastName,
    this.profilePic,
    this.totalStories,
    this.isViewed,
    this.showLoader,
  });

  factory StoriesListData.fromJson(Map<String, dynamic> json) =>
      StoriesListData(
        userId: json['userId'] as String? ?? '',
        username: json['username'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        totalStories: json['totalStories'] as int? ?? 0,
        isViewed: json['isViewed'] as int? ?? 0,
        showLoader: false,
      );

  String? userId;
  String? username;
  String? firstName;
  String? lastName;
  String? profilePic;
  int? totalStories;
  int? isViewed;
  bool? showLoader;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId == null ? null : userId,
        'username': username == null ? null : username,
        'firstName': firstName == null ? null : firstName,
        'lastName': lastName == null ? null : lastName,
        'profilePic': profilePic == null ? null : profilePic,
        'totalStories': totalStories == null ? null : totalStories,
        'isViewed': isViewed == null ? null : isViewed,
      };
}
