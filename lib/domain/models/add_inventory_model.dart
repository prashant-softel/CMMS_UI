class AddInventoryRequestModel {
  int? id;
  String? name;
  String? description;
  int? typeId;
  int? statusId;
  int? facilityId;
  int? blockId;
  int? parentId;
  int? categoryId;
  int? warranty_type;
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
  String? start_date;
  String? expiry_date;
  int? ownerId;
  int? warranty_provider_id;
  int? operatorId;
  int? manufacturerId;
  int? supplierId;
  String? model;
  int? stockCount;
  int? moduleQuantity;
  int? cost;
  String? currency;
  String? assetdescription;
  String? warranty_description;

  dynamic attachments;
  List<LstWarrantyDetail>? lstWarrantyDetail;

  AddInventoryRequestModel(
      {this.name,
      this.id,
      this.description,
      this.typeId,
      this.statusId,
      this.facilityId,
      this.blockId,
      this.parentId,
      this.categoryId,
      this.warranty_type,
      this.warranty_description,
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
      this.start_date,
      this.expiry_date,
      this.warranty_provider_id,
      this.model,
      this.stockCount,
      this.moduleQuantity,
      this.cost,
      this.currency,
      this.attachments,
      this.assetdescription,
      this.lstWarrantyDetail});

  AddInventoryRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    assetdescription = json['assetdescription'];
    typeId = json['typeId'];
    warranty_description = json['warranty_description'];
    statusId = json['statusId'];
    facilityId = json['facilityId'];
    blockId = json['blockId'];
    parentId = json['parentId'];
    categoryId = json['categoryId'];
    warranty_type = json['warranty_type'];

    acCapacity = json['acCapacity'];
    dcCapacity = json['dcCapacity'];
    serialNumber = json['serialNumber'];
    multiplier = json['multiplier'];
    start_date = json['start_date'];
    expiry_date = json['expiry_date'];
    calibrationFrequency = json['calibrationFrequency'];
    calibrationFrequencyType = json['calibrationFrequencyType'];
    calibrationReminderDays = json['calibrationReminderDays'];
    calibrationFirstDueDate = json['calibrationFirstDueDate'];
    calibrationLastDate = json['calibrationLastDate'];
    customerId = json['customerId'];
    ownerId = json['ownerId'];
    warranty_provider_id = json['warranty_provider_id'];

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
    data["id"] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['assetdescription'] = this.assetdescription;
    data['warranty_description'] = this.warranty_description;
    data['typeId'] = this.typeId;
    data['statusId'] = this.statusId;
    data['facilityId'] = this.facilityId;
    data['blockId'] = this.blockId;
    data['parentId'] = this.parentId;
    data['start_date'] = this.start_date;
    data['expiry_date'] = this.expiry_date;

    data['categoryId'] = this.categoryId;
    data['warranty_type'] = this.warranty_type;

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
    data['warranty_provider_id'] = this.warranty_provider_id;

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

  int? warrranty_term_type;
  String? expiryDate;
  int? meterLimit;
  int? meterUnit;
  int? warrantyProviderId;
  dynamic certificate_number;
  int? warrantyStatus;
  String? warrantyDiscription;

  LstWarrantyDetail(
      {this.warrantyType,
      this.warrranty_term_type,
      this.expiryDate,
      this.meterLimit,
      this.meterUnit,
      this.warrantyProviderId,
      this.certificate_number,
      this.warrantyStatus,
      this.warrantyDiscription});

  LstWarrantyDetail.fromJson(Map<String, dynamic> json) {
    warrantyType = json['warranty_type'];

    warrranty_term_type = json['warrranty_term_type'];
    expiryDate = json['expiry_date'];
    meterLimit = json['meter_limit'];
    meterUnit = json['meter_unit'];
    warrantyProviderId = json['warranty_provider_Id'];
    certificate_number = json['certificate_number'];
    warrantyStatus = json['warranty_status'];
    warrantyDiscription = json['warranty_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['warranty_type'] = this.warrantyType;

    data['warrranty_term_type'] = this.warrranty_term_type;
    data['expiry_date'] = this.expiryDate;
    data['meter_limit'] = this.meterLimit;
    data['meter_unit'] = this.meterUnit;
    data['warranty_provider_Id'] = this.warrantyProviderId;
    data['certificate_number'] = this.certificate_number;
    data['warranty_status'] = this.warrantyStatus;
    data['warranty_description'] = this.warrantyDiscription;
    return data;
  }
}
