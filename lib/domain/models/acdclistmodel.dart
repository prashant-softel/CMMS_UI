// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<ACDCModel> AssetTypeListSMModelFromJson(String str) =>
    List<ACDCModel>.from(
        json.decode(str).map((x) => ACDCModel.fromJson(x)));

String AssetTypeListSMModelToJson(List<ACDCModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ACDCModel {
  ACDCModel({
    this.id,
    this.name,
    // this.description,
  });

  int? id;
  String? name;
  // String? description;

  factory ACDCModel.fromJson(Map<String, dynamic> json) =>
      ACDCModel(
        id: json["id"],
        name: json["asset_type"],
        // description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        // "description": description,
      };
}
