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
  String? calibrationFrequencyType;
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
  double? area;
  int? cost;
  int? currencyId;
  // int? currency;
  String? assetdescription;
  String? warranty_description;
  String? parent_equipment_no;
  int? warranty_term_type;
  String? certificate_number;
  List<dynamic>? uplaodfile_ids;
  List<dynamic>? uplaodfile_of_calibration;
  List<dynamic>? uplaodfile_of_warranty;

  // dynamic attachments;
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
      this.area,
      this.cost,
      this.currencyId,
      // this.currency,
      // this.attachments,
      this.assetdescription,
      this.lstWarrantyDetail,
      this.parent_equipment_no,
      this.uplaodfile_ids,
      this.warranty_term_type,
      this.certificate_number,
      this.uplaodfile_of_warranty,
      this.uplaodfile_of_calibration});

  AddInventoryRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uplaodfile_of_warranty = json['uplaodfile_of_warranty'];
    uplaodfile_of_calibration = json['uplaodfile_of_calibration'];

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
    uplaodfile_ids = json['uploadfile_ids'];
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
    area = json['area'];

    cost = json['cost'];
    currencyId = json['currencyId'];
    // currency = json['currency'];
    parent_equipment_no = json['parent_equipment_no'];
    warranty_term_type = json['warranty_term_type'];
    certificate_number = json['certificate_number'];

    // attachments = json['attachments'];
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
    data["uplaodfile_of_warranty"] = this.uplaodfile_of_warranty;
    data["uplaodfile_of_calibration"] = this.uplaodfile_of_calibration;

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
    data['uplaodfile_ids'] = this.uplaodfile_ids;

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
    data['area'] = this.area;

    data['cost'] = this.cost;
    data['parent_equipment_no'] = this.parent_equipment_no;
    data['warranty_term_type'] = this.warranty_term_type;
    data['certificate_number'] = this.certificate_number;

    data['currencyId'] = this.currencyId;
    // data['currency'] = this.currency;
    // data['attachments'] = this.attachments;
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
