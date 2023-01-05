// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

UserModel userFromJson(String str) =>
    UserModel.fromJson(json.decode(str) as Map<String, dynamic>);

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.message,
    this.data,
    this.totalCount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json['message'] as String? ?? '',
        data: json['data'] != null
            ? List<UserData>.from((json['data'] as List<dynamic>).map<dynamic>(
                (dynamic x) => UserData.fromJson(x as Map<String, dynamic>)))
            : [],
        totalCount: json['totalCount'] as int? ?? 0,
      );

  final String? message;
  final List<UserData>? data;
  final int? totalCount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
        'totalCount': totalCount,
      };
}

class UserData {
  UserData({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.profilePic,
    this.countryCode,
    this.phoneNumber,
    this.userType,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json['_id'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        email: json['email'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        countryCode: json['countryCode'] as String? ?? '',
        phoneNumber: json['phoneNumber'] as String? ?? '',
        userType: json['userType'] as String? ?? '',
      );

  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profilePic;
  final String? countryCode;
  final String? phoneNumber;
  final String? userType;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'profilePic': profilePic,
        'countryCode': countryCode,
        'phoneNumber': phoneNumber,
        'userType': userType,
      };
}
