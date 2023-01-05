// coverage:ignore-file
import 'dart:convert';

import 'package:cmms/domain/models/models.dart';

/// To parse this JSON data, do
///
///     final loginResponse = loginResponseFromJson(jsonString);
LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str) as Map<String, dynamic>);

class LoginResponse {
  LoginResponse({
    required this.message,
    required this.data,
  });
  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json['message'] as String,
        data: json['data'] != null
            ? LoginData.fromJson(json['data'] as Map<String, dynamic>)
            : null,
      );

  final String message;
  final LoginData? data;
}

class LoginData {
  LoginData({
    this.token,
    this.user,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        token: LoginToken.fromJson(json['token'] as Map<String, dynamic>),
        user: LoginUser.fromJson(json['user'] as Map<String, dynamic>),
      );

  final LoginToken? token;
  final LoginUser? user;
}

class LoginToken {
  LoginToken({
    this.accessExpireAt,
    this.accessToken,
    this.refreshToken,
  });

  factory LoginToken.fromJson(Map<String, dynamic> json) => LoginToken(
        accessExpireAt: json['accessExpireAt'] as int? ?? 0,
        accessToken: json['accessToken'] as String? ?? '',
        refreshToken: json['refreshToken'] as String? ?? '',
      );

  final int? accessExpireAt;
  final String? accessToken;
  final String? refreshToken;
}

class LoginUser {
  LoginUser({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.userTypeCode,
    this.username,
    this.referralCode,
    this.fcmTopic,
    this.socialMediaLink,
    this.streamUserId,
    this.defaultCurrency,
    this.loginVerifiredBy,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
        id: json['_id'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        email: json['email'] as String? ?? '',
        userTypeCode: json['userTypeCode'] as int? ?? 0,
        username: json['username'] as String? ?? '',
        referralCode: json['referralCode'] as String? ?? '',
        fcmTopic: json['fcmTopic'] as String? ?? '',
        // socialMediaLink: json['socialMediaLink']as String? ?? '',
        streamUserId: json['streamUserId'] as String? ?? '',
        defaultCurrency: json['defaultCurrency'] as String? ?? '',
        loginVerifiredBy: json['loginVerifiedBy'] == null
            ? null
            : LoginVerifiredBy.fromJson(
                json['loginVerifiedBy'] as Map<String, dynamic>),
      );

  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final int? userTypeCode;
  final String? username;
  final String? referralCode;
  final String? fcmTopic;
  final String? socialMediaLink;
  final String? streamUserId;
  final String? defaultCurrency;
  final LoginVerifiredBy? loginVerifiredBy;
}
