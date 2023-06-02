class AddInventoryRequestModel {
  String? name;
  String? description;
  int? typeId;
  int? statusId;
  int? facilityId;
  int? blockId;
  int? parentId;
  int? categoryId;
  int? acCapacity;
  int? dcCapacity;
  String? serialNumber;
  int? multiplier;
  int? calibrationFrequency;
  int? calibrationFrequencyType;
  int? calibrationReminderDays;
  String? calibrationFirstDueDate;
  String? calibrationLastDate;
  int? customerId;
  int? ownerId;
  int? operatorId;
  int? manufacturerId;
  int? supplierId;
  String? model;
  int? stockCount;
  int? moduleQuantity;
  int? cost;
  String? currency;
  dynamic attachments;
  List<LstWarrantyDetail>? lstWarrantyDetail;

  AddInventoryRequestModel(
      {this.name,
      this.description,
      this.typeId,
      this.statusId,
      this.facilityId,
      this.blockId,
      this.parentId,
      this.categoryId,
      this.acCapacity,
      this.dcCapacity,
      this.serialNumber,
      this.multiplier,
      this.calibrationFrequency,
      this.calibrationFrequencyType,
      this.calibrationReminderDays,
      this.calibrationFirstDueDate,
      this.calibrationLastDate,
      this.customerId,
      this.ownerId,
      this.operatorId,
      this.manufacturerId,
      this.supplierId,
      this.model,
      this.stockCount,
      this.moduleQuantity,
      this.cost,
      this.currency,
      this.attachments,
      this.lstWarrantyDetail});

  AddInventoryRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    typeId = json['typeId'];
    statusId = json['statusId'];
    facilityId = json['facilityId'];
    blockId = json['blockId'];
    parentId = json['parentId'];
    categoryId = json['categoryId'];
    acCapacity = json['acCapacity'];
    dcCapacity = json['dcCapacity'];
    serialNumber = json['serialNumber'];
    multiplier = json['multiplier'];
    calibrationFrequency = json['calibrationFrequency'];
    calibrationFrequencyType = json['calibrationFrequencyType'];
    calibrationReminderDays = json['calibrationReminderDays'];
    calibrationFirstDueDate = json['calibrationFirstDueDate'];
    calibrationLastDate = json['calibrationLastDate'];
    customerId = json['customerId'];
    ownerId = json['ownerId'];
    operatorId = json['operatorId'];
    manufacturerId = json['manufacturerId'];
    supplierId = json['supplierId'];
    model = json['model'];
    stockCount = json['stockCount'];
    moduleQuantity = json['moduleQuantity'];
    cost = json['cost'];
    currency = json['currency'];
    attachments = json['attachments'];
    if (json['lstWarrantyDetail'] != null) {
      lstWarrantyDetail = <LstWarrantyDetail>[];
      json['lstWarrantyDetail'].forEach((v) {
        lstWarrantyDetail!.add(new LstWarrantyDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['typeId'] = this.typeId;
    data['statusId'] = this.statusId;
    data['facilityId'] = this.facilityId;
    data['blockId'] = this.blockId;
    data['parentId'] = this.parentId;
    data['categoryId'] = this.categoryId;
    data['acCapacity'] = this.acCapacity;
    data['dcCapacity'] = this.dcCapacity;
    data['serialNumber'] = this.serialNumber;
    data['multiplier'] = this.multiplier;
    data['calibrationFrequency'] = this.calibrationFrequency;
    data['calibrationFrequencyType'] = this.calibrationFrequencyType;
    data['calibrationReminderDays'] = this.calibrationReminderDays;
    data['calibrationFirstDueDate'] = this.calibrationFirstDueDate;
    data['calibrationLastDate'] = this.calibrationLastDate;
    data['customerId'] = this.customerId;
    data['ownerId'] = this.ownerId;
    data['operatorId'] = this.operatorId;
    data['manufacturerId'] = this.manufacturerId;
    data['supplierId'] = this.supplierId;
    data['model'] = this.model;
    data['stockCount'] = this.stockCount;
    data['moduleQuantity'] = this.moduleQuantity;
    data['cost'] = this.cost;
    data['currency'] = this.currency;
    data['attachments'] = this.attachments;
    if (this.lstWarrantyDetail != null) {
      data['lstWarrantyDetail'] =
          this.lstWarrantyDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LstWarrantyDetail {
  int? warrantyType;
  String? warrantyDescription;
  int? warrrantyTermType;
  String? expiryDate;
  int? meterLimit;
  int? meterUnit;
  int? warrantyProviderId;
  dynamic certificateNumber;
  int? warrantyStatus;
  String? warrantyDiscription;

  LstWarrantyDetail(
      {this.warrantyType,
      this.warrantyDescription,
      this.warrrantyTermType,
      this.expiryDate,
      this.meterLimit,
      this.meterUnit,
      this.warrantyProviderId,
      this.certificateNumber,
      this.warrantyStatus,
      this.warrantyDiscription});

  LstWarrantyDetail.fromJson(Map<String, dynamic> json) {
    warrantyType = json['warranty_type'];
    warrantyDescription = json['warranty_description'];
    warrrantyTermType = json['warrranty_term_type'];
    expiryDate = json['expiry_date'];
    meterLimit = json['meter_limit'];
    meterUnit = json['meter_unit'];
    warrantyProviderId = json['warranty_provider_Id'];
    certificateNumber = json['certificate_number'];
    warrantyStatus = json['warranty_status'];
    warrantyDiscription = json['warranty_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['warranty_type'] = this.warrantyType;
    data['warranty_description'] = this.warrantyDescription;
    data['warrranty_term_type'] = this.warrrantyTermType;
    data['expiry_date'] = this.expiryDate;
    data['meter_limit'] = this.meterLimit;
    data['meter_unit'] = this.meterUnit;
    data['warranty_provider_Id'] = this.warrantyProviderId;
    data['certificate_number'] = this.certificateNumber;
    data['warranty_status'] = this.warrantyStatus;
    data['warranty_description'] = this.warrantyDiscription;
    return data;
  }
}
