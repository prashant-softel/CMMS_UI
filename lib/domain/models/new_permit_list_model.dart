import 'dart:convert';

import '../../app/utils/app_constants.dart';

List<NewPermitModel> newPermitListFromJson(String str) =>
    List<NewPermitModel>.from(json.decode(str).map(NewPermitModel.fromJson));

String newPermitListToJson(List<NewPermitModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewPermitModel {
  int? permitId;
  int? ptwStatus;
  int? permitSiteNo;
  int? permitType;
  String? permitTypeName;
  int? equipmentCategoryId;
  String? equipment_categories;
  int? workingAreaId;
  String? workingAreaName;
  String? description;
  String? requestByName;
  int? requestById;
  DateTime? requestDatetime;
  String? approvedByName;
  DateTime? approvedDatetime;
  String? current_status_short;
  int? isExpired;

  NewPermitModel(
      {this.permitId,
      this.ptwStatus,
      this.permitSiteNo,
      this.permitType,
      this.permitTypeName,
      this.equipmentCategoryId,
      this.equipment_categories,
      this.workingAreaId,
      this.workingAreaName,
      this.description,
      this.requestByName,
      this.requestById,
      this.requestDatetime,
      this.approvedByName,
      this.approvedDatetime,
      this.current_status_short,
      this.isExpired});

  NewPermitModel.fromJson(Map<String, dynamic> json) {
    permitId = json['permitId'];
    ptwStatus = json['ptwStatus'];
    permitSiteNo = json['permit_site_no'];
    permitType = json['permit_type'];
    permitTypeName = json['permitTypeName'];
    equipmentCategoryId = json['equipment_category_id'];
    equipment_categories = json['equipment_categories'];
    workingAreaId = json['workingAreaId'];
    workingAreaName = json['workingAreaName'];
    description = json['description'];
    requestByName = json['request_by_name'];
    requestById = json['request_by_id'];
    requestDatetime = json['request_datetime'] == null
        ? null
        : DateTime.parse(json['request_datetime'] as String);
    approvedByName = json['approved_by_name'];
    approvedDatetime = json['approved_datetime'] == null
        ? null
        : DateTime.parse(json['approved_datetime'] as String);
    current_status_short = json['current_status_short'];
    isExpired = json['isExpired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['permitId'] = this.permitId;
    data['ptwStatus'] = this.ptwStatus;
    data['permit_site_no'] = this.permitSiteNo;
    data['permit_type'] = this.permitType;
    data['permitTypeName'] = this.permitTypeName;
    data['equipment_category_id'] = this.equipmentCategoryId;
    data['equipment_categories'] = this.equipment_categories;
    data['workingAreaId'] = this.workingAreaId;
    data['workingAreaName'] = this.workingAreaName;
    data['description'] = this.description;
    data['request_by_name'] = this.requestByName;
    data['request_by_id'] = this.requestById;
    data['request_datetime'] = this.requestDatetime;
    data['approved_by_name'] = this.approvedByName;
    data['approved_datetime'] = this.approvedDatetime;
    data['current_status_short'] = this.current_status_short;
    data['isExpired'] = this.isExpired;
    return data;
  }
}

const int permitStatusBase = 121;
enum PermitStatus {
 PTW_CREATED,///121
 PTW_REJECTED_BY_ISSUER,///122
 PTW_ISSUED,//123
 PTW_REJECTED_BY_APPROVER,//124
 PTW_APPROVE,//125
 PTW_CLOSED,///126
 PTW_CANCELLED_BY_ISSUER,///127
 PTW_CANCELLED_BY_HSE,///128
 PTW_CANCELLED_BY_APPROVER,///129
 PTW_CANCEL_REQUESTED,///130
 PTW_CANCEL_REQUEST_REJECTED,///131
 PTW_CANCEL_REQUEST_APPROVED,///132
 PTW_EXTEND_REQUESTED,////133
 PTW_EXTEND_REQUEST_REJECTED,///134
 PTW_EXTEND_REQUEST_APPROVE,///135
 PTW_LINKED_TO_JOB,///136
 PTW_LINKED_TO_PM,////137
 PTW_LINKED_TO_AUDIT,///138
 PTW_LINKED_TO_HOTO,///139
 PTW_EXPIRED,///140
 PTW_UPDATED,///141
}

class PermitStatusData {
  static Map<String, PermitStatus> permitStatusValues = {
    AppConstants.kPermitStatusCreated: PermitStatus.PTW_CREATED,///121
    AppConstants.kPermitStatusRejectedByIssuer:
        PermitStatus.PTW_REJECTED_BY_ISSUER,///122
    AppConstants.kPermitStatusIssued: PermitStatus.PTW_ISSUED,///123
    AppConstants.kPermitStatusRejectedByApprover:
        PermitStatus.PTW_REJECTED_BY_APPROVER,///124
    AppConstants.kPermitStatusApproved: PermitStatus.PTW_APPROVE,///125
    AppConstants.kPermitStatusClosed: PermitStatus.PTW_CLOSED,///126
    AppConstants.kPermitStatusCancelledByIssuer:
        PermitStatus.PTW_CANCELLED_BY_ISSUER,///127
    AppConstants.kPermitStatusCancelledByHSE: PermitStatus.PTW_CANCELLED_BY_HSE,///128
    AppConstants.kPermitStatusCancelledByApprover:
        PermitStatus.PTW_CANCELLED_BY_APPROVER,///129
    AppConstants.kPermitStatusCancelRequested:
        PermitStatus.PTW_CANCEL_REQUESTED,///130
    AppConstants.kPermitStatusCancelRequestRejected:
        PermitStatus.PTW_CANCEL_REQUEST_REJECTED,///131
    AppConstants.kPermitStatusCancelRequestApproved:
        PermitStatus.PTW_CANCEL_REQUEST_APPROVED,///132
    // AppConstants.kPermitStatusEdit: PermitStatus.PTW_EDIT,
    AppConstants.kPermitStatusExtendRequested:
        PermitStatus.PTW_EXTEND_REQUESTED,///133
    AppConstants.kPermitStatusExtendRequestRejected:
        PermitStatus.PTW_EXTEND_REQUEST_REJECTED,///134
    AppConstants.kPermitStatusExtendRequestApproved:
        PermitStatus.PTW_EXTEND_REQUEST_APPROVE,///135
    AppConstants.kPermitStatusLinkedToJob: PermitStatus.PTW_LINKED_TO_JOB,
    AppConstants.kPermitStatusLinkedToPM: PermitStatus.PTW_LINKED_TO_PM,
    AppConstants.kPermitStatusLinkedToAudit: PermitStatus.PTW_LINKED_TO_AUDIT,
    AppConstants.kPermitStatusLinkedToHOTO: PermitStatus.PTW_LINKED_TO_HOTO,
    AppConstants.kPermitStatusExpired: PermitStatus.PTW_EXPIRED,
  };

  static String getStatusStringFromInt(int? intStatus) {
    if (intStatus == null) {
      return 'UNKNOWN';
    }

    final permitStatus = PermitStatus.values.firstWhere(
        (x) => x.index == (intStatus - 101),
        orElse: () => PermitStatus.PTW_CREATED);
    final statusString = PermitStatusData.permitStatusValues.entries
        .firstWhere((x) => x.value == permitStatus,
            orElse: () => MapEntry("CREATED", PermitStatus.PTW_CREATED))
        .key;
    return statusString;
  }
}
