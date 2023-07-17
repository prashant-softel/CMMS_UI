// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<BlockTypeListModel> BlockTypeListModelFromJson(String str) =>
    List<BlockTypeListModel>.from(
        json.decode(str).map((x) => BlockTypeListModel.fromJson(x)));

String BockTypeListModelToJson(List<BlockTypeListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlockTypeListModel {
  BlockTypeListModel({
    this.id,
    this.name,
    this.spv,
    this.address,
    this.city,
    this.state,
    this.country,
    this.pin,
  });

  int? id;
  String? name;
  String? address;
  String? spv;
  String? city;
  String? state;
  String? country;
  int? pin;

  factory BlockTypeListModel.fromJson(Map<String, dynamic> json) =>
      BlockTypeListModel(
        id: json["id"],
        name: json["name"],
        address: json['address'],
        spv: json['spv'],
        city: json['city'],
        state: json['state'],
        country: json['country'],
        pin: json['pin'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    "address": address,
    "spv": spv,
        "city": city,
        "state": state,
        "country": country,
        "pin": pin,
      };
}
