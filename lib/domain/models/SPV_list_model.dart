// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<SPVListModel> SPVListModelFromJson(String str) => List<SPVListModel>.from(
    json.decode(str).map((x) => SPVListModel.fromJson(x)));

String SPVListModelToJson(List<SPVListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SPVListModel {
  SPVListModel({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory SPVListModel.fromJson(Map<String, dynamic> json) => SPVListModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
