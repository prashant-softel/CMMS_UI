// To parse this JSON data, do
//
//     final classRequestBody = classRequestBodyFromJson(jsonString);

import 'dart:convert';

ClassRequestBody classRequestBodyFromJson(String str) =>
    ClassRequestBody.fromJson(json.decode(str) as Map<String, dynamic>);

String classRequestBodyToJson(ClassRequestBody data) =>
    json.encode(data.toJson());

class ClassRequestBody {
  ClassRequestBody({
    this.parentId,
    this.childId,
    this.subjectId,
    this.learningObjective,
    this.durationInMin,
    this.homeWorkAssistance,
    this.countryCode,
    this.isScheduled,
    this.scheduledStartTime,
    this.scheduledEndTime,
    this.notes,
    this.thumbnailImg,
    this.ageGroupId,
    this.paymentMethod,
    this.paymentType,
    this.pgLinkId,
    this.attachment,
    this.teacherId,
  });

  factory ClassRequestBody.fromJson(Map<String, dynamic> json) =>
      ClassRequestBody(
        parentId: json['parentId'] as String? ?? '',
        childId: json['childId'] as String? ?? '',
        teacherId: json['teacherId'] as String? ?? '',
        subjectId: json['subjectId'] == null
            ? []
            : List<String>.from((json['subjectId'] as List<dynamic>)
                .map<dynamic>((dynamic x) => x)),
        learningObjective: json['learningObjective'] == null
            ? []
            : List<String>.from((json['learningObjective'] as List<dynamic>)
                .map<dynamic>((dynamic x) => x)),
        attachment: json['attachment'] == null
            ? []
            : List<String>.from((json['attachment'] as List<dynamic>)
                .map<dynamic>((dynamic x) => x)),
        durationInMin: json['durationInMin'] as int? ?? 0,
        homeWorkAssistance: json['homeWorkAssistance'] as bool? ?? false,
        countryCode: json['countryCode'] as String? ?? '',
        isScheduled: json['isScheduled'] as bool? ?? false,
        scheduledStartTime: json['scheduledStartTime'] as String? ?? '',
        scheduledEndTime: json['scheduledEndTime'] as String? ?? '',
        notes: json['notes'] as String? ?? '',
        thumbnailImg: json['thumbnailImg'] as String? ?? '',
        ageGroupId: json['ageGroupId'] as String? ?? '',
      );

  String? parentId;
  String? childId;
  String? teacherId;
  List<String>? subjectId;
  List<String>? learningObjective;
  List<String>? attachment;
  int? durationInMin;
  bool? homeWorkAssistance;
  String? countryCode;
  bool? isScheduled;
  String? scheduledStartTime;
  String? scheduledEndTime;
  String? notes;
  String? thumbnailImg;
  String? ageGroupId;
  String? paymentType;
  String? pgLinkId;
  String? paymentMethod;

  Map<String, dynamic> toJson() {
    var body = <String, dynamic>{};
    if (paymentType == 'WALLET') {
      body = <String, dynamic>{
        'parentId': parentId,
        'childId': childId,
        'subjectId': List<dynamic>.from(subjectId!.map<dynamic>((x) => x)),
        'learningObjective':
            List<dynamic>.from(learningObjective!.map<dynamic>((x) => x)),
        'attachment': attachment == null
            ? <dynamic>[]
            : List<dynamic>.from(attachment!.map<dynamic>((x) => x)),
        'durationInMin': durationInMin,
        'homeWorkAssistance': homeWorkAssistance,
        'countryCode': countryCode,
        'isScheduled': isScheduled,
        'scheduledStartTime': scheduledStartTime,
        'scheduledEndTime': scheduledEndTime,
        'notes': notes,
        'thumbnailImg': thumbnailImg,
        'ageGroupId': ageGroupId,
        'teacherId': teacherId,
        'paymentType': 'WALLET',
      };
    } else {
      body = <String, dynamic>{
        'parentId': parentId,
        'childId': childId,
        'subjectId': List<dynamic>.from(subjectId!.map<dynamic>((x) => x)),
        'learningObjective':
            List<dynamic>.from(learningObjective!.map<dynamic>((x) => x)),
        'attachment': attachment == null
            ? <dynamic>[]
            : List<dynamic>.from(attachment!.map<dynamic>((x) => x)),
        'durationInMin': durationInMin,
        'homeWorkAssistance': homeWorkAssistance,
        'countryCode': countryCode,
        'isScheduled': isScheduled,
        'scheduledStartTime': scheduledStartTime,
        'scheduledEndTime': scheduledEndTime,
        'notes': notes,
        'thumbnailImg': thumbnailImg,
        'ageGroupId': ageGroupId,
        'paymentType': paymentType,
        'pgLinkId': pgLinkId,
        'paymentMethod': paymentMethod,
        'teacherId': teacherId,
      };
    }
    return body;
  }
}
