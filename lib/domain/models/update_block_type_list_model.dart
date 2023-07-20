// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<UpdateBlockTypeListModel> BlockTypeListModelFromJson(String str) =>
    List<UpdateBlockTypeListModel>.from(
        json.decode(str).map((x) => UpdateBlockTypeListModel.fromJson(x)));

String BockTypeListModelToJson(List<UpdateBlockTypeListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UpdateBlockTypeListModel {
  UpdateBlockTypeListModel({
    this.parentId,
    this.id,
    this.name,
    // this.spv,
    this.description,
  });

  int? parentId;
  int? id;
  String? name;
  String? description;
  // String? spv;
  // String? city;
  // String? state;
  // String? country;
  // int? pin;

  factory UpdateBlockTypeListModel.fromJson(Map<String, dynamic> json) =>
      UpdateBlockTypeListModel(
        parentId: json["parentId"],
        id: json["id"],
        name: json["name"],
        description: json['description'],
        // spv: json['spv'],
        // city: json['city'],
        // state: json['state'],
        // country: json['country'],
        // pin: json['pin'],
      );

  Map<String, dynamic> toJson() => {
    "parentId": parentId,
    "id": id,
        "name": name,
    "description": description,
    // "spv": spv,
    //     "city": city,
    //     "state": state,
    //     "country": country,
    //     "pin": pin,
      };
}
