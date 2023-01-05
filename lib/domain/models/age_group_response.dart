// To parse this JSON data, do
//
//     final ageGroupResponse = ageGroupResponseFromJson(jsonString);

import 'dart:convert';

AgeGroupResponse ageGroupResponseFromJson(String str) =>
    AgeGroupResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String ageGroupResponseToJson(AgeGroupResponse data) =>
    json.encode(data.toJson());

class AgeGroupResponse {
  AgeGroupResponse({
    this.message,
    this.data,
    this.totalCount,
  });

  factory AgeGroupResponse.fromJson(Map<String, dynamic> json) =>
      AgeGroupResponse(
        message: json['message'] as String? ?? '',
        data: json['data'] != null
            ? List<AgeGroupData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                    (dynamic x) =>
                        AgeGroupData.fromJson(x as Map<String, dynamic>)))
            : [],
        totalCount: json['totalCount'] as int? ?? 0,
      );

  String? message;
  List<AgeGroupData>? data;
  int? totalCount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'data': data,
        'totalCount': totalCount == null ? null : totalCount,
      };
}

class AgeGroupData {
  AgeGroupData({
    this.id,
    this.ageGroup,
    this.fromAge,
    this.toAge,
    this.createdOnTimestamp,
    this.ordering,
    this.createdOnDate,
    this.subjectCount,
  });

  factory AgeGroupData.fromJson(Map<String, dynamic> json) => AgeGroupData(
        id: json['_id'] as String? ?? '',
        ageGroup: json['ageGroup'] as String? ?? '',
        fromAge: json['fromAge'] as int? ?? 0,
        toAge: json['toAge'] as int? ?? 0,
        createdOnTimestamp: json['createdOnTimestamp'] as int? ?? 0,
        ordering: json['ordering'] as int? ?? 0,
        createdOnDate: json['createdOnDate'] as String? ?? '',
        subjectCount: json['subjectCount'] as int? ?? 0,
      );

  String? id;
  String? ageGroup;
  int? fromAge;
  int? toAge;
  int? createdOnTimestamp;
  int? ordering;
  String? createdOnDate;
  int? subjectCount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id == null ? null : id,
        'ageGroup': ageGroup == null ? null : ageGroup,
        'fromAge': fromAge == null ? null : fromAge,
        'toAge': toAge == null ? null : toAge,
        'createdOnTimestamp':
            createdOnTimestamp == null ? null : createdOnTimestamp,
        'ordering': ordering == null ? null : ordering,
        'createdOnDate': createdOnDate,
        'subjectCount': subjectCount == null ? null : subjectCount,
      };
}
