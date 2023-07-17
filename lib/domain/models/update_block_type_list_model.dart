// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<CreateBlockTypeListModel> BlockTypeListModelFromJson(String str) =>
    List<CreateBlockTypeListModel>.from(
        json.decode(str).map((x) => CreateBlockTypeListModel.fromJson(x)));

String BockTypeListModelToJson(List<CreateBlockTypeListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateBlockTypeListModel {
  CreateBlockTypeListModel({
    this.parentId,
    this.id,
    this.name,
    // this.spv,
    this.description,
    // this.city,
    // this.state,
    // this.country,
    // this.pin,
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

  factory CreateBlockTypeListModel.fromJson(Map<String, dynamic> json) =>
      CreateBlockTypeListModel(
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
