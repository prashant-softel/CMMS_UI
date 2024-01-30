// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<BodyInjuredModel> bodyInjuredModelFromJson(String str) => List<BodyInjuredModel>.from(
    json.decode(str).map((x) => BodyInjuredModel.fromJson(x)));

String BodyInjuredModelToJson(List<BodyInjuredModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BodyInjuredModel {
  BodyInjuredModel({
    this.id,
    this.name,
    this.description,
  });

  int? id;
  String? name;
  String? description;

  factory BodyInjuredModel.fromJson(Map<String, dynamic> json) => BodyInjuredModel(
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
