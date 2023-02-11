// To parse this JSON data, do
//
//     final inventoryCategoryModel = inventoryCategoryModelFromJson(jsonString);

import 'dart:convert';

List<InventoryCategoryModel> inventoryCategoryModelFromJson(String str) =>
    List<InventoryCategoryModel>.from(
        json.decode(str).map((x) => InventoryCategoryModel.fromJson(x)));

String inventoryCategoryModelToJson(List<InventoryCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InventoryCategoryModel {
  InventoryCategoryModel({
    required this.id,
    required this.name,
    this.description,
  });

  int id;
  String name;
  dynamic description;

  factory InventoryCategoryModel.fromJson(Map<String, dynamic> json) =>
      InventoryCategoryModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
