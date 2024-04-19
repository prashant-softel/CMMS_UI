// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<CreateTbtTypeModel> businessListModelFromJson(String str) =>
    List<CreateTbtTypeModel>.from(
        json.decode(str).map((x) => CreateTbtTypeModel.fromJson(x)));

String businessListModelToJson(List<CreateTbtTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateTbtTypeModel {
  CreateTbtTypeModel({
    // this.id,
    this.title,
    this.description,
    this.isRequired,
  });

  // int? id;
  String? title;
  String? description;
  int? isRequired;

  // String? addAt;

  factory CreateTbtTypeModel.fromJson(Map<String, dynamic> json) =>
      CreateTbtTypeModel(
        // id: json["id"],
        title: json["title"],
        description: json["description"],
        isRequired: json["requires_SOP_JSA"]
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "title": title,
        "description": description,
        "requires_SOP_JSA" : isRequired
        // "addAt": addAt
      };
}
