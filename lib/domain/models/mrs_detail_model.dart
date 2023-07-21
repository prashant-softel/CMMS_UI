import 'dart:convert';

import 'package:flutter/material.dart';

MrsDetailsModel mrsDetailsModelFromJson(String str) =>
    MrsDetailsModel.fromJson(json.decode(str));

class MrsDetailsModel {
  int? id;
  int? requested_by_emp_ID;
  dynamic approver_name;
  String? requestd_date;
  dynamic returnDate;
  String? approval_date;
  int? approval_status;
  String? requested_by_name;
  int? status;
  String? status_short;
  String? status_long;
  String? activity;
  int? whereUsedType;
  int? whereUsedTypeId;
  String? remarks;

  List<CmmrsItems>? cmmrsItems;

  MrsDetailsModel(
      {this.activity,
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
      this.remarks});

  factory MrsDetailsModel.fromJson(Map<String?, dynamic> parsedJson) {
    var list = parsedJson['cmmrsItems'] as List;
    List<CmmrsItems> cmmrsItems =
        list.map((i) => CmmrsItems.fromJson(i)).toList();

    return MrsDetailsModel(
        activity: parsedJson['activity'],
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
        requested_by_name: parsedJson['requested_by_name'],
        whereUsedType: parsedJson['whereUsedPType'],
        whereUsedTypeId: parsedJson['whereUsedTypeId'],
        remarks: parsedJson['remarks'],
        cmmrsItems: cmmrsItems);
  }
}

class CmmrsItems {
  int? id;
  int? mrs_return_ID;
  int? asset_item_ID;
  String? asset_MDM_code;
  double? returned_qty;
  double? available_qty;
  double? used_qty;
  double? issued_qty;
  String? approved_date;
  String? issued_date;
  double? requested_qty;
  String? approval_required;
  String? asset_name;
  int? asset_type_ID;
  String? asset_type;
  int? status;
  String? status_short;
  String? status_long;
  TextEditingController? issued_qty_controller;

  CmmrsItems(
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
      this.status_long,
      this.status_short,
      this.used_qty,
      this.issued_qty_controller});

  factory CmmrsItems.fromJson(Map<String, dynamic> parsedJson) {
    return CmmrsItems(
        id: parsedJson['id'],
        mrs_return_ID: parsedJson['mrs_return_ID'],
        asset_item_ID: parsedJson['asset_item_ID'],
        asset_MDM_code: parsedJson['asset_MDM_code'],
        returned_qty: parsedJson['returned_qty'],
        available_qty: parsedJson['available_qty'],
        used_qty: parsedJson['used_qty'],
        issued_qty: parsedJson['issued_qty'],
        approved_date: parsedJson['approved_date'],
        issued_date: parsedJson['issued_date'],
        requested_qty: parsedJson['requested_qty'],
        approval_required: parsedJson['approval_required'],
        asset_name: parsedJson['asset_name'],
        asset_type_ID: parsedJson['asset_type_ID'],
        asset_type: parsedJson['asset_type'],
        status: parsedJson['status'],
        status_short: parsedJson['status_short'],
        status_long: parsedJson['status_long'],
        issued_qty_controller:
            TextEditingController(text: parsedJson['issued_qty'].toString()));
  }
}
