// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<InventoryModel> inventoryModelFromJson(String str) =>
    List<InventoryModel>.from(
        json.decode(str).map((x) => InventoryModel.fromJson(x)));

String inventoryModelToJson(List<InventoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InventoryModel {
  InventoryModel({
    required this.id,
    required this.name,
    required this.facilityName,
    required this.blockName,
    required this.description,
    required this.type,
    required this.categoryName,
    required this.parentName,
    required this.customerName,
    required this.ownerName,
    required this.operatorName,
    required this.serialNumber,
    required this.specialTool,
    required this.warrantyId,
    required this.calibrationDueDate,
    required this.status,
  });

  int? id;
  String? name;
  String? facilityName;
  String? blockName;
  String? description;
  String? type;
  String? categoryName;
  String? parentName;
  String? customerName;
  String? ownerName;
  String? operatorName;
  String? serialNumber;
  int? specialTool;
  int? warrantyId;
  String? calibrationDueDate;
  String? status;

  factory InventoryModel.fromJson(Map<String, dynamic> json) => InventoryModel(
        id: json["id"] as int? ?? 0,
        name: json["name"] as String? ?? '',
        facilityName: json["facilityName"] as String? ?? '',
        blockName: json["blockName"] as String? ?? '',
        description: json["description"] as String? ?? '',
        type: json["type"] as String? ?? '',
        categoryName: json["categoryName"] as String? ?? '',
        parentName: json["parentName"] as String? ?? '',
        customerName: json["customerName"] as String? ?? '',
        ownerName: json["ownerName"] as String? ?? '',
        operatorName: json["operatorName"] as String? ?? '',
        serialNumber: json["serialNumber"] as String? ?? '',
        specialTool: json["specialTool"] as int? ?? 0,
        warrantyId: json["warrantyId"] as int? ?? 0,
        calibrationDueDate: json["calibrationDueDate"] as String? ?? '',
        status: json["status"] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "facilityName": facilityName,
        "blockName": blockName,
        "description": description,
        "type": type,
        "categoryName": categoryName,
        "parentName": parentName,
        "customerName": customerName,
        "ownerName": ownerName,
        "operatorName": operatorName,
        "serialNumber": serialNumber,
        "specialTool": specialTool,
        "warrantyId": warrantyId,
        "calibrationDueDate": calibrationDueDate,
        "status": status,
      };
}
