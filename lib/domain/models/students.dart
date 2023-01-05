// To parse this JSON data, do
//
//     final students = studentsFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/domain/models/interests.dart';
import 'package:cmms/domain/models/subjects.dart';

Students studentsFromJson(String str) =>
    Students.fromJson(json.decode(str) as Map<String, dynamic>);

String studentsToJson(Students data) => json.encode(data.toJson());

class Students {
  Students({
    this.message,
    this.data,
    this.totalCount,
  });

  factory Students.fromJson(Map<String, dynamic> json) => Students(
        message: json['message'] as String? ?? '',
        data: json['data'] == null
            ? []
            : List<StudentsData>.from((json['data'] as List<dynamic>)
                .map<dynamic>((dynamic x) =>
                    StudentsData.fromJson(x as Map<String, dynamic>))),
        totalCount: json['totalCount'] as int? ?? 0,
      );

  String? message;
  List<StudentsData>? data;
  int? totalCount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
        'totalCount': totalCount,
      };
}

class StudentsData {
  StudentsData({
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.ageGroup,
    this.interests,
    this.subjects,
    this.dateOfBirth,
    this.profilePic,
    this.markAsDefault,
    this.ageGroupId,
  });

  factory StudentsData.fromJson(Map<String, dynamic> json) => StudentsData(
        id: json['_id'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        gender: json['gender'] as String? ?? '',
        ageGroup: json['ageGroup'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        dateOfBirth: json['dateOfBirth'] as String? ?? '',
        ageGroupId: json['ageGroupId'] as String? ?? '',
        markAsDefault: json['markAsDefault'] as bool? ?? false,
        // interests: json['interests'] != null
        //     ? List<String>.from((json['interests'] as List<dynamic>)
        //         .map<dynamic>((dynamic x) => x))
        //     : [],
        subjects: json['subjects'] == null
            ? []
            : List<SubjectData>.from((json['subjects'] as List<dynamic>)
                .map<dynamic>((dynamic e) =>
                    SubjectData.fromJson(e as Map<String, dynamic>))),
        interests: json['interests'] == null
            ? []
            : List<InterestData>.from((json['interests'] as List<dynamic>)
                .map<dynamic>((dynamic e) =>
                    InterestData.fromJson(e as Map<String, dynamic>))),
        // subjects: json['subjects'] != null
        //     ? List<String>.from((json['subjects'] as List<dynamic>)
        //         .map<dynamic>((dynamic x) => x))
        //     : [],
      );

  String? id;
  String? firstName;
  String? lastName;
  String? gender;
  String? ageGroup;
  String? ageGroupId;
  String? dateOfBirth;
  String? profilePic;
  bool? markAsDefault;
  List<SubjectData>? subjects;
  List<InterestData>? interests;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
        'ageGroup': ageGroup,
        'subjects': subjects,
        'interests': interests,
        'dateOfBirth': dateOfBirth,
        'profilePic': profilePic,
        'markAsDefault': markAsDefault,
        'ageGroupId': ageGroupId,
      };
}
