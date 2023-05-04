class NewPermitListModel {
  int? permitId;
  int? ptwStatus;
  int? permitSiteNo;
  int? permitType;
  String? permitTypeName;
  int? equipmentCategoryId;
  String? equipmentCategory;
  int? workingAreaId;
  String? workingAreaName;
  String? description;
  String? requestByName;
  DateTime? requestDatetime;
  String? approvedByName;
  DateTime? approved_datetime;
  String? current_status;

  NewPermitListModel(
      {this.permitId,
      this.ptwStatus,
      this.permitSiteNo,
      this.permitType,
      this.permitTypeName,
      this.equipmentCategoryId,
      this.equipmentCategory,
      this.workingAreaId,
      this.workingAreaName,
      this.description,
      this.requestByName,
      this.requestDatetime,
      this.approvedByName,
      this.approved_datetime,
      this.current_status});

  NewPermitListModel.fromJson(Map<String, dynamic> json) {
    permitId = json['permitId'];
    ptwStatus = json['ptwStatus'];
    permitSiteNo = json['permit_site_no'];
    permitType = json['permit_type'];
    permitTypeName = json['permitTypeName'];
    equipmentCategoryId = json['equipment_category_id'];
    equipmentCategory = json['equipment_category'];
    workingAreaId = json['workingAreaId'];
    workingAreaName = json['workingAreaName'];
    description = json['description'];
    requestByName = json['request_by_name'];
    requestDatetime = json['request_datetime'] == null
          ? null
          : DateTime.parse(json['request_datetime'] as String);
    approvedByName = json['approved_by_name'];
    approved_datetime=  json['approved_datetime'] == null
          ? null
          : DateTime.parse(json['approved_datetime'] as String);
    current_status = json['current_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['permitId'] = this.permitId;
    data['ptwStatus'] = this.ptwStatus;
    data['permit_site_no'] = this.permitSiteNo;
    data['permit_type'] = this.permitType;
    data['permitTypeName'] = this.permitTypeName;
    data['equipment_category_id'] = this.equipmentCategoryId;
    data['equipment_category'] = this.equipmentCategory;
    data['workingAreaId'] = this.workingAreaId;
    data['workingAreaName'] = this.workingAreaName;
    data['description'] = this.description;
    data['request_by_name'] = this.requestByName;
    data['request_datetime'] = this.requestDatetime;
    data['approved_by_name'] = this.approvedByName;
    data['approved_datetime'] = this.approved_datetime;
    data['current_status'] = this.current_status;
    return data;
  }
}
