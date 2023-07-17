// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<IncidentRiskTypeModel> IncidentRiskTypeListModelFromJson(String str) =>
    List<IncidentRiskTypeModel>.from(
        json.decode(str).map((x) => IncidentRiskTypeModel.fromJson(x)));

String FacilityTypeListModelToJson(List<IncidentRiskTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IncidentRiskTypeModel {
  IncidentRiskTypeModel({
    this.id,
    this.name,
    this.description,
    // this.city,
    // this.state,
    // this.country,
    // this.blocks,
    // this.pin,
  });

  int? id;
  String? name;
  String? description;
  // String? city;
  // String? state;
  // String? country;
  // int? blocks;
  // int? pin;

  factory IncidentRiskTypeModel.fromJson(Map<String, dynamic> json) =>
      IncidentRiskTypeModel(
        id: json["id"],
        name: json["name"],
        description: json['description'],
        // city: json['city'],
        // state: json['state'],
        // country: json['country'],
        // blocks: json['blocks'],
        // pin: json['pin'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        // "city": city,
        // "state": state,
        // "country": country,
        // "blocks": blocks,
        // "pin": pin,
      };
}
