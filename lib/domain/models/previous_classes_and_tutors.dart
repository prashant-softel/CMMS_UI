// To parse this JSON data, do
//
//     final previousClassAndTutor = previousClassAndTutorFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/domain/domain.dart';

PreviousClassAndTutor previousClassAndTutorFromJson(String str) =>
    PreviousClassAndTutor.fromJson(json.decode(str) as Map<String, dynamic>);

String previousClassAndTutorToJson(PreviousClassAndTutor data) =>
    json.encode(data.toJson());

class PreviousClassAndTutor {
  PreviousClassAndTutor({
    this.message,
    this.data,
  });

  factory PreviousClassAndTutor.fromJson(Map<String, dynamic> json) =>
      PreviousClassAndTutor(
        message: json['message'] as String? ?? '',
        data: json['data'] == null
            ? null
            : PreviousClassAndTutorData.fromJson(
                json['data'] as Map<String, dynamic>),
      );

  String? message;
  PreviousClassAndTutorData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'data': data,
      };
}

class PreviousClassAndTutorData {
  PreviousClassAndTutorData({
    this.previousClasses,
    this.previousTutors,
  });

  factory PreviousClassAndTutorData.fromJson(Map<String, dynamic> json) =>
      PreviousClassAndTutorData(
        previousClasses: json['previousClasses'] == null
            ? []
            : List<PreviousClassData>.from(
                (json['previousClasses'] as List<dynamic>? ?? <dynamic>[])
                    .map<dynamic>((dynamic x) =>
                        PreviousClassData.fromJson(x as Map<String, dynamic>))),
        previousTutors: json['previousTutors'] == null
            ? []
            : List<PreviousTutorr>.from(
                (json['previousTutors'] as List<dynamic>? ?? <dynamic>[])
                    .map<dynamic>((dynamic x) =>
                        PreviousTutorr.fromJson(x as Map<String, dynamic>))),
      );

  List<PreviousClassData>? previousClasses;
  List<PreviousTutorr>? previousTutors;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'previousClasses': previousClasses,
        'previousTutors': previousTutors,
      };
}
