// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<InventoryDetailModel> inventoryDetailModelFromJson(String str) =>
    List<InventoryDetailModel>.from(
        json.decode(str).map((x) => InventoryDetailModel.fromJson(x)));

String inventoryDetailModelToJson(List<InventoryDetailModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InventoryDetailModel {
  InventoryDetailModel({
    this.id,
    this.name,
    // this.facilityName,
    // this.blockName,
    // this.description,
    // this.type,
    // this.categoryId,
    // this.categoryName,
    // this.parentId,
    // this.parentName,
    // this.customerName,
    // this.ownerName,
    // this.operatorName,
    this.serialNumber,
    // this.specialTool,
    // this.warrantyId,
    // this.calibrationDueDate,
    // this.status,
  });

  int? id;
  String? name;
  // String? facilityName;
  // String? blockName;
  // String? description;
  // String? type;
  // int? categoryId;
  // String? categoryName;
  // int? parentId;
  // String? parentName;
  // String? customerName;
  // String? ownerName;
  // String? operatorName;
  String? serialNumber;
  // int? specialTool;
  // int? warrantyId;
  // DateTime? calibrationDueDate;
  // String? status;

  factory InventoryDetailModel.fromJson(Map<String, dynamic> json) => InventoryDetailModel(
        id: json["id"],
        name: json["name"],
        // facilityName: json["facilityName"],
        // blockName: json["blockName"],
        // description: json["description"],
        // type: json["type"],
        // categoryId: json["categoryId"],
        // categoryName: json["categoryName"],
        // parentId: json["parentId"],
        // parentName: json["parentName"],
        // customerName: json["customerName"],
        // ownerName: json["ownerName"],
        // operatorName: json["operatorName"],
        serialNumber: json["serialNumber"],
        // specialTool: json["specialTool"],
        // warrantyId: json["warrantyId"],
        // calibrationDueDate: json['calibrationDueDate'] == null
        //     ? null
        //     : DateTime.parse(json['calibrationDueDate'] as String),
        // status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        // "facilityName": facilityName,
        // "block_name": blockName,
        // "description": description,
        // "type": type,
        // "categoryId": categoryId,
        // "categoryName": categoryName,
        // "parentId": parentId,
        // "parentName": parentName,
        // "customerName": customerName,
        // "ownerName": ownerName,
        // "operatorName": operatorName,
        "serialNumber": serialNumber,
        // "specialTool": specialTool,
        // "warrantyId": warrantyId,
        // "calibrationDueDate": calibrationDueDate?.toIso8601String(),
        // "status": status,
      };
}
