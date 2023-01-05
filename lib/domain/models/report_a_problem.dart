// To parse this JSON data, do
//
//     final reportAProblemResponse = reportAProblemResponseFromJson(jsonString);

import 'dart:convert';

ReportAProblemResponse reportAProblemResponseFromJson(String str) =>
    ReportAProblemResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String reportAProblemResponseToJson(ReportAProblemResponse data) =>
    json.encode(data.toJson());

class ReportAProblemResponse {
  ReportAProblemResponse({
    this.message,
  });

  factory ReportAProblemResponse.fromJson(Map<String, dynamic> json) =>
      ReportAProblemResponse(
        message:
            json['message'] == null ? null : json['message'] as String? ?? '',
      );

  String? message;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
      };
}
