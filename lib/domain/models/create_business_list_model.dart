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
    this.country,
    this.state,
    this.city,
    this.zip,
    this.type,
    this.status,
    this.addAt,


  });

  // int? id;
  String? name;
  String? email;
  String? contactPerson;
  String? contactnumber;
  String? website;
  String? location;
  String? address;
  String? country;
  String? state;
  String? city;
  String? zip;
  int? type;
  int? status;
  String? addAt;


  factory CreateBusinessListModel.fromJson(Map<String, dynamic> json) => CreateBusinessListModel(
      // id: json["id"],
      name: json["name"],
      email: json["email"],
      contactPerson: json["contactPerson"],
      contactnumber: json["contactnumber"],
      website: json["website"],
      location: json["location"],
      address: json["address"],
      country: json["country"],
      state: json["state"],
      city: json["city"],
      zip: json["zip"],
      type: json["type"],
      status: json["status"],
      addAt: json["addAt"]
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
    "country": country,
    "state": state,
    "city": city,
    "zip": zip,
    "type": type,
    "status": status,
    "addAt": addAt
  };
}
