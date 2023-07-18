// To parse this JSON data, do
//
//     final CreateCreateInventoryCategoryModel = CreateCreateInventoryCategoryModelFromJson(jsonString);

import 'dart:convert';

List<CreateCreateInventoryCategoryModel> CreateCreateInventoryCategoryModelFromJson(String str) =>
    List<CreateCreateInventoryCategoryModel>.from(
        json.decode(str).map((x) => CreateCreateInventoryCategoryModel.fromJson(x)));

String CreateCreateInventoryCategoryModelToJson(List<CreateCreateInventoryCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateCreateInventoryCategoryModel {
  CreateCreateInventoryCategoryModel({
    required this.id,
    required this.name,
    this.description,
  });

  int id;
  String name;
  dynamic description;

  factory CreateCreateInventoryCategoryModel.fromJson(Map<String, dynamic> json) =>
      CreateCreateInventoryCategoryModel(
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
