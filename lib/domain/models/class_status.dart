// To parse this JSON data, do
//
//     final classStatus = classStatusFromJson(jsonString);

import 'dart:convert';

ClassStatus classStatusFromJson(String str) =>
    ClassStatus.fromJson(json.decode(str) as Map<String, dynamic>);

String classStatusToJson(ClassStatus data) => json.encode(data.toJson());

class ClassStatus {
  ClassStatus({
    this.message,
    this.data,
  });

  factory ClassStatus.fromJson(Map<String, dynamic> json) => ClassStatus(
        message: json['message'] as String? ?? '',
        data: ClassStatusData.fromJson(json['data'] as Map<String, dynamic>),
      );

  String? message;
  ClassStatusData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': data!.toJson(),
      };
}

class ClassStatusData {
  ClassStatusData({
    this.id,
    this.lan,
    this.timezone,
    this.parentId,
    this.childId,
    this.statusText,
    this.statusCode,
    this.subjectId,
    this.learningObjective,
    this.isScheduled,
    this.durationInMin,
    this.homeWorkAssistance,
    this.countryCode,
    this.notes,
    this.thumbnailImg,
    this.createdTs,
    this.expireTs,
    this.matchedTeachers,
    this.isCheckExpiredClass,
    this.teacherFound,
    this.endTime,
    this.remainingTs,
    this.scheduleDate,
    this.startTime,
    this.teacherId,
    this.requestRemaining,
    this.teacherDetails,
    this.orderId,
    this.chatId,
    this.virtualOrderId,
    this.paymentAmountResponse,
    this.uId,
    this.token,
    this.screenShareDetails,
    this.creatorUId,
    this.classEndsIn,
  });

  factory ClassStatusData.fromJson(Map<String, dynamic> json) =>
      ClassStatusData(
        id: json['_id'] as String? ?? '',
        lan: json['lan'] as String? ?? '',
        timezone: json['timezone'] as String? ?? '',
        creatorUId: json['creatorUid'] as String? ?? '',
        uId: json['uId'] as String? ?? '',
        token: json['token'] as String? ?? '',
        parentId: json['parentId'] as String? ?? '',
        childId: json['childId'] as String? ?? '',
        statusText: json['statusText'] as String? ?? '',
        orderId: json['orderId'] as String? ?? '',
        chatId: json['chatId'] as String? ?? '',
        virtualOrderId: json['virtual_order_id'] as String? ?? '',
        statusCode: json['statusCode'] as int? ?? 0,
        subjectId: json['subjectId'] == null
            ? []
            : List<String>.from((json['subjectId'] as List<dynamic>)
                .map<dynamic>((dynamic x) => x)),
        learningObjective: json['learningObjective'] == null
            ? []
            : List<String>.from((json['learningObjective'] as List<dynamic>)
                .map<dynamic>((dynamic x) => x)),
        isScheduled: json['isScheduled'] as bool? ?? false,
        durationInMin: json['durationInMin'] as int? ?? 0,
        homeWorkAssistance: json['homeWorkAssistance'] as bool? ?? false,
        countryCode: json['countryCode'] as String? ?? '',
        notes: json['notes'] as String? ?? '',
        thumbnailImg: json['thumbnailImg'] as String? ?? '',
        createdTs: json['createdTs'] as int? ?? 0,
        expireTs: json['expireTs'] as int? ?? 0,
        requestRemaining: ((json['requestRemaining'] as num? ?? 0) >= 0)
            ? (json['requestRemaining'] as num? ?? 0)
            : 0,
        classEndsIn: ((json['classEndsIn'] as num? ?? 0) >= 0)
            ? (json['classEndsIn'] as num? ?? 0)
            : 0,
        matchedTeachers: json['matchedTeachers'] == null
            ? []
            : List<MatchedTeacher>.from(
                (json['matchedTeachers'] as List<dynamic>).map<dynamic>(
                    (dynamic x) =>
                        MatchedTeacher.fromJson(x as Map<String, dynamic>))),
        isCheckExpiredClass: json['is_check_expired_class'] as bool? ?? false,
        teacherFound: json['teacher_found'] as bool? ?? false,
        endTime: json['end_time'] as String? ?? '',
        remainingTs: json['remaining_ts'] as int? ?? 0,
        scheduleDate: json['scheduleDate'] as String? ?? '',
        startTime: json['start_time'] as String? ?? '',
        teacherId: json['teacherId'] as String? ?? '',
        screenShareDetails: json['screenShareDetails'] == null
            ? null
            : AgoraCreds.fromJson(
                json['screenShareDetails'] as Map<String, dynamic>),
        teacherDetails: json['teacher_details'] == null
            ? null
            : TeacherDetails.fromJson(
                json['teacher_details'] as Map<String, dynamic>),
        paymentAmountResponse: json['paymentAmount'] == null
            ? null
            : PaymentAmountResponse.fromJson(
                json['paymentAmount'] as Map<String, dynamic>),
      );

