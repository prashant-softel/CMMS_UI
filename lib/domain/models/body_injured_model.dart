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
    this.bodyparts,
    this.description,
  });

  int? id;
  String? bodyparts;
  String? description;

  factory BodyInjuredModel.fromJson(Map<String, dynamic> json) => BodyInjuredModel(
        id: json["id"],
        bodyparts: json["bodyparts"],
    description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
    "bodyparts": bodyparts,
    "description": description,
      };
}
