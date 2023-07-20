// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<InsuranceProviderModel> InsuranceProviderModelFromJson(String str) =>
    List<InsuranceProviderModel>.from(
        json.decode(str).map((x) => InsuranceProviderModel.fromJson(x)));

String FacilityTypeListModelToJson(List<InsuranceProviderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InsuranceProviderModel {
  InsuranceProviderModel({
    this.id,
    this.name,
    // this.description,
    // this.city,
    // this.state,
    // this.country,
    // this.blocks,
    // this.pin,
  });

  int? id;
  String? name;
  // String? description;
  // String? city;
  // String? state;
  // String? country;
  // int? blocks;
  // int? pin;

  factory InsuranceProviderModel.fromJson(Map<String, dynamic> json) =>
      InsuranceProviderModel(
        id: json["id"],
        name: json["name"],
        // description: json['description'],
        // city: json['city'],
        // state: json['state'],
        // country: json['country'],
        // blocks: json['blocks'],
        // pin: json['pin'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        // "description": description,
        // "city": city,
        // "state": state,
        // "country": country,
        // "blocks": blocks,
        // "pin": pin,
      };
}
