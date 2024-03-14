import 'dart:convert';

List<MrsListModel> MrsModelFromJson(String str) => List<MrsListModel>.from(
    json.decode(str).map((x) => MrsListModel.fromJson(x)));

String mrslistModelToJson(List<MrsListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MrsListModel {
  int? id;
  int? requested_by_emp_ID;
  dynamic approver_name;
  String? requestd_date;
  dynamic returnDate;
  String? approval_date;
  int? approval_status;
  dynamic approval_comment;
  dynamic requested_by_name;
  int? status;
  String? status_short;
  String? activity;
  String? whereUsedType;
  int? whereUsedTypeId;
  List<CmmsItems>? cmmrsItems;

  MrsListModel(
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
      this.whereUsedTypeId});

  factory MrsListModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['cmmrsItems'] as List;
    print(list.runtimeType);
    List<CmmsItems> cmmrsItems =
        list.map((i) => CmmsItems.fromJson(i)).toList();

    return MrsListModel(
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
      cmmrsItems: cmmrsItems,
      status: parsedJson['status'],
      whereUsedType: parsedJson['whereUsedTypeName'],
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
        "status": status,
        "whereUsedTypeName": whereUsedType,
        "cmmrsItems":
            List<dynamic>.from(cmmrsItems?.map((x) => x.toJson()) ?? []),
      };
}

class CmmsItems {
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
  int? requested_qty;
  String? approval_required;
  String? asset_name;
  int? asset_type_ID;
  String? asset_type;
  String? file_path;
  int? asset_master_id;
  int? status;
  String? status_short;

  CmmsItems(
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
      this.status_short,
      this.used_qty});

  factory CmmsItems.fromJson(Map<String, dynamic> parsedJson) {
    return CmmsItems(
        approval_required: parsedJson['approval_required'],
        approval_status: parsedJson['approval_status'],
        approved_date: parsedJson['approved_date'],
        asset_MDM_code: parsedJson['asset_MDM_code'],
        asset_item_ID: parsedJson['asset_item_ID'],
        asset_master_id: parsedJson['asset_master_id'],
        asset_name: parsedJson['asset_name'],
        asset_type: parsedJson['asset_type'],
        asset_type_ID: parsedJson['asset_type_ID'],
        available_qty: parsedJson['available_qty'],
        flag: parsedJson['flag'],
        id: parsedJson['id'],
        issued_date: parsedJson['issued_date'],
        issued_qty: parsedJson['issued_qty'],
        mrs_return_ID: parsedJson['mrs_return_ID'],
        requested_qty: parsedJson['requested_qty'],
        returnDate: parsedJson['returnDate'],
        return_remarks: parsedJson['return_remarks'],
        returned_qty: parsedJson['returned_qty'],
        status: parsedJson['status'],
        status_short: parsedJson['status_short'],
        used_qty: parsedJson['used_qty'],
        serial_number: parsedJson['serial_number']);
  }
  Map<String, dynamic> toJson() => {
        "serial_number": serial_number,
        "used_qty": used_qty,
        "status_short": status_short,
        "status": status,
        "returned_qty": returned_qty,
        "return_remarks": return_remarks,
        "returnDate": returnDate,
        "requested_qty": requested_qty,
        "mrs_return_ID": mrs_return_ID,
        "issued_qty": issued_qty,
        "issued_date": issued_date,
        "id": id,
        "flag": flag,
        "available_qty": available_qty,
        "asset_type_ID": asset_type_ID,
        "approval_required": approval_required,
        "approval_status": approval_status,
        "approved_date": approved_date,
        "asset_MDM_code": asset_MDM_code,
        "asset_item_ID": asset_item_ID,
        "asset_master_id": asset_master_id,
        "asset_name": asset_name,
        "asset_type": asset_type,
      };
}
