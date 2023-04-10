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
   

  });

  int? id;
  String? name;
  String? email;
  String? contactPerson;
  

  factory BusinessListModel.fromJson(Map<String, dynamic> json) => BusinessListModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        contactPerson: json["contactPerson"],
        
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "contactPerson": contactPerson,

      };
}
