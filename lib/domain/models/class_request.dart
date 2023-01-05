// To parse this JSON data, do
//
//     final classRequest = classRequestFromJson(jsonString);

import 'dart:convert';

ClassRequest classRequestFromJson(String str) =>
    ClassRequest.fromJson(json.decode(str) as Map<String, dynamic>);

String classRequestToJson(ClassRequest data) => json.encode(data.toJson());

class ClassRequest {
  ClassRequest({
    this.message,
    this.data,
  });

  factory ClassRequest.fromJson(Map<String, dynamic> json) => ClassRequest(
        message: json['message'] as String? ?? '',
        data: ClassRequestData.fromJson(json['data'] as Map<String, dynamic>),
      );

  String? message;
  ClassRequestData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': data!.toJson(),
      };
}

class ClassRequestData {
  ClassRequestData({
    this.roomId,
    this.teacherData,
    this.message,
  });

  factory ClassRequestData.fromJson(Map<String, dynamic> json) =>
      ClassRequestData(
        roomId: json['room_id'] as String? ?? '',
        teacherData: json['teacher_data'],
        message: json['message'] as String? ?? '',
      );

  String? roomId;
  dynamic teacherData;
  String? message;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'room_id': roomId,
        'teacher_data': teacherData,
        'message': message,
      };
}
