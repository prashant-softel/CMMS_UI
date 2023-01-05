// To parse this JSON data, do
//
//     final getPreSignedUrlResponse = getPreSignedUrlResponseFromJson(jsonString);

import 'dart:convert';

GetPreSignedUrlResponse getPreSignedUrlResponseFromJson(String str) =>
    GetPreSignedUrlResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String getPreSignedUrlResponseToJson(GetPreSignedUrlResponse data) =>
    json.encode(data.toJson());

class GetPreSignedUrlResponse {
  GetPreSignedUrlResponse({
    this.message,
    this.data,
  });

  factory GetPreSignedUrlResponse.fromJson(Map<String, dynamic> json) =>
      GetPreSignedUrlResponse(
        message: json['message'] as String? ?? '',
        data: json['data'] == null
            ? null
            : PreSignedData.fromJson(json['data'] as Map<String, dynamic>),
      );

  String? message;
  PreSignedData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'data': data,
      };
}

class PreSignedData {
  PreSignedData({
    this.preSignUrl,
  });

  factory PreSignedData.fromJson(Map<String, dynamic> json) => PreSignedData(
        preSignUrl: json['presignUrl'] as String? ?? '',
      );

  String? preSignUrl;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'presignUrl': preSignUrl == null ? null : preSignUrl,
      };
}
