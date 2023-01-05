// To parse this JSON data, do
//
//     final subjects = subjectsFromJson(jsonString);

import 'dart:convert';

Subjects subjectsFromJson(String str) =>
    Subjects.fromJson(json.decode(str) as Map<String, dynamic>);

String subjectsToJson(Subjects data) => json.encode(data.toJson());

class Subjects {
  Subjects({
    this.message,
    this.data,
    this.totalCount,
  });
  factory Subjects.fromJson(Map<String, dynamic> json) => Subjects(
        message: json['message'] as String? ?? '',
        data: json['data'] == null
            ? []
            : List<SubjectData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                    (dynamic x) =>
                        SubjectData.fromJson(x as Map<String, dynamic>))),
        totalCount: json['totalCount'] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
        'totalCount': totalCount,
      };

  String? message;
  List<SubjectData>? data;
  int? totalCount;
}

class SubjectData {
  SubjectData({
    this.id,
    this.subject,
    this.createdOnTimestamp,
    this.createdOnDate,
    this.imageUrl,
    this.thumbnailUrl,
    this.ageGroupId,
  });

  factory SubjectData.fromJson(Map<String, dynamic> json) => SubjectData(
        id: json['_id'] as String? ?? '',
        subject: json['subject'] as String? ?? '',
        createdOnTimestamp: json['createdOnTimestamp'] as int? ?? 0,
        createdOnDate: json['createdOnDate'] as String? ?? '',
        imageUrl: json['imageUrl'] as String? ?? '',
        thumbnailUrl: json['thumbnailUrl'] as String? ?? '',
        ageGroupId: json['ageGroupId'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'subject': subject!,
        'createdOnTimestamp': createdOnTimestamp,
        'createdOnDate': createdOnDate!,
        'imageUrl': imageUrl,
        'thumbnailUrl': thumbnailUrl,
        'ageGroupId': ageGroupId,
      };

  String? id;
  String? subject;
  int? createdOnTimestamp;
  String? createdOnDate;
  String? imageUrl;
  String? thumbnailUrl;
  String? ageGroupId;
}

class Subject {
  Subject({
    this.en,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        en: json['en'] as String? ?? '',
      );

  String? en;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'en': en,
      };
}

class SubjectOne {
  SubjectOne({
    this.id,
    this.subject,
  });

  factory SubjectOne.fromJson(Map<String, dynamic> json) => SubjectOne(
        id: json['_id'] as String? ?? '',
        subject: json['subject'] as String? ?? '',
      );

  String? id;
  String? subject;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'subject': subject,
      };
}
