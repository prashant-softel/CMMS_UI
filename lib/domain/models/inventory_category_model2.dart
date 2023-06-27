// To parse this JSON data, do
//
//     final inventoryCategoryModel = inventoryCategoryModelFromJson(jsonString);

import 'dart:convert';

List<InventoryCategoryModel2> inventoryCategoryModel2FromJson(String str) =>
    List<InventoryCategoryModel2>.from(
        json.decode(str).map((x) => InventoryCategoryModel2.fromJson(x)));

String inventoryCategoryModel2ToJson(List<InventoryCategoryModel2> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InventoryCategoryModel2 {
  InventoryCategoryModel2({
    required this.id,
    required this.name,
    this.description,
  });

  int id;
  String name;
  dynamic description;

  factory InventoryCategoryModel2.fromJson(Map<String, dynamic> json) =>
      InventoryCategoryModel2(
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
