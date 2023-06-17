// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<IncidentReportListModel> incidentReportListModelFromJson(String str) =>
    List<IncidentReportListModel>.from(
        json.decode(str).map((x) => IncidentReportListModel.fromJson(x)));

String incidentReportListModelToJson(List<IncidentReportListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IncidentReportListModel {
  IncidentReportListModel({
    this.id,
    this.description,
    this.equipment_name,
    this.block_name,
    this.risk_level,
    this.approved_by,
    this.approved_at,
    this.reported_by_name,
    this.created_at,
    this.status,

  });

  int? id;
  String? description;
  String? equipment_name;
  String? block_name;
  int? risk_level;
  String? approved_by;
  DateTime? approved_at;
  String? reported_by_name;
  DateTime? created_at;
  String? status;



  factory IncidentReportListModel.fromJson(Map<String, dynamic> json) => IncidentReportListModel(
        id: json["id"],
        description: json["description"],
        equipment_name: json["equipment_name"],
        block_name: json["block_name"],
        risk_level: json["risk_level"],
        approved_by: json["approved_by"],
        approved_at: json['approved_at'] == null
          ? null
          : DateTime.parse(json['approved_at'] as String),
        reported_by_name: json["reported_by_name"] ?? '',
        created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
        status: json["status"],
        
        
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "equipment_name": equipment_name,
        "block_name": block_name,
        "risk_level": risk_level,
        "approved_by": approved_by,
        "approved_at": approved_at?.toIso8601String(),
        "reported_by_name": reported_by_name,
        "created_at": created_at?.toIso8601String(),
        "status": status,


      };
}
