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
  FacilityTypeListModel(
      {this.id,
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
      this.cityId,
      this.countryid,
      this.customerId,
      this.operatorId,
      this.ownerId,
      this.spv_id,
      this.stateid});

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
  int? ownerId;
  int? operatorId;
  int? customerId;
  int? spv_id;
  int? cityId;
  int? stateid;
  int? countryid;

  factory FacilityTypeListModel.fromJson(Map<String, dynamic> json) =>
      FacilityTypeListModel(
        id: json["id"], ownerId: json["ownerId"],
        operatorId: json["operatorId"],
        customerId: json["customerId"],
        spv_id: json["spv_id"],
        cityId: json["cityId"],
        stateid: json["stateid"],
        countryid: json["countryid"],

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
        "countryid": countryid,
        "ownerId": ownerId,
        "operatorId": operatorId,
        "customerId": customerId,
        "spv_id": spv_id,
        "cityId": cityId,
        "stateid": stateid,
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
