import 'dart:convert';

List<ReturnMrsListModel> MrsModelFromJson(String str) =>
    List<ReturnMrsListModel>.from(
        json.decode(str).map((x) => ReturnMrsListModel.fromJson(x)));

String returnmrsListModelToJson(List<ReturnMrsListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReturnMrsListModel {
  int? id;
  int? requested_by_emp_ID;
  String? approver_name;
  dynamic requestd_date;
  String? returnDate;
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
  int? issplitted;
  String? remarks;
  List<CmmsItems>? cmmrsItems;

  ReturnMrsListModel(
      {this.activity,
      this.approval_comment,
      this.approval_date,
      this.approval_status,
      this.approver_name,
      this.cmmrsItems,
      this.id,
      this.requestd_date,
      this.requested_by_emp_ID,
      this.requested_by_name,
      this.returnDate,
      this.status,
      this.status_short,
      this.whereUsedType,
      this.whereUsedTypeId,
      this.issplitted,
      this.remarks,
      this.status_long});

  factory ReturnMrsListModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['cmmrsItems'] as List;
    print(list.runtimeType);
    List<CmmsItems> cmmrsItems =
        list.map((i) => CmmsItems.fromJson(i)).toList();

    return ReturnMrsListModel(
      activity: parsedJson['activity'],
      approval_comment: parsedJson['approval_comment'],
      approval_date: parsedJson['approval_date'],
      approval_status: parsedJson['approval_status'],
      approver_name: parsedJson['approver_name'],
      id: parsedJson['id'],
      requestd_date: parsedJson['requestd_date'],
      requested_by_emp_ID: parsedJson['requested_by_emp_ID'],
      requested_by_name: parsedJson['requested_by_name'],
      returnDate: parsedJson['returnDate'],
      status_short: parsedJson['status_short'],
      whereUsedTypeId: parsedJson['whereUsedRefID'],
      issplitted: parsedJson['is_splited'],
      cmmrsItems: cmmrsItems,
      status: parsedJson['status'],
      whereUsedType: parsedJson['whereUsedType'],
      remarks: parsedJson['remarks'],
      status_long: parsedJson['status_long'],
    );
  }
  Map<String, dynamic> toJson() => {
        "activity": activity,
        "approval_comment": approval_comment,
        "approval_date": approval_date,
        "approval_status": approval_status,
        "approver_name": approver_name,
        "id": id,
        "requestd_date": requestd_date,
        "requested_by_emp_ID": requested_by_emp_ID,
        "requested_by_name": requested_by_name,
        "returnDate": returnDate,
        "status_short": status_short,
        "whereUsedRefID": whereUsedTypeId,
        "is_splited": issplitted,
        "status": status,
        "whereUsedType": whereUsedType,
        "remarks": remarks,
        "status_long": status_long,
        "cmmrsItems":
            List<dynamic>.from(cmmrsItems?.map((x) => x.toJson()) ?? []),
      };
}

class CmmsItems {
  int? id;
  int? mrs_return_ID;
  int? asset_item_ID;
  dynamic asset_MDM_code;
  dynamic returned_qty;
  dynamic available_qty;
  dynamic used_qty;
  dynamic issued_qty;
  String? approved_date;
  String? issued_date;
  dynamic requested_qty;
  String? approval_required;
  String? asset_name;
  int? asset_type_ID;
  String? asset_type;
  int? status;
  String? status_short;
  String? status_long;

  CmmsItems(
      {this.approval_required,
      this.approved_date,
      this.asset_MDM_code,
      this.asset_item_ID,
      this.asset_name,
      this.asset_type,
      this.asset_type_ID,
      this.available_qty,
      this.id,
      this.issued_date,
      this.issued_qty,
      this.mrs_return_ID,
      this.requested_qty,
      this.returned_qty,
      this.status,
      this.status_short,
      this.used_qty});

  factory CmmsItems.fromJson(Map<String, dynamic> parsedJson) {
    return CmmsItems(
        approval_required: parsedJson['approval_required'],
        approved_date: parsedJson['approved_date'],
        asset_MDM_code: parsedJson['asset_MDM_code'],
        asset_item_ID: parsedJson['asset_item_ID'],
        asset_name: parsedJson['asset_name'],
        asset_type: parsedJson['asset_type'],
        asset_type_ID: parsedJson['asset_type_ID'],
        available_qty: parsedJson['available_qty'],
        id: parsedJson['id'],
        issued_date: parsedJson['issued_date'],
        issued_qty: parsedJson['issued_qty'],
        mrs_return_ID: parsedJson['mrs_return_ID'],
        requested_qty: parsedJson['requested_qty'],
        returned_qty: parsedJson['returned_qty'],
        status: parsedJson['status'],
        status_short: parsedJson['status_short'],
        used_qty: parsedJson['used_qty']);
  }
  Map<String, dynamic> toJson() => {
        "used_qty": used_qty,
        "status_short": status_short,
        "status": status,
        "returned_qty": returned_qty,
        "requested_qty": requested_qty,
        "mrs_return_ID": mrs_return_ID,
        "issued_qty": issued_qty,
        "issued_date": issued_date,
        "id": id,
        "available_qty": available_qty,
        "asset_type_ID": asset_type_ID,
        "approval_required": approval_required,
        "approved_date": approved_date,
        "asset_MDM_code": asset_MDM_code,
        "asset_item_ID": asset_item_ID,
        "asset_name": asset_name,
        "asset_type": asset_type,
      };
}
