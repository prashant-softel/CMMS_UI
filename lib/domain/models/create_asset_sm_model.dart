// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<CreateAssetSMModel> CreateAssetSMModelFromJson(String str) =>
    List<CreateAssetSMModel>.from(
        json.decode(str).map((x) => CreateAssetSMModel.fromJson(x)));

String CreateAssetSMModelToJson(List<CreateAssetSMModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateAssetSMModel {
  CreateAssetSMModel({
    // this.id,
    this.asset_code,
    this.asset_name,
    this.asset_description,
    this.asset_type_ID,
    this.item_category_ID,
    this.unit_measurement_ID,
    this.section,
    this.min_req_qty,
    this.reorder_qty,
    this.approval_required_ID,
    this.fileData,


  });

  // int? id;
  Map<dynamic, String?>? fileData;

  String? asset_code;
  String? asset_name;
  String? asset_description;
  int? asset_type_ID;
  int? item_category_ID;
  int? unit_measurement_ID;
  int?section;
  int? min_req_qty;
  int? reorder_qty;

  int? approval_required_ID;


  factory CreateAssetSMModel.fromJson(Map<String, dynamic> json) => CreateAssetSMModel(
      // id: json["id"],
      asset_code: json["asset_code"],
      asset_name: json["asset_name"],
      asset_description: json["asset_description"],
      asset_type_ID: json["asset_type_ID"],
      item_category_ID: json["item_category_ID"],
      unit_measurement_ID: json["unit_measurement_ID"],
      section: json["section"],
      
      min_req_qty: json["min_req_qty"],
      reorder_qty: json["reorder_qty"],
      approval_required_ID: json["approval_required_ID"],
      fileData : json["fileData"],

  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    "asset_code": asset_code,
    "asset_name": asset_name,
    "asset_description": asset_description,
    "asset_type_ID": asset_type_ID,
    "item_category_ID": item_category_ID,
    "unit_measurement_ID": unit_measurement_ID,
    "section": section,
    "min_req_qty": min_req_qty,
    "reorder_qty": reorder_qty,
    "approval_required_ID": approval_required_ID,
    "fileData" : fileData,
  };
}
