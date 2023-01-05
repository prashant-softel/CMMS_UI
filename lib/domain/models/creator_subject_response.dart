// To parse this JSON data, do
//
//     final creatorSubject = creatorSubjectFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/domain/models/models.dart';

CreatorSubjectResponse creatorSubjectFromJson(String str) =>
    CreatorSubjectResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String creatorSubjectToJson(CreatorSubjectResponse data) =>
    json.encode(data.toJson());

class CreatorSubjectResponse {
  factory CreatorSubjectResponse.fromJson(Map<String, dynamic> json) =>
      CreatorSubjectResponse(
        message: json['message'] as String? ?? '',
        data: json['data'] == null
            ? []
            : List<CreatorSubjectData>.from((json['data'] as List<dynamic>? ??
                    <dynamic>[])
                .map<dynamic>((dynamic x) =>
                    CreatorSubjectData.fromJson(x as Map<String, dynamic>))),
      );
  CreatorSubjectResponse({
    this.message,
    this.data,
  });

  String? message;
  List<CreatorSubjectData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data':
            List<dynamic>.from(data!.map<dynamic>((dynamic x) => x.toJson())),
      };
}

class CreatorSubjectData {
  factory CreatorSubjectData.fromJson(Map<String, dynamic> json) =>
      CreatorSubjectData(
        id: json['_id'] as String? ?? '',
        subjectName: json['subjectName'] as String? ?? '',
        learningObjectives: json['learningObjectives'] == null
            ? []
            : List<LearningObjectives>.from((json['learningObjectives']
                    as List<dynamic>)
                .map<dynamic>((dynamic x) =>
                    LearningObjectives.fromJson(x as Map<String, dynamic>))),
      );
  CreatorSubjectData({
    this.id,
    this.subjectName,
    this.learningObjectives,
  });

  String? id;
  String? subjectName;
  List<LearningObjectives>? learningObjectives;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'subjectName': subjectName,
        'learningObjectives': List<dynamic>.from(
            learningObjectives!.map<dynamic>((dynamic x) => x.toJson())),
      };
}

// class CreatorLearningObjective {
//   factory CreatorLearningObjective.fromJson(Map<String, dynamic> json) =>
//       CreatorLearningObjective(
//         id: json['_id'] as String? ?? '',
//         learningObjective: json['learningObjective'] as String? ?? '',
//       );
//   CreatorLearningObjective({
//     this.id,
//     this.learningObjective,
//   });

//   String? id;
//   String? learningObjective;

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         '_id': id,
//         'learningObjective': learningObjective,
//       };
// }
