// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

List<LinkedJobsToPermitModel> linkedJobsToPermitModelFromJson(String str) => List<LinkedJobsToPermitModel>.from(
    json.decode(str).map((x) => LinkedJobsToPermitModel.fromJson(x)));

String linkedJobsToPermitModelToJson(List<LinkedJobsToPermitModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LinkedJobsToPermitModel {
  LinkedJobsToPermitModel({
    this.jobId,
    this.permitId,
    this.title,
    this.equipmentCat,
    this.equipment,
    this.breakdownTime,
    this.assignedTo,
    this.status,
    this.status_short,
  });

  int? jobId;
  int? permitId;
  String? title;
  String? equipmentCat;
  String? equipment;
  DateTime? breakdownTime;
  String? assignedTo;
  int? status;
  String? status_short;

  factory LinkedJobsToPermitModel.fromJson(Map<String, dynamic> json) => LinkedJobsToPermitModel(
        jobId: json['jobId'] == null ? 0 : json['jobId'],
        permitId: json["permitId"] == null ? 0 : json["permitId"],
        title: json["title"] == null ? '' : json["title"],
        equipmentCat:json["equipmentCat"] == null ? '' : json["equipmentCat"],
        equipment: json["equipment"] == null ? '' : json["equipment"],
         breakdownTime: json['breakdownTime'] == null
            ? DateTime.now()
            : DateTime.parse(json['breakdownTime'] as String),
        assignedTo: json["assignedTo"] == null ? '' : json["assignedTo"],
        status: json['status'] == null ? 0 : json['status'],
        status_short: json['status_short'] == null ? '' : json['status_short'],
        

      );

  Map<String, dynamic> toJson() => {
        "jobId": jobId,
        "permitId": permitId,
        "title": title,
        "equipmentCat": equipmentCat,
        "equipment": equipment,
        "breakdownTime": breakdownTime?.toIso8601String(),
        "assignedTo": assignedTo,
        "status": status,
        "status_short": status_short,
      };
}


