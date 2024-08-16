// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/domain/models/job_details_model.dart';
import 'package:flutter/material.dart';

List<MRSListByJobIdModel> linkedJobsToPermitModelFromJson(String str) =>
    List<MRSListByJobIdModel>.from(
        json.decode(str).map((x) => MRSListByJobIdModel.fromJson(x)));

String linkedJobsToPermitModelToJson(List<MRSListByJobIdModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MRSListByJobIdModel {
  MRSListByJobIdModel(
      {this.mrsId,
      this.jobId,
      this.jobCardId,
      this.pmId,
      this.mrsItems,
      this.status,
      this.status_short,
      this.is_mrs_return,
      this.mrs_return_ID,
      this.cmmrsItems,
      this.material_used_by_assets});
  int? is_mrs_return;
  int? mrs_return_ID;
  int? mrsId;
  int? jobId;
  int? jobCardId;
  int? pmId;
  String? mrsItems;
  int? status;
  String? status_short;
  List<CmmrsItems>? cmmrsItems;
  List<WorkingAreaList>? material_used_by_assets;

  factory MRSListByJobIdModel.fromJson(Map<String, dynamic> json) {
    var list = json['cmmrsItems'] == null ? [] : json['cmmrsItems'] as List;
    List<CmmrsItems> cmmrsItems =
        list.map((i) => CmmrsItems.fromJson(i)).toList();
    var usedmaterial = json['material_used_by_assets'] == null
        ? []
        : json['material_used_by_assets'] as List;
    List<WorkingAreaList> usematerialAssets =
        usedmaterial.map((i) => WorkingAreaList.fromJson(i)).toList();
    return MRSListByJobIdModel(
        mrsId: json['mrsId'] == null ? 0 : json['mrsId'],
        jobId: json["jobId"] == null ? 0 : json["jobId"],
        jobCardId: json["jobCardId"] == null ? 0 : json["jobCardId"],
        pmId: json["pmId"] == null ? 0 : json["pmId"],
        mrsItems: json["mrsItems"] == null ? '' : json["mrsItems"],
        status: json["status"] == null ? 0 : json["status"],
        mrs_return_ID:
            json["mrs_return_ID"] == null ? 0 : json["mrs_return_ID"],
        is_mrs_return:
            json["is_mrs_return"] == null ? 0 : json["is_mrs_return"],
        status_short: json['status_short'] == null ? '' : json['status_short'],
        cmmrsItems: cmmrsItems,
        material_used_by_assets: usematerialAssets);
  }
  Map<String, dynamic> toJson() => {
        "mrsId": mrsId,
        "is_mrs_return": is_mrs_return,
        "mrs_return_ID": mrs_return_ID,
        "jobId": jobId,
        "jobCardId": jobCardId,
        "pmId": pmId,
        "mrsItems": mrsItems,
        "status": status,
        "status_short": status_short,
      };
}

class CmmrsItems {
  int? id;
  int? mrs_return_ID;
  int? asset_item_ID;
  String? asset_MDM_code;
  double? returned_qty;
  double? available_qty;
  double? used_qty;
  double? draftUsedqty;

  double? issued_qty;
  String? approved_date;
  String? issued_date;
  double? requested_qty;
  String? approval_required;
  String? assetsName;
  int? asset_type_ID;
  String? asset_type;
  int? status;
  String? status_short;
  String? status_long;
  int? transaction_id;

  TextEditingController? issued_qty_controller;
  int? materialID;
  int? assetMasterID;
  String? serial_number;
  String? name;

  CmmrsItems(
      {this.approval_required,
      this.approved_date,
      this.asset_MDM_code,
      this.asset_item_ID,
      this.assetsName,
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
      this.issued_qty_controller,
      this.assetMasterID,
      this.materialID,
      this.serial_number,
      this.name,
      this.transaction_id,
      this.draftUsedqty});

  factory CmmrsItems.fromJson(Map<String, dynamic> parsedJson) {
    return CmmrsItems(
        transaction_id: parsedJson["transaction_id"] == null
            ? 0
            : parsedJson['transaction_id'],
        id: parsedJson["id"] == null ? 0 : parsedJson['id'],
        assetMasterID: parsedJson["assetMasterID"] == null
            ? 0
            : parsedJson['assetMasterID'],
        serial_number: parsedJson["serial_number"] == null
            ? ""
            : parsedJson['serial_number'],
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
        available_qty: parsedJson["available_qty"] == null
            ? 0.0
            : parsedJson['available_qty'],
        used_qty: parsedJson["used_qty"] == null ? 0.0 : parsedJson['used_qty'],
        draftUsedqty:
            parsedJson["used_qty"] == null ? 0.0 : parsedJson['used_qty'],
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
        approval_required: parsedJson["approval_required"] == null
            ? ""
            : parsedJson['approval_required'],
        assetsName:
            parsedJson["asset_name"] == null ? "" : parsedJson['asset_name'],
        asset_type_ID: parsedJson["asset_type_ID"] == null
            ? 0
            : parsedJson['asset_type_ID'],
        asset_type:
            parsedJson["asset_type"] == null ? "" : parsedJson['asset_type'],
        status: parsedJson["status"] == null ? 0 : parsedJson['status'],
        status_short: parsedJson["status_short"] == null
            ? ''
            : parsedJson['status_short'],
        name: "${parsedJson['asset_name']} (${parsedJson['serial_number']})",
        status_long:
            parsedJson["status_long"] == null ? "" : parsedJson['status_long'],
        issued_qty_controller: TextEditingController(
            text: parsedJson["issued_qty_controller"] == null
                ? ""
                : parsedJson['issued_qty'].toString()));
  }

  map(DataCell Function(dynamic mapData) param0) {}
}

// class MaterialUsedAssets {
//   int? asset_id;
//   String? asset_name;
//   List<UsedItems>? items;
//   MaterialUsedAssets({this.asset_id, this.items, this.asset_name});

//   factory MaterialUsedAssets.fromJson(Map<String, dynamic> parsedJson) {
//     var list = parsedJson['items'] == null ? [] : parsedJson['items'] as List;
//     List<UsedItems> usedItems = list.map((i) => UsedItems.fromJson(i)).toList();

//     return MaterialUsedAssets(
//         asset_id: parsedJson["asset_id"] == null ? 0 : parsedJson['asset_id'],
//         asset_name: parsedJson["asset_name"],
//         items: usedItems);
//   }

//   // map(DataCell Function(dynamic mapData) param0) {}
// }

class UsedItems {
  int? sm_asset_id;
  int? mrs_Item_Id;
  dynamic used_qty;
  String? asset_name;
  UsedItems(
      {this.sm_asset_id, this.used_qty, this.mrs_Item_Id, this.asset_name});

  factory UsedItems.fromJson(Map<String, dynamic> parsedJson) {
    return UsedItems(
        sm_asset_id:
            parsedJson["sm_asset_id"] == null ? 0 : parsedJson['sm_asset_id'],
        used_qty: parsedJson["used_qty"],
        asset_name: parsedJson["sm_asset_name"],
        mrs_Item_Id: parsedJson["mrs_Item_Id"]);
  }
}
