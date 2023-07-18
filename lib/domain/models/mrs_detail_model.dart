import 'dart:convert';

MrsDetailsModel mrsDetailsModelFromJson(String str) =>
    MrsDetailsModel.fromJson(json.decode(str));

class MrsDetailsModel {
  int? id;
  int? requested_by_emp_ID;
  String? approver_name;
  String? requestd_date;
  dynamic returnDate;
  String? approval_date;
  int? approval_status;
  String? approval_comment;
  String? requested_by_name;
  int? status;
  String? status_short;
  String? status_long;
  String? activity;
  int? whereUsedType;
  int? whereUsedTypeId;
  List<CmmrsItems>? cmmrsItems;

  MrsDetailsModel({
    this.activity,
    this.approval_comment,
    this.approval_date,
    this.approval_status,
    this.approver_name,
    this.id,
    this.requestd_date,
    this.requested_by_emp_ID,
    this.returnDate,
    this.status,
    this.whereUsedType,
    this.whereUsedTypeId,
    this.cmmrsItems,
    this.requested_by_name,
    this.status_long,
    this.status_short,
  });

  factory MrsDetailsModel.fromJson(Map<String?, dynamic> parsedJson) {
    var list = parsedJson['cmmrsItems'] as List;
    List<CmmrsItems> cmmrsItems =
        list.map((i) => CmmrsItems.fromJson(i)).toList();

    return MrsDetailsModel(
        activity: parsedJson['activity'],
        approval_comment: parsedJson['approval_comment'],
        approval_date: parsedJson['approval_date'],
        approval_status: parsedJson['approval_status'],
        approver_name: parsedJson['approver_name'],
        id: parsedJson['id'],
        status: parsedJson['status'],
        status_short: parsedJson['status_short'],
        status_long: parsedJson['status_long'],
        requestd_date: parsedJson['requestd_date'],
        requested_by_emp_ID: parsedJson['requested_by_emp_ID'],
        returnDate: parsedJson['returnDate'],
        whereUsedType: parsedJson['whereUsedType'],
        cmmrsItems: cmmrsItems);
  }
}

class CmmrsItems {
  int? id;
  dynamic return_remarks;
  int? mrs_return_ID;
  dynamic finalRemark;
  int? asset_item_ID;
  String? asset_MDM_code;
  dynamic serial_number;
  int? returned_qty;
  int? available_qty;
  int? used_qty;
  int? issued_qty;
  int? flag;
  dynamic returnDate;
  int? approval_status;
  String? approved_date;
  String? issued_date;
  double? requested_qty;
  String? approval_required;
  String? asset_name;
  int? asset_type_ID;
  String? asset_type;
  String? file_path;
  int? asset_master_id;
  int? status;
  String? status_short;
  String? status_long;
  CmmrsItems(
      {this.approval_required,
      this.approval_status,
      this.approved_date,
      this.asset_MDM_code,
      this.asset_item_ID,
      this.asset_master_id,
      this.asset_name,
      this.asset_type,
      this.asset_type_ID,
      this.available_qty,
      this.file_path,
      this.finalRemark,
      this.flag,
      this.id,
      this.issued_date,
      this.issued_qty,
      this.mrs_return_ID,
      this.requested_qty,
      this.returnDate,
      this.return_remarks,
      this.returned_qty,
      this.serial_number,
      this.status,
      this.status_long,
      this.status_short,
      this.used_qty});

  factory CmmrsItems.fromJson(Map<String, dynamic> parsedJson) {
    return CmmrsItems(
      id: parsedJson['id'],
      return_remarks: parsedJson['return_remarks'],
      mrs_return_ID: parsedJson['mrs_return_ID'],
      finalRemark: parsedJson['finalRemark'],
      asset_item_ID: parsedJson['asset_item_ID'],
      asset_MDM_code: parsedJson['asset_MDM_code'],
      serial_number: parsedJson['serial_number'],
      returned_qty: parsedJson['returned_qty'],
      available_qty: parsedJson['available_qty'],
      used_qty: parsedJson['used_qty'],
      issued_qty: parsedJson['issued_qty'],
      flag: parsedJson['flag'],
      returnDate: parsedJson['returnDate'],
      approval_status: parsedJson['approval_status'],
      approved_date: parsedJson['approved_date'],
      issued_date: parsedJson['issued_date'],
      requested_qty: parsedJson['requested_qty'],
      approval_required: parsedJson['approval_required'],
      asset_name: parsedJson['asset_name'],
      asset_type_ID: parsedJson['asset_type_ID'],
      asset_type: parsedJson['asset_type'],
      file_path: parsedJson['file_path'],
      asset_master_id: parsedJson['asset_master_id'],
      status: parsedJson['status'],
      status_short: parsedJson['status_short'],
      status_long: parsedJson['status_long'],
    );
  }
}
