import 'dart:convert';

import '../../app/utils/utility.dart';

ReturnMrsDetailsModel returnMrsDetailsModelFromJson(String str) =>
    ReturnMrsDetailsModel.fromJson(json.decode(str));

class ReturnMrsDetailsModel {
  int? id;
  int? mrs_ID;
  int? mrs_return_ID;
  int? asset_item_ID;
  String? asset_MDM_code;
  double? requested_qty;
  int? issued_qty;
  int? returned_qty;
  int? used_qty;
  dynamic return_remarks;
  int? approval_required;
  int? status;
  int? flag;
  String? lastmodifieddate;
  int? available_qty;
  dynamic finalRemark;

  ReturnMrsDetailsModel(
      {this.approval_required,
      this.asset_MDM_code,
      this.asset_item_ID,
      this.available_qty,
      this.finalRemark,
      this.flag,
      this.id,
      this.issued_qty,
      this.lastmodifieddate,
      this.mrs_ID,
      this.mrs_return_ID,
      this.requested_qty,
      this.return_remarks,
      this.returned_qty,
      this.status,
      this.used_qty});

  factory ReturnMrsDetailsModel.fromJson(Map<String, dynamic> parsedJson) {
    return ReturnMrsDetailsModel(
      finalRemark: parsedJson['finalRemark'],
      available_qty: parsedJson['available_qty'],
      flag: parsedJson['flag'],
      status: parsedJson['status'],
      approval_required: parsedJson['approval_required'],
      return_remarks: parsedJson['return_remarks'],
      lastmodifieddate: parsedJson['lastmodifieddate'],
      used_qty: parsedJson['used_qty'],
      returned_qty: parsedJson['returned_qty'],
      issued_qty: parsedJson['issued_qty'],
      requested_qty: parsedJson['requested_qty'],
      asset_MDM_code: parsedJson['asset_MDM_code'],
      asset_item_ID: parsedJson['asset_item_ID'],
      mrs_return_ID: parsedJson['mrs_return_ID'],
      mrs_ID: parsedJson['mrs_ID'],
      id: parsedJson['id'],
    );
  }
}
