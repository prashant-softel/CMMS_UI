// To parse this JSON data, do
//
//     final reportReasonsResponse = reportReasonsResponseFromJson(jsonString);

import 'dart:convert';

ReportReasonsResponse reportReasonsResponseFromJson(String str) => ReportReasonsResponse.fromJson(json.decode(str)as Map<String,dynamic>);

String reportReasonsResponseToJson(ReportReasonsResponse data) => json.encode(data.toJson());

class ReportReasonsResponse {
  ReportReasonsResponse({
    this.message,
    this.data,
  });

  factory ReportReasonsResponse.fromJson(Map<String, dynamic> json) => ReportReasonsResponse(
    message: json['message'] as String? ?? '',
    data: json['data'] != null
        ? List<ReasonsData>.from(
        (json['data'] as List<dynamic>? ?? <dynamic>[])
            .map<dynamic>((dynamic x) =>
            ReasonsData.fromJson(x as Map<String, dynamic>)))
        : [],
  );

  String? message;
  List<ReasonsData>? data;

  Map<String, dynamic> toJson() => <String,dynamic>{
    'message': message == null ? null : message,
    'data': data,
  };
}

class ReasonsData {
  ReasonsData({
    this.id,
    this.userType,
    this.status,
    this.statusMsg,
    this.reason,
  });

  factory ReasonsData.fromJson(Map<String, dynamic> json) => ReasonsData(
    id: json['_id'] as String? ?? '',
    userType: json['userType'] as int? ?? 0,
    status: json['status'] as int? ?? 0,
    statusMsg: json['statusMsg'] as String? ?? '',
    reason: json['reason'] as String? ?? '',
  );

  String? id;
  int? userType;
  int? status;
  String? statusMsg;
  String? reason;

  Map<String, dynamic> toJson() => <String,dynamic>{
    '_id': id == null ? null : id,
    'userType': userType == null ? null : userType,
    'status': status == null ? null : status,
    'statusMsg': statusMsg == null ? null : statusMsg,
    'reason': reason == null ? null : reason,
  };
}