  String? id;
  String? lan;
  String? timezone;
  String? parentId;
  String? childId;
  String? statusText;
  int? statusCode;
  List<String>? subjectId;
  List<String>? learningObjective;
  bool? isScheduled;
  int? durationInMin;
  bool? homeWorkAssistance;
  String? countryCode;
  String? uId;
  String? creatorUId;
  String? token;
  String? notes;
  dynamic thumbnailImg;
  int? createdTs;
  int? expireTs;
  List<MatchedTeacher>? matchedTeachers;
  bool? isCheckExpiredClass;
  bool? teacherFound;
  String? endTime;
  int? remainingTs;
  String? scheduleDate;
  String? startTime;
  String? teacherId;
  String? chatId;
  String? orderId;
  String? virtualOrderId;
  num? requestRemaining;
  num? classEndsIn;
  TeacherDetails? teacherDetails;
  PaymentAmountResponse? paymentAmountResponse;
  AgoraCreds? screenShareDetails;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'lan': lan,
        'timezone': timezone,
        'parentId': parentId,
        'childId': childId,
        'statusText': statusText,
        'statusCode': statusCode,
        'chatId': chatId,
        'orderId': orderId,
        'creatorUid': creatorUId,
        'virtual_order_id': virtualOrderId,
        'subjectId': List<dynamic>.from(subjectId!.map<dynamic>((x) => x)),
        'learningObjective':
            List<dynamic>.from(learningObjective!.map<dynamic>((x) => x)),
        'isScheduled': isScheduled,
        'durationInMin': durationInMin,
        'homeWorkAssistance': homeWorkAssistance,
        'countryCode': countryCode,
        'notes': notes,
        'thumbnailImg': thumbnailImg,
        'createdTs': createdTs,
        'expireTs': expireTs,
        'matchedTeachers': List<dynamic>.from(
            matchedTeachers!.map<dynamic>((x) => x.toJson())),
        'is_check_expired_class': isCheckExpiredClass,
        'teacher_found': teacherFound,
        'end_time': endTime,
        'remaining_ts': remainingTs,
        'scheduleDate': scheduleDate,
        'start_time': startTime,
        'teacherId': teacherId,
        'requestRemaining': requestRemaining,
        'classEndsIn': classEndsIn,
        'teacher_details': teacherDetails!.toJson(),
      };
}

class MatchedTeacher {
  MatchedTeacher({
    this.dispatchedOn,
    this.teacherId,
    this.response,
    this.statusCode,
    this.responseTimestamp,
  });

  factory MatchedTeacher.fromJson(Map<String, dynamic> json) => MatchedTeacher(
        dispatchedOn: json['dispatchedOn'] as int? ?? 0,
        teacherId: json['teacherId'] as String? ?? '',
        response: json['response'] as String? ?? '',
        statusCode: json['status_code'] as int? ?? 0,
        responseTimestamp: json['responseTimestamp'] as int? ?? 0,
      );

  int? dispatchedOn;
  String? teacherId;
  String? response;
  int? statusCode;
  int? responseTimestamp;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'dispatchedOn': dispatchedOn,
        'teacherId': teacherId,
        'response': response,
        'status_code': statusCode,
        'responseTimestamp': responseTimestamp,
      };
}

class TeacherDetails {
  TeacherDetails({this.firstName, this.lastName, this.profilePic, this.isFav});

  factory TeacherDetails.fromJson(Map<String, dynamic> json) => TeacherDetails(
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        isFav: json['isFavourite'] as num? ?? 0,
      );

  String? firstName;
  String? lastName;
  String? profilePic;
  num? isFav;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'firstName': firstName,
        'lastName': lastName,
        'profilePic': profilePic,
      };
}

class PaymentAmountResponse {
  PaymentAmountResponse({
    this.walletAmount,
    this.pgAmount,
  });

  factory PaymentAmountResponse.fromJson(Map<String, dynamic> json) =>
      PaymentAmountResponse(
        walletAmount: json['walletAmount'] as num? ?? 0,
        pgAmount: json['pgAmount'] as num? ?? 0,
      );

  num? walletAmount;
  num? pgAmount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'walletAmount': walletAmount == null ? null : walletAmount,
        'pgAmount': pgAmount == null ? null : pgAmount,
      };
}

class AgoraCreds {
  AgoraCreds({
    this.token,
    this.uid,
  });

  factory AgoraCreds.fromJson(Map<String, dynamic> json) => AgoraCreds(
        token: json['token'] as String? ?? '',
        uid: json['uid'] as String? ?? '',
      );

  String? token;
  String? uid;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'token': token,
        'uid': uid,
      };
}
