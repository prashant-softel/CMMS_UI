import 'dart:convert';

List<InventoryDetailsModel> inventoryDetailsModelFromJson(String str) =>
    List<InventoryDetailsModel>.from(
        json.decode(str).map((x) => InventoryDetailsModel.fromJson(x)));

String inventoryDetailsModelToJson(List<InventoryDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InventoryDetailsModel {
  InventoryDetailsModel({
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
    required this.manufacturerName,
    required this.supplierName,
    required this.acCapacity,
    required this.dcCapacity,
    required this.model,
    required this.serialNumber,
    required this.cost,
    required this.currency,
    required this.moduleQuantity,
    required this.calibrationFrequency,
    required this.calibrationFreqType,
    required this.calibrationReminderDays,
    required this.calibrationLastDate,
    required this.calibrationDueDate,
    required this.specialTool,
    this.specialToolEmp,
    required this.warrantyId,
    this.warrantyTypeName,
    this.warrantyProviderName,
    this.warrrantyTermTypeName,
    this.attachments,
    required this.mutliplier,
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
  String? manufacturerName;
  String? supplierName;
  int? acCapacity;
  int? dcCapacity;
  String? model;
  String? serialNumber;
  int? cost;
  String? currency;
  int? moduleQuantity;
  String? calibrationFrequency;
  String? calibrationFreqType;
  int? calibrationReminderDays;
  String? calibrationLastDate;
  String? calibrationDueDate;
  int? specialTool;
  String? specialToolEmp;
  int? warrantyId;
  String? warrantyTypeName;
  String? warrantyProviderName;
  String? warrrantyTermTypeName;
  String? attachments;
  int? mutliplier;
  String? status;

  factory InventoryDetailsModel.fromJson(Map<String, dynamic> json) =>
      InventoryDetailsModel(
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
        manufacturerName: json["manufacturerName"] as String? ?? '',
        supplierName: json["supplierName"] as String? ?? '',
        acCapacity: json["acCapacity"] as int? ?? 0,
        dcCapacity: json["dcCapacity"] as int? ?? 0,
        model: json["model"] as String? ?? '',
        serialNumber: json["serialNumber"] as String? ?? '',
        cost: json["cost"] as int? ?? 0,
        currency: json["currency"] as String? ?? '',
        moduleQuantity: json["moduleQuantity"] as int? ?? 0,
        calibrationFrequency: json["calibrationFrequency"] as String? ?? '',
        calibrationFreqType: json["calibrationFreqType"] as String? ?? '',
        calibrationReminderDays: json["calibrationReminderDays"] as int? ?? 0,
        calibrationLastDate: json["calibrationLastDate"] as String? ?? '',
        calibrationDueDate: json["calibrationDueDate"] as String? ?? '',
        specialTool: json["specialTool"] as int? ?? 0,
        specialToolEmp: json["specialToolEmp"] as String? ?? '',
        warrantyId: json["warrantyId"] as int? ?? 0,
        warrantyTypeName: json["warrantyTypeName"] as String? ?? '',
        warrantyProviderName: json["warrantyProviderName"] as String? ?? '',
        warrrantyTermTypeName: json["warrrantyTermTypeName"] as String? ?? '',
        attachments: json["attachments"] as String? ?? '',
        mutliplier: json["mutliplier"] as int? ?? 0,
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
        "manufacturerName": manufacturerName,
        "supplierName": supplierName,
        "acCapacity": acCapacity,
        "dcCapacity": dcCapacity,
        "model": model,
        "serialNumber": serialNumber,
        "cost": cost,
        "currency": currency,
        "moduleQuantity": moduleQuantity,
        "calibrationFrequency": calibrationFrequency,
        "calibrationFreqType": calibrationFreqType,
        "calibrationReminderDays": calibrationReminderDays,
        "calibrationLastDate": calibrationLastDate,
        "calibrationDueDate": calibrationDueDate,
        "specialTool": specialTool,
        "specialToolEmp": specialToolEmp,
        "warrantyId": warrantyId,
        "warrantyTypeName": warrantyTypeName,
        "warrantyProviderName": warrantyProviderName,
        "warrrantyTermTypeName": warrrantyTermTypeName,
        "attachments": attachments,
        "mutliplier": mutliplier,
        "status": status,
      };
}
