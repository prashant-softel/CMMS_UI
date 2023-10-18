// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<AssetTypeListSMModel> AssetTypeListSMModelFromJson(String str) =>
    List<AssetTypeListSMModel>.from(
        json.decode(str).map((x) => AssetTypeListSMModel.fromJson(x)));

String AssetTypeListSMModelToJson(List<AssetTypeListSMModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AssetTypeListSMModel {
  AssetTypeListSMModel({
    this.id,
    this.name,
    // this.description,
  });

  int? id;
  String? name;
  // String? description;

  factory AssetTypeListSMModel.fromJson(Map<String, dynamic> json) =>
      AssetTypeListSMModel(
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
