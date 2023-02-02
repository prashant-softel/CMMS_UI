// To parse this JSON data, do
//
//     final equipment = equipmentFromJson(jsonString);

import 'dart:convert';

List<Equipment> equipmentFromJson(String str) =>
    List<Equipment>.from(json.decode(str).map((x) => Equipment.fromJson(x)));

String equipmentToJson(List<Equipment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Equipment {
  Equipment({
    this.id,
    this.facilityId,
    this.categoryId,
    this.name,
  });

  int? id;
  int? facilityId;
  int? categoryId;
  String? name;

  factory Equipment.fromJson(Map<String, dynamic> json) => Equipment(
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
