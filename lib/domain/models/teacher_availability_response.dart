// To parse this JSON data, do
//
//     final teacherAvailabilityResponse = teacherAvailabilityResponseFromJson(jsonString);

import 'dart:convert';

TeacherAvailabilityResponse teacherAvailabilityResponseFromJson(String str) =>
    TeacherAvailabilityResponse.fromJson(
        json.decode(str) as Map<String, dynamic>);

String teacherAvailabilityResponseToJson(TeacherAvailabilityResponse data) =>
    json.encode(data.toJson());

class TeacherAvailabilityResponse {
  TeacherAvailabilityResponse({
    this.message,
    this.data,
    this.totalCount,
  });

  factory TeacherAvailabilityResponse.fromJson(Map<String, dynamic> json) =>
      TeacherAvailabilityResponse(
        message: json['message'] as String? ?? '',
        data: json['data'] == null
            ? null
            : TeacherAvailabilityData.fromJson(
                json['data'] as Map<String, dynamic>),
        totalCount: json['total_count'] as num? ?? 0.0,
      );

  String? message;
  TeacherAvailabilityData? data;
  num? totalCount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'data': data,
        'total_count': totalCount == null ? null : totalCount,
      };
}

class TeacherAvailabilityData {
  TeacherAvailabilityData({
    this.isAvailable,
  });

  factory TeacherAvailabilityData.fromJson(Map<String, dynamic> json) =>
      TeacherAvailabilityData(
        isAvailable: json['is_available'] as bool? ?? false,
      );

  bool? isAvailable;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'is_available': isAvailable == null ? null : isAvailable,
      };
}
