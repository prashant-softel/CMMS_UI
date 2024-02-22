// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<IncidentRiskTypeModell> incidentRiskTypeModelFromJson(String str) =>
    List<IncidentRiskTypeModell>.from(
        json.decode(str).map((x) => IncidentRiskTypeModell.fromJson(x)));

String IncidentRiskTypeModelToJson(List<IncidentRiskTypeModell> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IncidentRiskTypeModell {
  IncidentRiskTypeModell({
    this.id,
    this.name,
    // this.description,
  });

  int? id;
  String? name;
  // String? description;

  factory IncidentRiskTypeModell.fromJson(Map<String, dynamic> json) =>
      IncidentRiskTypeModell(
        id: json["id"],
        name: json["incidenttype"],
        // description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "incidenttype": name,
        // "description": description,
      };
}

class GetIncidentRiskTypeModell {
  int? id;
  String? incidenttype;
  int? status;
  int? addedBy;
  String? addedAt;
  int? updatedBy;
  String? updatedAt;

  GetIncidentRiskTypeModell(
      {this.id,
      this.incidenttype,
      this.status,
      this.addedBy,
      this.addedAt,
      this.updatedBy,
      this.updatedAt});

  factory GetIncidentRiskTypeModell.fromJson(Map<String, dynamic> json) =>
      GetIncidentRiskTypeModell(
        id: json['id'],
        incidenttype: json['incidenttype'],
        status: json['status'],
        addedBy: json['addedBy'],
        addedAt: json['addedAt'],
        updatedBy: json['updatedBy'],
        updatedAt: json['updatedAt'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'incidenttype': incidenttype,
        'status': status,
        'addedBy': addedBy,
        'addedAt': addedAt,
        'updatedBy': updatedBy,
        'updatedAt': updatedAt,
      };
}
