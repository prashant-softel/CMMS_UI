// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<CreateBlockTypeModel> CreateBlockTypeModelFromJson(String str) =>
    List<CreateBlockTypeModel>.from(
        json.decode(str).map((x) => CreateBlockTypeModel.fromJson(x)));

String BockTypeListModelToJson(List<CreateBlockTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateBlockTypeModel {
  CreateBlockTypeModel({
    this.name,
    this.description,
    this.parentId,
    this.photoId,
  });

  String? name;
  String? description;
  int? parentId;
  int? photoId;

  factory CreateBlockTypeModel.fromJson(Map<String, dynamic> json) =>
      CreateBlockTypeModel(
        name: json["name"],
        description: json['description'],
        parentId: json['parentId'],
        photoId: json['photoId'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "parentId": parentId,
        "photoId": photoId,
      };
}
