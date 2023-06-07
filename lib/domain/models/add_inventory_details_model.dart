import 'dart:convert';

AddInventoryDetailsModel addInventoryDetailModelFromJson(String str) =>
    AddInventoryDetailsModel.fromJson(json.decode(str));

// String addInventoryDetailModelToJson(AddInventoryDetailsModel data) =>
//     json.encode(data.toJson());

class AddInventoryDetailsModel {
  int? id;
  String? name;
  String? facilityName;
  //String? blockName;
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
  // String? model;
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
  // Null? specialToolEmp;
  // int? warrantyId;
  // Null? warrantyTypeName;
  // Null? warrantyProviderName;
  // Null? warrrantyTermTypeName;
  // Null? attachments;
  int? mutliplier;
  String? status;
  // Null? statusShort;
  // Null? statusLong;
  // Null? importedAt;
  // Null? importedBy;
  // Null? addedAt;
  // Null? addedBy;
  // Null? updatedAt;
  // Null? updatedBy;
  // Null? deletedAt;
  // Null? deletedBy;

  AddInventoryDetailsModel({
    this.id,
    this.name,
    this.facilityName,
    //  this.blockName,
    this.description,
    this.type,
    this.categoryName,
    this.parentName,
    this.customerName,
    this.ownerName,
    this.operatorName,
    this.manufacturerName,
    this.supplierName,
    this.acCapacity,
    this.dcCapacity,
    // this.model,
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
    // this.specialToolEmp,
    // this.warrantyId,
    // this.warrantyTypeName,
    // this.warrantyProviderName,
    // this.warrrantyTermTypeName,
    // this.attachments,
    this.mutliplier,
    this.status,
    // this.statusShort,
    // this.statusLong,
    // this.importedAt,
    // this.importedBy,
    // this.addedAt,
    // this.addedBy,
    // this.updatedAt,
    // this.updatedBy,
    // this.deletedAt,
    // this.deletedBy
  });

  factory AddInventoryDetailsModel.fromJson(Map<String, dynamic> json) {
    return AddInventoryDetailsModel(
      id: json['id'],
      name: json['name'],
      facilityName: json['facilityName'],
      //  blockName: json['blockName'],
      description: json['description'],
      type: json['type'],
      categoryName: json['categoryName'],
      parentName: json['parentName'],
      customerName: json['customerName'],
      ownerName: json['ownerName'],
      operatorName: json['operatorName'],
      manufacturerName: json['manufacturerName'],
      supplierName: json['supplierName'],
      acCapacity: json['acCapacity'],
      dcCapacity: json['dcCapacity'],
      //  model: json['model'],
      serialNumber: json['serialNumber'],
      cost: json['cost'],
      currency: json['currency'],
      moduleQuantity: json['moduleQuantity'],
      calibrationFrequency: json['calibrationFrequency'],
      calibrationFreqType: json['calibrationFreqType'],
      calibrationReminderDays: json['calibrationReminderDays'],
      calibrationLastDate: json['calibrationLastDate'],
      calibrationDueDate: json['calibrationDueDate'],
      specialTool: json['specialTool'],
      // specialToolEmp : json['specialToolEmp'],
      // warrantyId : json['warrantyId'],
      // warrantyTypeName : json['warrantyTypeName'],
      // warrantyProviderName : json['warrantyProviderName'],
      // warrrantyTermTypeName : json['warrrantyTermTypeName'],
      // attachments : json['attachments'],
      mutliplier: json['mutliplier'],
      status: json['status'],
      // statusShort : json['status_short'],
      // statusLong : json['status_long'],
      // importedAt : json['imported_at'],
      // importedBy : json['imported_by'],
      // addedAt : json['added_at'],
      // addedBy : json['added_by'],
      // updatedAt : json['updated_at'],
      // updatedBy : json['updated_by'],
      // deletedAt : json['deleted_at'],
      // deletedBy : json['deleted_by'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['facilityName'] = this.facilityName;
  //   data['blockName'] = this.blockName;
  //   data['description'] = this.description;
  //   data['type'] = this.type;
  //   data['categoryName'] = this.categoryName;
  //   data['parentName'] = this.parentName;
  //   data['customerName'] = this.customerName;
  //   data['ownerName'] = this.ownerName;
  //   data['operatorName'] = this.operatorName;
  //   data['manufacturerName'] = this.manufacturerName;
  //   data['supplierName'] = this.supplierName;
  //   data['acCapacity'] = this.acCapacity;
  //   data['dcCapacity'] = this.dcCapacity;
  //   data['model'] = this.model;
  //   data['serialNumber'] = this.serialNumber;
  //   data['cost'] = this.cost;
  //   data['currency'] = this.currency;
  //   data['moduleQuantity'] = this.moduleQuantity;
  //   data['calibrationFrequency'] = this.calibrationFrequency;
  //   data['calibrationFreqType'] = this.calibrationFreqType;
  //   data['calibrationReminderDays'] = this.calibrationReminderDays;
  //   data['calibrationLastDate'] = this.calibrationLastDate;
  //   data['calibrationDueDate'] = this.calibrationDueDate;
  //   data['specialTool'] = this.specialTool;
  //   // data['specialToolEmp'] = this.specialToolEmp;
  //   // data['warrantyId'] = this.warrantyId;
  //   // data['warrantyTypeName'] = this.warrantyTypeName;
  //   // data['warrantyProviderName'] = this.warrantyProviderName;
  //   // data['warrrantyTermTypeName'] = this.warrrantyTermTypeName;
  //   // data['attachments'] = this.attachments;
  //   data['mutliplier'] = this.mutliplier;
  //   data['status'] = this.status;
  //   // data['status_short'] = this.statusShort;
  //   // data['status_long'] = this.statusLong;
  //   // data['imported_at'] = this.importedAt;
  //   // data['imported_by'] = this.importedBy;
  //   // data['added_at'] = this.addedAt;
  //   // data['added_by'] = this.addedBy;
  //   // data['updated_at'] = this.updatedAt;
  //   // data['updated_by'] = this.updatedBy;
  //   // data['deleted_at'] = this.deletedAt;
  //   // data['deleted_by'] = this.deletedBy;
  //   return data;
  // }
}
