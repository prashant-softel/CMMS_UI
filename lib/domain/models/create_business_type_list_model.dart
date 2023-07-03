// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<CreateBusinessTypeListModel> businessListModelFromJson(String str) =>
    List<CreateBusinessTypeListModel>.from(
        json.decode(str).map((x) => CreateBusinessTypeListModel.fromJson(x)));

String businessListModelToJson(List<CreateBusinessTypeListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateBusinessTypeListModel {
  CreateBusinessTypeListModel({
    // this.id,
    this.name,
    this.description,
    


  });

  // int? id;
  String? name;
  String? description;
  
  // String? addAt;


  factory CreateBusinessTypeListModel.fromJson(Map<String, dynamic> json) => CreateBusinessTypeListModel(
    // id: json["id"],
    name: json["name"],
    description: json["description"],
    // addAt: json["addAt"]
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    "name": name,
    "description": description,
    // "addAt": addAt
  };
}
