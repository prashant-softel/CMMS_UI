// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<SPVListModel> SPVListModelFromJson(String str) => List<SPVListModel>.from(
    json.decode(str).map((x) => SPVListModel.fromJson(x)));

String SPVListModelToJson(List<SPVListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SPVListModel {
  SPVListModel({
    this.id,
    this.name,
    this.description,
  });

  int? id;
  String? name;
  String? description;

  factory SPVListModel.fromJson(Map<String, dynamic> json) => SPVListModel(
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
