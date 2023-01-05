// To parse this JSON data, do
//
//     final reasonResponse = reasonResponseFromJson(jsonString);

import 'dart:convert';

ReasonResponse reasonResponseFromJson(String str) =>
    ReasonResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String reasonResponseToJson(ReasonResponse data) => json.encode(data.toJson());

class ReasonResponse {
  ReasonResponse({
    this.message,
    this.data,
  });

  factory ReasonResponse.fromJson(Map<String, dynamic> json) => ReasonResponse(
        message: json['message'] as String? ?? '',
        data: List<ReasonResponseData>.from((json['data'] as List).map<dynamic>(
            (dynamic x) =>
                ReasonResponseData.fromJson(x as Map<String, dynamic>))),
      );

  String? message;
  List<ReasonResponseData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
      };
}

class ReasonResponseData {
  ReasonResponseData({
    this.id,
    this.userType,
    this.status,
    this.statusMsg,
    this.reason,
  });

  factory ReasonResponseData.fromJson(Map<String, dynamic> json) =>
      ReasonResponseData(
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

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'userType': userType,
        'status': status,
        'statusMsg': statusMsg,
        'reason': reason,
      };
}
