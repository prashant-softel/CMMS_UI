import 'dart:convert';

import 'package:cmms/domain/models/get_asset_items_model.dart';

MrsDetailsModel mrsDetailsModelFromJson(String str) =>
    MrsDetailsModel.fromJson(json.decode(str));

class MrsDetailsModel {
  dynamic id;
  dynamic requested_by_emp_ID;
  dynamic approver_name;
  dynamic issued_name;
  String? requestd_date;
  dynamic returnDate;
  String? approval_date;
  String? issued_date;
  dynamic approval_status;
  String? requested_by_name;
  dynamic status;
  String? status_short;
  String? status_long;
  String? activity;
  dynamic whereUsedType;
  dynamic whereUsedTypeId;
  String? remarks;
  String? whereUsedTypeName;
  dynamic whereUsedRefID;
  List<GetAssetItemsModel>? cmmrsItems;

  MrsDetailsModel(
      {this.activity,
      this.approval_date,
      this.issued_date,
      this.approval_status,
      this.approver_name,
      this.issued_name,
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
      this.whereUsedRefID,
      this.whereUsedTypeName,
      this.remarks});

  factory MrsDetailsModel.fromJson(Map<String?, dynamic> parsedJson) {
    var list = parsedJson['cmmrsItems'] == null
        ? []
        : parsedJson['cmmrsItems'] as List;
    List<GetAssetItemsModel> cmmrsItems =
        list.map((i) => GetAssetItemsModel.fromJson(i)).toList();

    return MrsDetailsModel(
        activity: parsedJson["activity"] == null ? "" : parsedJson['activity'],
        approval_date: parsedJson["approval_date"] == null
            ? ""
            : parsedJson['approval_date'],
        issued_date:
            parsedJson["issued_date"] == null ? "" : parsedJson['issued_date'],
        approval_status: parsedJson["approval_status"] == null
            ? 0
            : parsedJson['approval_status'],
        approver_name: parsedJson["approver_name"] == null
            ? ""
            : parsedJson['approver_name'],
        issued_name: parsedJson["issued_name"] == null
            ? ""
            : parsedJson['issued_name'],
        id: parsedJson["id"] == null ? 0 : parsedJson['id'],
        status: parsedJson["status"] == null ? 0 : parsedJson['status'],
        status_short: parsedJson["status_short"] == null
            ? ""
            : parsedJson['status_short'],
        status_long:
            parsedJson["status_long"] == null ? "" : parsedJson['status_long'],
        requestd_date: parsedJson["requestd_date"] == null
            ? ""
            : parsedJson['requestd_date'],
        requested_by_emp_ID: parsedJson["requested_by_emp_ID"] == null
            ? 0
            : parsedJson['requested_by_emp_ID'],
        returnDate:
            parsedJson["returnDate"] == null ? "" : parsedJson['returnDate'],
        requested_by_name: parsedJson["requested_by_name"] == null
            ? ""
            : parsedJson['requested_by_name'],
        whereUsedType: parsedJson["whereUsedType"] == null
            ? 0
            : parsedJson['whereUsedPType'],
        whereUsedTypeId: parsedJson["whereUsedTypeId"] == null
            ? 0
            : parsedJson['whereUsedTypeId'],
        whereUsedTypeName: parsedJson["whereUsedTypeName"] == null
            ? ""
            : parsedJson['whereUsedTypeName'],
        whereUsedRefID: parsedJson["whereUsedRefID"] == null
            ? 0
            : parsedJson['whereUsedRefID'],
        remarks: parsedJson["remarks"] == null ? "" : parsedJson['remarks'],
        cmmrsItems: cmmrsItems);
  }
}

