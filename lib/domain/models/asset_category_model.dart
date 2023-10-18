// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<AssetCategoryModel> AssetCategoryModelFromJson(String str) =>
    List<AssetCategoryModel>.from(
        json.decode(str).map((x) => AssetCategoryModel.fromJson(x)));

String AssetCategoryModelToJson(List<AssetCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AssetCategoryModel {
  AssetCategoryModel({
    this.id,
    this.name,
    // this.description,
  });

  int? id;
  String? name;
  // String? description;

  factory AssetCategoryModel.fromJson(Map<String, dynamic> json) =>
      AssetCategoryModel(
        id: json["id"],
        name: json["cat_name"],
        // description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        // "description": description,
      };
}
