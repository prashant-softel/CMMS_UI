// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<UnitMeasurementModel> UnitMeasurementModelFromJson(String str) =>
    List<UnitMeasurementModel>.from(
          json.decode(str).map((x) => UnitMeasurementModel.fromJson(x)));

String UnitMeasurementModelToJson(List<UnitMeasurementModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnitMeasurementModel {
  UnitMeasurementModel({
    this.id,
    this.name,
    this.decimal_status,
    this.spare_multi_selection,
    this.flag,
    // this.status

  });

  int? id;
  int? flag;
  int? decimal_status;
  int? spare_multi_selection;
  String? name;
  // int? status;

  factory UnitMeasurementModel.fromJson(Map<String, dynamic> json) => UnitMeasurementModel(
        id: json["id"],
        name: json["name"],
    decimal_status: json["decimal_status"],
    spare_multi_selection: json["spare_multi_selection"],
    flag: json["flag"],
      // status: json["status"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
    "name": name,
    "decimal_status": decimal_status,
    "spare_multi_selection": spare_multi_selection,
        "flag": flag,
        // "status" : status
  };
}
