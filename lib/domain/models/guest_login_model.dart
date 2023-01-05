// coverage:ignore-file


import 'dart:convert';

/// To parse this JSON data, do
///
/// final guestLoginModel = guestLoginModelFromJson(jsonString);
GuestLoginModel guestLoginModelFromJson(String str) =>
    GuestLoginModel.fromJson(json.decode(str) as Map<String, dynamic>);

String guestLoginModelToJson(GuestLoginModel data) =>
    json.encode(data.toJson());

class GuestLoginModel {
  GuestLoginModel({
    required this.message,
    required this.data,
  });

  factory GuestLoginModel.fromJson(Map<String, dynamic> json) =>
      GuestLoginModel(
        message: json['message'] as String,
        data: Data.fromJson(json['data'] as Map<String, dynamic>),
      );
  final String message;
  final Data data;

  Map<String, dynamic> toJson() => <String,dynamic>{
        'message': message,
        'data': data.toJson(),
      };
}

class Data {
  Data({
    this.accessToken,
    this.refreshToken,
    this.fcmTopic,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json['accessToken'] as String? ?? '',
        refreshToken: json['refreshToken'] as String? ?? '',
        fcmTopic: json['fcmTopic'] as String? ?? '',
      );

  final String? accessToken;
  final String? refreshToken;
  final String? fcmTopic;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'fcmTopic': fcmTopic,
      };
}
