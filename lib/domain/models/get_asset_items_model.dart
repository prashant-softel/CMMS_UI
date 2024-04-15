import 'dart:convert';

import 'package:flutter/material.dart';

List<GetAssetItemsModel> MrsModelFromJson(String str) =>
    List<GetAssetItemsModel>.from(
        json.decode(str).map((x) => GetAssetItemsModel.fromJson(x)));

class GetAssetItemsModel {
  dynamic asset_type_ID;
  dynamic asset_ID;
  String? asset_code;
  String? cat_name;
  dynamic id;
  dynamic serial_number;
  String? name;
  String? asset_type;
  String? approval_required;
  String? file_path;
  dynamic asset_master_id;
  dynamic spare_multi_selection;
  dynamic available_qty;
  dynamic mrs_return_ID;
  dynamic asset_item_ID;
  String? asset_MDM_code;
  double? returned_qty;
  double? used_qty;
  double? issued_qty;
  String? approved_date;
  String? issued_date;
  double? requested_qty;
  String? asset_name;
  dynamic status;
  String? status_short;
  String? status_long;
  TextEditingController? issued_qty_controller;
  dynamic materialID;
  dynamic assetMasterID;
  TextEditingController? serial_number_controller;

  GetAssetItemsModel(
      {this.approval_required,
      this.asset_ID,
      this.asset_code,
      this.asset_master_id,
      this.name,
      this.asset_type,
      this.asset_type_ID,
      this.cat_name,
      this.file_path,
      this.id,
      this.serial_number,
      this.spare_multi_selection,
      this.available_qty,
      this.approved_date,
      this.assetMasterID,
      this.asset_MDM_code,
      this.asset_item_ID,
      this.asset_name,
      this.issued_date,
      this.issued_qty,
      this.issued_qty_controller,
      this.materialID,
      this.mrs_return_ID,
      this.requested_qty,
      this.returned_qty,
      this.serial_number_controller,
      this.status,
      this.status_long,
      this.status_short,
      this.used_qty});

  factory GetAssetItemsModel.fromJson(Map<String, dynamic> parsedJson) {
    return GetAssetItemsModel(
        approval_required: parsedJson['approval_required'],
        asset_ID: parsedJson['asset_ID'],
        asset_code: parsedJson['asset_code'],
        asset_master_id: parsedJson['asset_master_id'],
        name: parsedJson['asset_name'],
        id: parsedJson['id'],
        asset_type: parsedJson['asset_type'],
        asset_type_ID: parsedJson['asset_type_ID'],
        cat_name: parsedJson['cat_name'],
        file_path: parsedJson['file_path'],
        available_qty: parsedJson['available_qty'],
        serial_number: parsedJson['serial_number'],
        spare_multi_selection: parsedJson['spare_multi_selection'],
        assetMasterID: parsedJson["assetMasterID"] == null
            ? 0
            : parsedJson['assetMasterID'],
        materialID:
            parsedJson["materialID"] == null ? 0 : parsedJson['materialID'],
        mrs_return_ID: parsedJson["mrs_return_ID"] == null
            ? 0
            : parsedJson['mrs_return_ID'],
        asset_item_ID: parsedJson["asset_item_ID"] == null
            ? 0
            : parsedJson['asset_item_ID'],
        asset_MDM_code: parsedJson["asset_MDM_code"] == null
            ? ""
            : parsedJson['asset_MDM_code'],
        returned_qty: parsedJson["returned_qty"] == null
            ? 0.0
            : parsedJson['returned_qty'],
        used_qty: parsedJson["used_qty"] == null ? 0.0 : parsedJson['used_qty'],
        issued_qty:
            parsedJson["issued_qty"] == null ? 0.0 : parsedJson['issued_qty'],
        approved_date: parsedJson["approved_date"] == null
            ? ""
            : parsedJson['approved_date'],
        issued_date:
            parsedJson["issued_date"] == null ? "" : parsedJson['issued_date'],
        requested_qty: parsedJson["requested_qty"] == null
            ? 0.0
            : parsedJson['requested_qty'],
        asset_name:
            parsedJson["asset_name"] == null ? "" : parsedJson['asset_name'],
        status: parsedJson["status"] == null ? 0 : parsedJson['status'],
        status_short: parsedJson["status_short"] == null
            ? ''
            : parsedJson['status_short'],
        status_long:
            parsedJson["status_long"] == null ? "" : parsedJson['status_long'],
        serial_number_controller: TextEditingController(
            text: parsedJson["serial_number_controller"] == null
                ? ""
                : parsedJson['serial_number'].toString()),
        issued_qty_controller: TextEditingController(
            text: parsedJson["issued_qty_controller"] == null
                ? ""
                : parsedJson['issued_qty'].toString()));
  }
  Map<String, dynamic> toJson() => {
        "approval_required": approval_required,
        "asset_ID": asset_ID,
        "asset_code": asset_code,
        "asset_master_id": asset_master_id,
        "asset_name": name,
        "id": id,
        "asset_type": asset_type,
        "asset_type_ID": asset_type_ID,
        "cat_name": cat_name,
        "file_path": file_path,
        "serial_number": serial_number,
        "available_qty": available_qty,
      };
}
