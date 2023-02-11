// To parse this JSON data, do
//
//     final inventoryList = inventoryListFromJson(jsonString);

import 'dart:convert';

List<InventoryList> inventoryListFromJson(String str) =>
    List<InventoryList>.from(
        json.decode(str).map((x) => InventoryList.fromJson(x)));

String inventoryListToJson(List<InventoryList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InventoryList {
  InventoryList({
    required this.id,
    required this.name,
    required this.description,
    this.type,
    required this.categoryName,
    required this.blockName,
    required this.parentName,
    this.serialNumber,
    this.customerName,
    required this.ownerName,
    required this.operatorName,
    required this.status,
  });

  int id;
  String name;
  String description;
  dynamic type;
  String categoryName;
  String blockName;
  String parentName;
  dynamic serialNumber;
  dynamic customerName;
  String ownerName;
  String operatorName;
  String status;

  factory InventoryList.fromJson(Map<String, dynamic> json) => InventoryList(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        type: json["type"],
        categoryName: json["category_name"],
        blockName: json["block_name"],
        parentName: json["parent_name"],
        serialNumber: json["serial_number"],
        customerName: json["customer_name"],
        ownerName: json["owner_name"],
        operatorName: json["operator_name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "type": type,
        "category_name": categoryName,
        "block_name": blockName,
        "parent_name": parentName,
        "serial_number": serialNumber,
        "customer_name": customerName,
        "owner_name": ownerName,
        "operator_name": operatorName,
        "status": status,
      };
}
