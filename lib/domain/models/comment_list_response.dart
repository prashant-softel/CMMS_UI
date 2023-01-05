// To parse this JSON data, do
//
//     final commentListResponse = commentListResponseFromJson(jsonString);

import 'dart:convert';

CommentListResponse commentListResponseFromJson(String str) =>
    CommentListResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String commentListResponseToJson(CommentListResponse data) =>
    json.encode(data.toJson());

class CommentListResponse {
  CommentListResponse({
    this.data,
    this.totalCount,
    this.message,
  });

  factory CommentListResponse.fromJson(Map<String, dynamic> json) =>
      CommentListResponse(
        data: json['data'] != null
            ? List<CommentListData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                    (dynamic x) =>
                        CommentListData.fromJson(x as Map<String, dynamic>)))
            : [],
        totalCount: json['totalCount'] as int? ?? 0,
        message: json['message'] as String? ?? '',
      );

  List<CommentListData>? data;
  int? totalCount;
  String? message;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
        'totalCount': totalCount == null ? null : totalCount,
        'message': message == null ? null : message,
      };
}

class CommentListData {
  CommentListData({
    this.id,
    this.users,
    this.assetId,
    this.comments,
    this.ipAddress,
    this.city,
    this.country,
    this.latitude,
    this.longitude,
    this.timeStamp,
    this.creationTs,
    this.reason,
  });

  factory CommentListData.fromJson(Map<String, dynamic> json) =>
      CommentListData(
        id: json['_id'] as String? ?? '',
        users: json['users'] == null
            ? null
            : CommentedUserData.fromJson(json['users'] as Map<String, dynamic>),
        assetId: json['assetId'] as String? ?? '',
        comments: json['comments'] as String? ?? '',
        ipAddress: json['ipAddress'] as String? ?? '',
        city: json['city'] as String? ?? '',
        country: json['country'] as String? ?? '',
        latitude: json['latitude'],
        longitude: json['longitude'],
        timeStamp: json['timeStamp'],
        creationTs: json['creationTs'],
        reason: json['reason'] as String? ?? '',
      );

  String? id;
  CommentedUserData? users;
  String? assetId;
  String? comments;
  String? ipAddress;
  String? city;
  String? country;
  dynamic latitude;
  dynamic longitude;
  dynamic timeStamp;
  dynamic creationTs;
  String? reason;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id == null ? null : id,
        'users': users,
        'assetId': assetId == null ? null : assetId,
        'comments': comments == null ? null : comments,
        'ipAddress': ipAddress == null ? null : ipAddress,
        'city': city == null ? null : city,
        'country': country == null ? null : country,
        'latitude': latitude == null ? null : latitude,
        'longitude': longitude == null ? null : longitude,
        'timeStamp': timeStamp == null ? null : timeStamp,
        'creationTs': creationTs == null ? null : creationTs,
        'reason': reason == null ? null : reason,
      };
}

class CommentedUserData {
  CommentedUserData({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.profilePic,
    this.statusCode,
    this.userTypeCode,
    this.userTypeText,
  });

  factory CommentedUserData.fromJson(Map<String, dynamic> json) =>
      CommentedUserData(
        id: json['_id'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        username: json['username'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        statusCode: json['statusCode'] as int? ?? 0,
        userTypeCode: json['userTypeCode'] as int? ?? 0,
        userTypeText: json['userTypeText'] as String? ?? '',
      );

  String? id;
  String? firstName;
  String? lastName;
  String? username;
  String? profilePic;
  int? statusCode;
  int? userTypeCode;
  String? userTypeText;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id == null ? null : id,
        'firstName': firstName == null ? null : firstName,
        'lastName': lastName == null ? null : lastName,
        'username': username == null ? null : username,
        'profilePic': profilePic == null ? null : profilePic,
        'statusCode': statusCode == null ? null : statusCode,
        'userTypeCode': userTypeCode == null ? null : userTypeCode,
        'userTypeText': userTypeText == null ? null : userTypeText,
      };
}
