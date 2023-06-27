import 'dart:convert';

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
  DateTime? calibrationLastDate;
  DateTime? calibrationDueDate;
  int? specialTool;
  dynamic specialToolEmp;
  int? warrantyId;
  dynamic? warrantyDescription;
  dynamic? certificateNumber;
  int? warrantyTypeId;
  dynamic? warrantyTypeName;
  int? warrantyProviderId;
  dynamic? warrantyProviderName;
  int? warrantyTermTypeId;
  dynamic? warrantyTermTypeName;
  dynamic? attachments;
  int? multiplier;
  int? statusId;
  dynamic? status;
  dynamic? statusShort;
  dynamic? statusLong;
  dynamic? importedAt;
  dynamic? importedBy;
  dynamic? addedAt;
  dynamic? addedBy;
  dynamic? updatedAt;
  dynamic? updatedBy;
  dynamic? deletedAt;
  dynamic? deletedBy;

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
      calibrationLastDate: DateTime.parse(json['calibrationLastDate']),
      calibrationDueDate: DateTime.parse(json['calibrationDueDate']),
      specialTool: json['specialTool'],
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
    );
  }
}
