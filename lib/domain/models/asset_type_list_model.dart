// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<AssetTypeListModel> assetTypeListModelFromJson(String str) =>
    List<AssetTypeListModel>.from(
        json.decode(str).map((x) => AssetTypeListModel.fromJson(x)));

String assetTypeListModelToJson(List<AssetTypeListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AssetTypeListModel {
  AssetTypeListModel({
    this.id,
    this.name,
    this.description,
  });

  int? id;
  String? name;
  String? description;

  factory AssetTypeListModel.fromJson(Map<String, dynamic> json) =>
      AssetTypeListModel(
        id: json["id"],
        name: json["name"],
        description: json['jobTypeName'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "jobTypeName": description,
      };
}
