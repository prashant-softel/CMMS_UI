// To parse this JSON data, do
//
//     final popularModelsResponse = popularModelsResponseFromJson(jsonString);

import 'dart:convert';

PopularModelsResponse popularModelsResponseFromJson(String str) =>
    PopularModelsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String popularModelsResponseToJson(PopularModelsResponse data) =>
    json.encode(data.toJson());

class PopularModelsResponse {
  PopularModelsResponse({
    this.message,
    this.data,
  });

  factory PopularModelsResponse.fromJson(Map<String, dynamic> json) =>
      PopularModelsResponse(
        message: json['message'] as String? ?? '',
        data: json['data'] != null
            ? List<PopularModelData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                    (dynamic x) =>
                        PopularModelData.fromJson(x as Map<String, dynamic>)))
            : [],
      );

  String? message;
  List<PopularModelData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'data': data,
      };
}

class PopularModelData {
  PopularModelData({
    this.id,
    this.score,
    this.userId,
    this.countryCode,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.profilePic,
    this.follow,
  });

  factory PopularModelData.fromJson(Map<String, dynamic> json) =>
      PopularModelData(
        id: json['_id'] as String? ?? '',
        score: json['score'] as double? ?? 0.0,
        userId: json['user_id'] as String? ?? '',
        countryCode: json['countryCode'] as String? ?? '',
        username: json['username'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        email: json['email'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        follow: json['follow'] as int? ?? 0,
      );

  String? id;
  double? score;
  String? userId;
  String? countryCode;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? profilePic;
  int? follow;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id == null ? null : id,
        'score': score == null ? null : score,
        'user_id': userId == null ? null : userId,
        'countryCode': countryCode == null ? null : countryCode,
        'username': username == null ? null : username,
        'firstName': firstName == null ? null : firstName,
        'lastName': lastName == null ? null : lastName,
        'email': email == null ? null : email,
        'profilePic': profilePic == null ? null : profilePic,
        'follow': follow == null ? null : follow,
      };
}
