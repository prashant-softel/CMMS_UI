// To parse this JSON data, do
//
//     final teacherCount = teacherCountFromJson(jsonString);

import 'dart:convert';

TeacherCount teacherCountFromJson(String str) =>
    TeacherCount.fromJson(json.decode(str) as Map<String, dynamic>);

String teacherCountToJson(TeacherCount data) => json.encode(data.toJson());

class TeacherCount {
  TeacherCount({
    this.message,
    this.data,
    this.totalCount,
  });

  factory TeacherCount.fromJson(Map<String, dynamic> json) => TeacherCount(
        message: json['message'] as String? ?? '',
        data: TeacherCountData.fromJson(json['data'] as Map<String, dynamic>),
        totalCount: json['total_count'] as int? ?? 0,
      );

  String? message;
  TeacherCountData? data;
  int? totalCount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': data!.toJson(),
        'total_count': totalCount,
      };
}

class TeacherCountData {
  TeacherCountData({
    this.total,
    this.weakMatch,
    this.strongMatch,
  });

  factory TeacherCountData.fromJson(Map<String, dynamic> json) =>
      TeacherCountData(
        total: json['total'] as int? ?? 0,
        weakMatch: json['weak_match'] as int? ?? 0,
        strongMatch: json['strong_match'] as int? ?? 0,
      );

  int? total;
  int? weakMatch;
  int? strongMatch;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'total': total,
        'weak_match': weakMatch,
        'strong_match': strongMatch,
      };
}
