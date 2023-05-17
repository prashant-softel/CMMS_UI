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
    this.address,
    this.city,
    this.state,
    this.country,
    this.pin,
  });

  int? id;
  String? name;
  String? address;
  String? city;
  String? state;
  String? country;
  int? pin;

  factory FacilityTypeListModel.fromJson(Map<String, dynamic> json) =>
      FacilityTypeListModel(
        id: json["id"],
        name: json["name"],
        address: json['address'],
        city: json['city'],
        state: json['state'],
        country: json['country'],
        pin: json['pin'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "city": city,
        "state": state,
        "country": country,
        "pin": pin,
      };
}
