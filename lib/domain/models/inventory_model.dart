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
    this.id,
    this.area,
    this.name,
    this.facilityName,
    this.blockName,
    this.description,
    this.type,
    this.categoryId,
    this.categoryName,
    this.supplierName,
    this.parentId,
    this.parentName,
    this.customerName,
    this.ownerName,
    this.operatorName,
    this.serialNumber,
    this.specialTool,
    this.warrantyId,
    this.calibrationDueDate,
    this.status,
    this.linkedToBlockId,
    this.linkedToBlockName,
    this.dccapacity,
    this.dcRating,
    this.acrating,
    this.acCapacity,
    this.descMaintenace,
    this.warrtype,
    this.wprovidername,
    this.wtenure,
    this.certinumber,
    this.manuname,
    this.model,
    this.cost,
    this.currency,
    this.barcode,
    this.unspcCode,
    this.purchasecode,
    this.califrequency,
    this.calireminderdays,
    this.calibrationtestdate,
    this.startdate,
    this.expiry_date,
    this.calilastdate,
    this.moduleQuantity,
    this.checklist_id,
    this.checklist_name,
    this.module_qty,
  });

  int? id;
  dynamic area;

  int? module_qty;
  int? checklist_id;
  String? checklist_name;
  String? name;
  String? facilityName;
  String? supplierName;
  String? blockName;
  String? description;
  String? type;
  int? dccapacity;
  String? dcRating;
  String? acrating;
  int? categoryId;
  int? acCapacity;
  String? descMaintenace;
  String? warrtype;
  String? wprovidername;
  int? wtenure;
  String? certinumber;
  String? manuname;
  String? model;
  double? cost;
  String? currency;
  String? barcode;
  String? unspcCode;
  String? purchasecode;
  int? califrequency;
  int? calireminderdays;
  String? categoryName;
  int? parentId;
  String? parentName;
  String? customerName;
  String? ownerName;
  String? operatorName;
  String? serialNumber;
  int? specialTool;
  int? warrantyId;
  DateTime? calibrationDueDate;
  DateTime? calibrationtestdate;
  DateTime? startdate;
  DateTime? expiry_date;
  DateTime? calilastdate;
  String? status;
  int? linkedToBlockId;
  String? linkedToBlockName;

  int? moduleQuantity;
  factory InventoryModel.fromJson(Map<String, dynamic> json) => InventoryModel(
        id: json["id"],
        name: json["name"],
        module_qty: json["module_qty"],
        checklist_id: json['checklist_id'],
        checklist_name: json['checklist_name'],
        facilityName: json["facilityName"],
        blockName: json["blockName"],
        description: json["description"],
        type: json["type"],
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        parentId: json["parentId"],
        parentName: json["parentName"],
        customerName: json["customerName"],
        dccapacity: json["dccapacity"],
        dcRating: json["dcRating"],
        acCapacity: json["acCapacity"],
        acrating: json["acrating"],
        descMaintenace: json["descMaintenace"],
        warrtype: json["warrantyType"],
        wprovidername: json["warrantyProviderName"],
        wtenure: json["warrantyTenture"],
        certinumber: json["certificate_number"],
        manuname: json["manufacturername"],
        model: json["model"],
        supplierName: json["supplierName"],
        cost: json["cost"],
        currency: json["currency"],
        barcode: json["barcode"],
        unspcCode: json["unspCode"],
        purchasecode: json["purchaseCode"],
        califrequency: json["calibrationFrequency"],
        calireminderdays: json["calibrationReminderDays"],
        ownerName: json["ownerName"],
        operatorName: json["operatorName"],
        serialNumber: json["serialNumber"],
        specialTool: json["specialTool"],
        warrantyId: json["warrantyId"],
        linkedToBlockId: json["linkedToBlockId"],
        linkedToBlockName: json["linkedToBlockName"],
        moduleQuantity: json["moduleQuantity"],
        calibrationDueDate: json['calibrationDueDate'] == null
            ? null
            : DateTime.parse(json['calibrationDueDate'] as String),
        calibrationtestdate: json['calibration_testing_date'] == null
            ? null
            : DateTime.parse(json['calibration_testing_date'] as String),
        startdate: json['start_date'] == null
            ? null
            : DateTime.parse(json['start_date'] as String),
        expiry_date: json['expiry_date'] == null
            ? null
            : DateTime.parse(json['expiry_date'] as String),
        calilastdate: json['calibrationLastDate'] == null
            ? null
            : DateTime.parse(json['calibrationLastDate'] as String),
        status: json["status"],
        area: json["area"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "module_qty": module_qty,
        "checklist_id": checklist_id,
        "checklist_name": checklist_name,
        "linkedToBlockId": linkedToBlockId,
        "moduleQuantity": moduleQuantity,
        "linkedToBlockName": linkedToBlockName,
        "facilityName": facilityName,
        "blockName": blockName,
        "description": description,
        "type": type,
        "categoryId": categoryId,
        "categoryName": categoryName,
        "parentId": parentId,
        "parentName": parentName,
        "customerName": customerName,
        "ownerName": ownerName,
        "operatorName": operatorName,
        "serialNumber": serialNumber,
        "specialTool": specialTool,
        "warrantyId": warrantyId,
        "dccapacity": dccapacity,
        "dcRating": dcRating,
        "acCapacity": acCapacity,
        "acrating": acrating,
        "descMaintenace": descMaintenace,
        "warrantyType": warrtype,
        "warrantyProviderName": wprovidername,
        "warrantyTenture": wtenure,
        "certificate_number": certinumber,
        "manufacturername": manuname,
        "supplierName": supplierName,
        "model": model,
        "cost": cost,
        "currency": currency,
        "barcode": barcode,
        "unspCode": unspcCode,
        "purchaseCode": purchasecode,
        "calibrationFrequency": califrequency,
        "calibrationReminderDays": calireminderdays,
        "calibrationDueDate": calibrationDueDate?.toIso8601String(),
        "calibration_testing_date": calibrationtestdate?.toIso8601String(),
        "start_date": startdate?.toIso8601String(),
        "expiry_date": startdate?.toIso8601String(),
        "calibrationLastDate": calilastdate?.toIso8601String(),
        "status": status,
        "area": area,
      };
}