// class CmmrsItems {
//   dynamic id;
//   dynamic mrs_return_ID;
//   int? asset_item_ID;
//   String? asset_MDM_code;
//   double? returned_qty;
//   double? available_qty;
//   double? used_qty;
//   double? issued_qty;
//   String? approved_date;
//   String? issued_date;
//   double? requested_qty;
//   String? approval_required;
//   String? asset_name;
//   int? asset_type_ID;
//   String? asset_type;
//   int? status;
//   String? status_short;
//   String? status_long;
//   TextEditingController? issued_qty_controller;
//   int? materialID;
//   int? assetMasterID;
//   String? serial_number;
//   TextEditingController? serial_number_controller;

//   CmmrsItems(
//       { this.approval_required,
//       this.approved_date,
//       this.asset_MDM_code,
//       this.asset_item_ID,
//       this.asset_name,
//       this.asset_type,
//       this.asset_type_ID,
//       this.available_qty,
//       this.id,
//       this.issued_date,
//       this.issued_qty,
//       this.mrs_return_ID,
//       this.requested_qty,
//       this.returned_qty,
//       this.status,
//       this.status_long,
//       this.status_short,
//       this.used_qty,
//       this.issued_qty_controller,
//       this.assetMasterID,
//       this.materialID,
//       this.serial_number_controller,
//       this.serial_number});

//   factory CmmrsItems.fromJson(Map<String, dynamic> parsedJson) {
//     return CmmrsItems(
        // id: parsedJson["id"] == null ? 0 : parsedJson['id'],
        // assetMasterID: parsedJson["assetMasterID"] == null
        //     ? 0
        //     : parsedJson['assetMasterID'],
        // materialID:
        //     parsedJson["materialID"] == null ? 0 : parsedJson['materialID'],
        // mrs_return_ID: parsedJson["mrs_return_ID"] == null
        //     ? 0
        //     : parsedJson['mrs_return_ID'],
        // asset_item_ID: parsedJson["asset_item_ID"] == null
        //     ? 0
        //     : parsedJson['asset_item_ID'],
        // asset_MDM_code: parsedJson["asset_MDM_code"] == null
        //     ? ""
        //     : parsedJson['asset_MDM_code'],
        // returned_qty: parsedJson["returned_qty"] == null
        //     ? 0.0
        //     : parsedJson['returned_qty'],
        // available_qty: parsedJson["available_qty"] == null
        //     ? 0.0
        //     : parsedJson['available_qty'],
        // used_qty: parsedJson["used_qty"] == null ? 0.0 : parsedJson['used_qty'],
        // issued_qty:
        //     parsedJson["issued_qty"] == null ? 0.0 : parsedJson['issued_qty'],
        // serial_number: parsedJson["serial_number"] == null
        //     ? ""
        //     : parsedJson['serial_number'],
        // approved_date: parsedJson["approved_date"] == null
        //     ? ""
        //     : parsedJson['approved_date'],
        // issued_date:
        //     parsedJson["issued_date"] == null ? "" : parsedJson['issued_date'],
        // requested_qty: parsedJson["requested_qty"] == null
        //     ? 0.0
        //     : parsedJson['requested_qty'],
        // approval_required: parsedJson["approval_required"] == null
        //     ? ""
        //     : parsedJson['approval_required'],
        // asset_name:
        //     parsedJson["asset_name"] == null ? "" : parsedJson['asset_name'],
        // asset_type_ID: parsedJson["asset_type_ID"] == null
        //     ? 0
        //     : parsedJson['asset_type_ID'],
        // asset_type:
        //     parsedJson["asset_type"] == null ? "" : parsedJson['asset_type'],
        // status: parsedJson["status"] == null ? 0 : parsedJson['status'],
        // status_short: parsedJson["status_short"] == null
        //     ? ''
        //     : parsedJson['status_short'],
        // status_long:
        //     parsedJson["status_long"] == null ? "" : parsedJson['status_long'],
        // serial_number_controller: TextEditingController(
        //     text: parsedJson["serial_number_controller"] == null
        //         ? ""
        //         : parsedJson['serial_number'].toString()),
        // issued_qty_controller: TextEditingController(
        //     text: parsedJson["issued_qty_controller"] == null
        //         ? ""
        //         : parsedJson['issued_qty'].toString()));
//   }
// }
