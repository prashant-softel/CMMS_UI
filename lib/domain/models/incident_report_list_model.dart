// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<IncidentReportListModel> incidentReportListModelFromJson(String str) =>
    List<IncidentReportListModel>.from(
        json.decode(str).map((x) => IncidentReportListModel.fromJson(x)));

String incidentReportListModelToJson(List<IncidentReportListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IncidentReportListModel {
  IncidentReportListModel({
    this.id,
    this.title,
    this.description,
    this.equipment_name,
    this.facility_name,
    this.type_of_job,
    this.location_of_incident,
    this.incident_datetime,
    this.block_name,
    this.severity,
    this.risk_level,
    this.approved_by,
    this.approved_at,
    this.reported_at,
    this.reported_by_name,
    this.created_at,
    this.status_short,
    this.status,
  });

  int? id;
  String? title;
  String? description;
  String? equipment_name;
  String? facility_name;
  dynamic? type_of_job;
  dynamic? location_of_incident;
  String? incident_datetime;
  String? block_name;
  String? severity;
  int? risk_level;
  String? approved_by;
  String? approved_at;
  String? reported_at;
  String? reported_by_name;
  DateTime? created_at;
  int? status;
  String? status_short;

  factory IncidentReportListModel.fromJson(Map<String, dynamic> json) =>
      IncidentReportListModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        equipment_name: json["equipment_name"],
        facility_name: json["facility_name"],
        type_of_job: json["type_of_job"],
        location_of_incident: json["location_of_incident"],
        incident_datetime: json["incident_datetime"],
        block_name: json["block_name"],
        severity: json["severity"],
        risk_level: json["risk_level"],
        approved_by: json["approved_by"],
        approved_at: Utility.getFormatedyearMonthDay(json['approved_at']),
        reported_at: Utility.getFormatedyearMonthDay(json['reported_at']),
        reported_by_name: json["reported_by_name"] ?? null,
        created_at: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        status: json["status"],
        status_short: json["status_short"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "equipment_name": equipment_name,
        "facility_name": facility_name,
        "type_of_job": type_of_job,
        "location_of_incident": location_of_incident,
        "incident_datetime": incident_datetime,
        "block_name": block_name,
        "severity": severity,
        "risk_level": risk_level,
        "approved_by": approved_by,
        "approved_at": approved_at,
        "reported_at": reported_at,
        "reported_by_name": reported_by_name,
        "created_at": created_at?.toIso8601String(),
        "status": status,
        "status_short": status_short,
      };
}
