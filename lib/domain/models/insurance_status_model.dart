// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);S

import 'dart:convert';

List<InsuranceStatusModel> InsuranceStatusModelFromJson(String str) =>
    List<InsuranceStatusModel>.from(
        json.decode(str).map((x) => InsuranceStatusModel.fromJson(x)));

String FacilityTypeListModelToJson(List<InsuranceStatusModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InsuranceStatusModel {
  InsuranceStatusModel({
    this.id,
    this.name
  });

  int? id;
  String? name;

  factory InsuranceStatusModel.fromJson(Map<String, dynamic> json) =>
      InsuranceStatusModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
