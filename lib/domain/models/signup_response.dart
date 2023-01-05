import 'dart:convert';

/// To parse this JSON data, do
///
///     final signupResponse = signupResponseFromJson(jsonString);
SignupResponse signupResponseFromJson(String str) =>
    SignupResponse.fromJson(json.decode(str) as Map<String, dynamic>);

class SignupResponse {
  SignupResponse({
    required this.message,
    required this.data,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
        message: json['message'] as String,
        data: json['data'] != null
            ? SignupData.fromJson(json['data'] as Map<String, dynamic>)
            : null,
      );

  final String message;
  final SignupData? data;
}

class SignupData {
  SignupData({
    this.token,
    this.user,
  });

  factory SignupData.fromJson(Map<String, dynamic> json) => SignupData(
        token: Token.fromJson(json['token'] as Map<String, dynamic>),
        user: User.fromJson(json['user'] as Map<String, dynamic>),
      );

  final Token? token;
  final User? user;
}

class Token {
  Token({
    this.accessExpireAt,
    this.accessToken,
    this.refreshToken,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessExpireAt: json['accessExpireAt'] as int? ?? 0,
        accessToken: json['accessToken'] as String? ?? '',
        refreshToken: json['refreshToken'] as String? ?? '',
      );

  final int? accessExpireAt;
  final String? accessToken;
  final String? refreshToken;
}

class User {
  User({
    this.id,
    this.firstName,
    this.profilePic,
    this.phoneNumber,
    this.countryCode,
    this.dateOfBirth,
    this.lastName,
    this.email,
    this.username,
    this.referralCode,
    this.fcmTopic,
    this.socialMediaLink,
    this.defaultCurrency,
    this.userTypeCode,
    this.userMode,
    this.streamUserId,
    this.currencySymbol,
    this.freeCredit,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        phoneNumber: json['phoneNumber'] as String? ?? '',
        countryCode: json['countryCode'] as String? ?? '',
        dateOfBirth: json['dateOfBirth'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        email: json['email'] as String? ?? '',
        username: json['username'] as String? ?? '',
        referralCode: json['referralCode'] as String? ?? '',
        fcmTopic: json['fcmTopic'] as String? ?? '',
        socialMediaLink: json['socialMediaLink'] as String? ?? '',
        defaultCurrency: json['defaultCurrency'] as String? ?? '',
        userTypeCode: json['userTypeCode'] as int? ?? 0,
        userMode: json['userMode'] as String? ?? '',
        streamUserId: json['streamUserId'] as String? ?? '',
        currencySymbol: json['currencySymbol'] as String? ?? '',
        freeCredit: json['freeCredit'] as String? ?? '',
      );

  final String? id;
  final String? firstName;
  final String? profilePic;
  final String? phoneNumber;
  final String? countryCode;
  final String? dateOfBirth;
  final String? lastName;
  final String? email;
  final String? username;
  final String? referralCode;
  final String? fcmTopic;
  final String? socialMediaLink;
  final String? defaultCurrency;
  final int? userTypeCode;
  final String? userMode;
  final String? streamUserId;
  final String? currencySymbol;
  final String? freeCredit;
}
