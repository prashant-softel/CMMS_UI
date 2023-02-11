// To parse this JSON data, do
//
//     final equipment = equipmentFromJson(jsonString);

import 'dart:convert';

List<EquipmentModel> equipmentFromJson(String str) => List<EquipmentModel>.from(
    json.decode(str).map((x) => EquipmentModel.fromJson(x)));

String equipmentToJson(List<EquipmentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EquipmentModel {
  EquipmentModel({
    this.id,
    this.facilityId,
    this.categoryId,
    this.name,
  });

  int? id;
  int? facilityId;
  int? categoryId;
  String? name;

  factory EquipmentModel.fromJson(Map<String, dynamic> json) => EquipmentModel(
        id: json["id"],
        facilityId: json["facilityId"],
        categoryId: json["categoryId"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "facilityId": facilityId,
        "categoryId": categoryId,
        "name": name,
      };
}
