// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<CreateSPVModel> BusinessTypeModelFromJson(String str) =>
    List<CreateSPVModel>.from(
        json.decode(str).map((x) => CreateSPVModel.fromJson(x)));

String BusinessTypeModelToJson(List<CreateSPVModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateSPVModel {
  CreateSPVModel({
    // this.id,
    this.name,
    this.description,
    // this.status

  });

  // int? id;
  String? name;
  String? description;
  // int? status;

  factory CreateSPVModel.fromJson(Map<String, dynamic> json) => CreateSPVModel(
        // id: json["id"],
        name: json["name"],
      description: json["description"],
      // status: json["status"]
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "name": name,
        "description": description,
        // "status" : status
  };
}
