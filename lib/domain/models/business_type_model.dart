// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<BusinessTypeModel> BusinessTypeModelFromJson(String str) =>
    List<BusinessTypeModel>.from(
        json.decode(str).map((x) => BusinessTypeModel.fromJson(x)));

String BusinessTypeModelToJson(List<BusinessTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BusinessTypeModel {
  BusinessTypeModel({
    this.id,
    this.name,
    this.description
   

  });

  int? id;
  String? name;
  String? description;

  factory BusinessTypeModel.fromJson(Map<String, dynamic> json) => BusinessTypeModel(
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
