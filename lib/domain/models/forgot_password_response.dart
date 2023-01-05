// coverage:ignore-file
import 'dart:convert';

/// To parse this JSON data, do
///
///     final forgotPasswordResponse = forgotPasswordResponseFromJson(jsonString);
ForgotPasswordResponse forgotPasswordResponseFromJson(String str) =>
    ForgotPasswordResponse.fromJson(json.decode(str) as Map<String, dynamic>);


class ForgotPasswordResponse {
  ForgotPasswordResponse({
    required this.message,
    required this.data,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordResponse(
        message: json['message'] as String,
        data: json['data'] != null
            ? ForgotPasswordData.fromJson(json['data'] as Map<String, dynamic>)
            : null,
      );

  final String message;
  final ForgotPasswordData? data;
}

class ForgotPasswordData {
  ForgotPasswordData({
    this.userId,
    this.verificationId,
    this.expiryTime,
  });

  factory ForgotPasswordData.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordData(
        userId: json['userId'] as String? ?? '',
        verificationId: json['verificationId'] as String? ?? '',
        expiryTime: json['expiryTime'] as int? ?? 0,
      );

  final String? userId;
  final String? verificationId;
  final int? expiryTime;
}
