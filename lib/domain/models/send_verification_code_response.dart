// coverage:ignore-file
import 'dart:convert';

/// To parse this JSON data, do
///
///     final sendVerificationCodeResponse = sendVerificationCodeResponseFromJson(jsonString);
SendVerificationCodeResponse sendVerificationCodeResponseFromJson(String str) =>
    SendVerificationCodeResponse.fromJson(
        json.decode(str) as Map<String, dynamic>);

class SendVerificationCodeResponse {
  SendVerificationCodeResponse({
    required this.message,
    required this.data,
  });

  factory SendVerificationCodeResponse.fromJson(Map<String, dynamic> json) =>
      SendVerificationCodeResponse(
        message: json['message'] as String,
        data: json['data'] != null
            ? SendVerificationCodeData.fromJson(
                json['data'] as Map<String, dynamic>)
            : null,
      );

  final String message;
  final SendVerificationCodeData? data;
}

class SendVerificationCodeData {
  SendVerificationCodeData({
    this.expiryTime,
    this.verificationId,
  });

  factory SendVerificationCodeData.fromJson(Map<String, dynamic> json) =>
      SendVerificationCodeData(
        expiryTime: json['expiryTime'] as int? ?? 0,
        verificationId: json['verificationId'] as String? ?? '',
      );

  final int? expiryTime;
  final String? verificationId;
}
