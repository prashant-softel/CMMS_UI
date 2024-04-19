// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<BusinessListModel> businessListModelFromJson(String str) =>
    List<BusinessListModel>.from(
        json.decode(str).map((x) => BusinessListModel.fromJson(x)));

String businessListModelToJson(List<BusinessListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BusinessListModel {
  BusinessListModel({
    this.id,
    this.name,
    this.email,
    this.contactPerson,
    this.contactnumber,
    this.website,
    this.location,
    this.address,
    this.country,
    this.countryId,
    this.state,
    this.stateId,
    this.city,
    this.cityId,
    this.zip,
    this.type,
    this.status,
    this.addedAt,
  });

  int? id;
  String? name;
  String? email;
  String? contactPerson;
  String? contactnumber;
  String? website;
  String? location;
  String? address;
  String? country;
  int? countryId;
  String? state;
  int? stateId;
  String? city;
  int? cityId;
  String? zip;
  int? type;
  int? status;
  String? addedAt;

  factory BusinessListModel.fromJson(Map<String, dynamic> json) =>
      BusinessListModel(
          id: json["id"],
          name: json["name"],
          email: json["email"],
          contactPerson: json["contactPerson"],
          contactnumber: json["contactNumber"],
          website: json["website"],
          location: json["location"],
          address: json["address"],
          country: json["country"],
          countryId: json["countryId"],
          state: json["state"],
          stateId: json["stateId"],
          city: json["city"],
          cityId: json["cityId"],
          zip: json["zip"],
          type: json["type"],
          status: json["status"],
          addedAt: json["addedAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "contactPerson": contactPerson,
        "contactNumber": contactnumber,
        "website": website,
        "location": location,
        "address": address,
        "country": country,
        "countryId": countryId,
        "state": state,
        "stateId": stateId,
        "city": city,
        "cityId": cityId,
        "zip": zip,
        "type": type,
        "status": status,
        "addedAt": addedAt
      };
}
