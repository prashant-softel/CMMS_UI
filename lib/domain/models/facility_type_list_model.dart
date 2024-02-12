// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<FacilityTypeListModel> FacilityTypeListModelFromJson(String str) =>
    List<FacilityTypeListModel>.from(
        json.decode(str).map((x) => FacilityTypeListModel.fromJson(x)));

String FacilityTypeListModelToJson(List<FacilityTypeListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FacilityTypeListModel {
  FacilityTypeListModel({
    this.id,
    this.name,
    this.description,
    this.spv,
    this.address,
    this.city,
    this.state,
    this.country,
    this.pin,
    this.owner,
    this.operator,
    this.customer,
  });

  int? id;
  String? name;
  String? address;
  String? spv;
  String? description;
  String? city;
  String? state;
  String? country;
  String? owner;
  String? operator;
  String? customer;
  // int? blocks;
  int? pin;

  factory FacilityTypeListModel.fromJson(Map<String, dynamic> json) =>
      FacilityTypeListModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        address: json['address'],
        spv: json['spv'],
        city: json['city'],
        state: json['state'],
        country: json['country'],
        // blocks: json['blocks'],
        pin: json['pin'],
        owner: json['owner'],
        operator: json['operator'],
        customer: json['customer'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "address": address,
        "spv": spv,
        "city": city,
        "state": state,
        "country": country,
        "pin": pin,
        "owner": owner,
        "operator": operator,
        "customer": customer,
      };
}
