import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

AddInventoryDetailsModel addInventoryDetailModelFromJson(String str) =>
    AddInventoryDetailsModel.fromJson(json.decode(str));

class AddInventoryDetailsModel {
  int? id;
  String? name;
  int? facilityId;
  String? facilityName;
  int? blockId;
  String? blockName;
  String? description;
  int? typeId;
  String? type;
  int? categoryId;
  String? categoryName;
  int? parentId;
  String? parentName;
  dynamic parentSerial;
  int? customerId;
  String? customerName;
  int? ownerId;
  String? ownerName;
  int? operatorId;
  String? operatorName;
  int? manufacturerId;
  String? manufacturerName;
  int? supplierId;
  String? supplierName;
  int? acCapacity;
  int? dcCapacity;
  String? model;
  String? serialNumber;
  int? cost;
  String? currency;
  int? moduleQuantity;
  int? calibrationFrequency;
  String? calibrationFreqType;
  int? calibrationReminderDays;
  String? calibrationLastDate;
  String? calibrationDueDate;
  String? start_date;
  String? expiry_date;
  String? parent_equipment_no;
  int? specialTool;
  dynamic specialToolEmp;
  int? warrantyId;
  dynamic warrantyDescription;
  dynamic certificateNumber;
  int? warrantyTypeId;
  dynamic warrantyTypeName;
  int? warrantyProviderId;
  dynamic warrantyProviderName;
  int? warrantyTermTypeId;
  dynamic warrantyTermTypeName;
  dynamic attachments;
  int? multiplier;
  int? statusId;
  dynamic status;
  dynamic statusShort;
  dynamic statusLong;
  dynamic importedAt;
  dynamic importedBy;
  dynamic addedAt;
  dynamic addedBy;
  dynamic updatedAt;
  dynamic updatedBy;
  dynamic deletedAt;
  dynamic deletedBy;
  String? asset_description;
  String? warrantyType;
  String? warranty_term_type;

  AddInventoryDetailsModel({
    this.id,
    this.name,
    this.facilityId,
    this.facilityName,
    this.blockId,
    this.blockName,
    this.description,
    this.typeId,
    this.type,
    this.categoryId,
    this.categoryName,
    this.parentId,
    this.parentName,
    this.parentSerial,
    this.customerId,
    this.customerName,
    this.ownerId,
    this.ownerName,
    this.operatorId,
    this.operatorName,
    this.manufacturerId,
    this.manufacturerName,
    this.supplierId,
    this.supplierName,
    this.acCapacity,
    this.dcCapacity,
    this.model,
    this.serialNumber,
    this.cost,
    this.currency,
    this.moduleQuantity,
    this.calibrationFrequency,
    this.calibrationFreqType,
    this.calibrationReminderDays,
    this.calibrationLastDate,
    this.calibrationDueDate,
    this.specialTool,
    this.specialToolEmp,
    this.warrantyId,
    this.warrantyDescription,
    this.certificateNumber,
    this.warrantyTypeId,
    this.warrantyTypeName,
    this.warrantyProviderId,
    this.warrantyProviderName,
    this.warrantyTermTypeId,
    this.warrantyTermTypeName,
    this.attachments,
    this.multiplier,
    this.statusId,
    this.status,
    this.statusShort,
    this.statusLong,
    this.importedAt,
    this.importedBy,
    this.addedAt,
    this.addedBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
    this.deletedBy,
    this.asset_description,
    this.expiry_date,
    this.start_date,
    this.parent_equipment_no,
    this.warrantyType,
    this.warranty_term_type,
  });

  // Factory method to create a AddInventoryDetailsModel instance from JSON
  factory AddInventoryDetailsModel.fromJson(Map<String, dynamic> json) {
    return AddInventoryDetailsModel(
      id: json['id'],
      name: json['name'],
      facilityId: json['facilityId'],
      facilityName: json['facilityName'],
      blockId: json['blockId'],
      blockName: json['blockName'],
      description: json['description'],
      typeId: json['typeId'],
      type: json['type'],
      categoryId: json['categoryId'],
      categoryName: json['categoryName'],
      parentId: json['parentId'],
      parentName: json['parentName'],
      parentSerial: json['parentSerial'],
      customerId: json['customerId'],
      customerName: json['customerName'],
      ownerId: json['ownerId'],
      ownerName: json['ownerName'],
      operatorId: json['operatorId'],
      operatorName: json['operatorName'],
      manufacturerId: json['manufacturerId'],
      manufacturerName: json['manufacturerName'],
      supplierId: json['supplierId'],
      supplierName: json['supplierName'],
      acCapacity: json['acCapacity'],
      dcCapacity: json['dcCapacity'],
      model: json['model'],
      serialNumber: json['serialNumber'],
      cost: json['cost'],
      currency: json['currency'],
      moduleQuantity: json['moduleQuantity'],
      calibrationFrequency: json['calibrationFrequency'],
      calibrationFreqType: json['calibrationFreqType'],
      calibrationReminderDays: json['calibrationReminderDays'],
      calibrationLastDate:
          Utility.getFormatedyearMonthDay(json['calibrationLastDate']),
      // calibrationLastDate: DateTime.parse(json['calibrationLastDate']),
      calibrationDueDate:
          Utility.getFormatedyearMonthDay(json['calibrationDueDate']),
      expiry_date: Utility.getFormatedyearMonthDay(json['expiry_date']),
      start_date: Utility.getFormatedyearMonthDay(json['start_date']),

      // calibrationDueDate: DateTime.parse(json['calibrationDueDate']),
      specialTool: json['specialTool'],
      parent_equipment_no: json['parent_equipment_no'],

      specialToolEmp: json['specialToolEmp'],
      warrantyId: json['warrantyId'],
      warrantyDescription: json['warranty_description'],
      certificateNumber: json['certificate_number'],
      warrantyTypeId: json['warrantyTypeId'],
      warrantyTypeName: json['warrantyTypeName'],
      warrantyProviderId: json['warrantyProviderId'],
      warrantyProviderName: json['warrantyProviderName'],
      warrantyTermTypeId: json['warrantyTermTypeId'],
      warrantyTermTypeName: json['warrrantyTermTypeName'],
      attachments: json['attachments'],
      multiplier: json['mutliplier'],
      statusId: json['statusId'],
      status: json['status'],
      statusShort: json['status_short'],
      statusLong: json['status_long'],
      importedAt: json['imported_at'],
      importedBy: json['imported_by'],
      addedAt: json['added_at'],
      addedBy: json['added_by'],
      updatedAt: json['updated_at'],
      updatedBy: json['updated_by'],
      deletedAt: json['deleted_at'],
      deletedBy: json['deleted_by'],
      asset_description: json['asset_description'],
      warrantyType: json['warrantyType'],
      warranty_term_type: json['warranty_term_type'],
    );
  }
}
