// To parse this JSON
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<CreateSourceOfModel> businessTypeModelFromJson(String str) =>
    List<CreateSourceOfModel>.from(json.decode(str).map((x) => CreateSourceOfModel.fromJson(x)));

String businessTypeModelToJson(List<CreateSourceOfModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateSourceOfModel {
  CreateSourceOfModel({
    this.name,
    this.description,
  });

  String? name;
  String? description;

  factory CreateSourceOfModel.fromJson(Map<String, dynamic> json) => CreateSourceOfModel(
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
    };
  }
}


