// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<CreateBusinessListModel> businessListModelFromJson(String str) =>
    List<CreateBusinessListModel>.from(
        json.decode(str).map((x) => CreateBusinessListModel.fromJson(x)));

String businessListModelToJson(List<CreateBusinessListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateBusinessListModel {
  CreateBusinessListModel({
    // this.id,
    this.name,
    this.email,
    this.contactPerson,
    this.contactnumber,
    this.website,
    this.location,
    this.address,
    this.countryId,
    this.stateId,
    this.cityId,
    this.zip,
    this.type,
    this.status,


  });

  // int? id;
  String? name;
  String? email;
  String? contactPerson;
  String? contactnumber;
  String? website;
  String? location;
  String? address;
  int? countryId;
  int? stateId;
  int? cityId;
  String? zip;
  int? type;
  int? status;
  // String? addAt;


  factory CreateBusinessListModel.fromJson(Map<String, dynamic> json) => CreateBusinessListModel(
    // id: json["id"],
    name: json["name"],
    email: json["email"],
    contactPerson: json["contactPerson"],
    contactnumber: json["contactnumber"],
    website: json["website"],
    location: json["location"],
    address: json["address"],
    countryId: json["countryId"],
    stateId: json["stateId"],
    cityId: json["cityId"],
    zip: json["zip"],
    type: json["type"],
    status: json["status"],
    // addAt: json["addAt"]
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    "name": name,
    "email": email,
    "contactPerson": contactPerson,
    "contactnumber": contactnumber,
    "website": website,
    "location": location,
    "address": address,
    "countryId": countryId,
    "stateId": stateId,
    "cityId": cityId,
    "zip": zip,
    "type": type,
    "status": status,
    // "addAt": addAt
  };
}
