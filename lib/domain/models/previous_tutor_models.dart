// // To parse this JSON data, do
//

//     final previousTutorData = previousTutorDataFromJson(jsonString);

import 'dart:convert';

PreviousTutorData previousTutorDataFromJson(String str) =>
    PreviousTutorData.fromJson(json.decode(str) as Map<String, dynamic>);

String previousTutorDataToJson(PreviousTutorData data) =>
    json.encode(data.toJson());

class PreviousTutorData {
  factory PreviousTutorData.fromJson(Map<String, dynamic> json) =>
      PreviousTutorData(
        message: json['message'] as String? ?? '',
        data: json['data'] == null
            ? []
            : List<PreviousTutorr>.from((json['data'] as List<dynamic>)
                .map<dynamic>((dynamic x) =>
                    PreviousTutorr.fromJson(x as Map<String, dynamic>))),
      );
  PreviousTutorData({
    this.message,
    this.data,
  });

  String? message;
  List<PreviousTutorr>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
      };
}

class PreviousTutorr {
  factory PreviousTutorr.fromJson(Map<String, dynamic> json) => PreviousTutorr(
        id: json['_id'] as String? ?? '',
        creatorId: json['creatorId'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        subject: json['subject'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        totalRating: json['totalRating'] as num? ?? 0.0,
        ratingCount: json['ratingCount'] as num? ?? 0,
        avgRating: json['avgRating'] as num? ?? 0.0,
        subjects: json['subjects'] == null
            ? []
            : List<String>.from(json['subjects'] as List<dynamic>? ??
                <dynamic>[]
                    .map<dynamic>((dynamic x) => x as Map<String, dynamic>)),
      );
  PreviousTutorr({
    this.id,
    this.creatorId,
    this.firstName,
    this.lastName,
    this.profilePic,
    this.totalRating,
    this.ratingCount,
    this.avgRating,
    this.subjects,
    this.subject,
  });

  String? id;
  String? creatorId;
  String? firstName;
  String? lastName;
  String? profilePic;
  num? totalRating;
  num? ratingCount;
  num? avgRating;
  List<String>? subjects;
  String? subject;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'creatorId': creatorId,
        'firstName': firstName,
        'LastName': lastName,
        'profilePic': profilePic,
        'totalRating': totalRating,
        'ratingCount': ratingCount,
        'avgRating': avgRating,
        'subjects': subjects,
        'subject': subject,
      };
}
