// To parse this JSON data, do
//
//     final unreadCountRes = unreadCountResFromJson(jsonString);

import 'dart:convert';

UnreadCountRes unreadCountResFromJson(String str) =>
    UnreadCountRes.fromJson(json.decode(str) as Map<String, dynamic>);

String unreadCountResToJson(UnreadCountRes data) => json.encode(data.toJson());

class UnreadCountRes {
  factory UnreadCountRes.fromJson(Map<String, dynamic> json) => UnreadCountRes(
        message: json['message'] as String? ?? '',
        data: json['data'] == null
            ? null
            : CountData.fromJson(json['data'] as Map<String, dynamic>),
      );
  UnreadCountRes({
    this.message,
    this.data,
  });

  final String? message;
  final CountData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': data!.toJson(),
      };
}

class CountData {
  factory CountData.fromJson(Map<String, dynamic> json) => CountData(
        unReadCount: json['unReadCount'] as int? ?? 0,
      );
  CountData({
    this.unReadCount,
  });

  int? unReadCount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'unReadCount': unReadCount,
      };
}
