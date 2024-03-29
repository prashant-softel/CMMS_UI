// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<EquipmentListModel> equipmentListModelFromJson(String str) =>
    List<EquipmentListModel>.from(json.decode(str).map((x) => EquipmentListModel.fromJson(x)));

String equipmentListModelToJson(List<EquipmentListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EquipmentListModel {
  int? invId;
  String? invName;
  int? moduleQuantity;
  List<SMBS> smbs;
  bool isExpanded;
  String? selectedDay;
  bool? isAbandonedChecked;
  bool? isCleanedChecked;

  EquipmentListModel({
    this.invId,
    this.invName,
    this.moduleQuantity,
    this.smbs = const [],
    this.isExpanded = false,
    this.isAbandonedChecked = false,
    this.isCleanedChecked = false,
    this.selectedDay,
  });

  factory EquipmentListModel.fromJson(Map<String, dynamic> json) => EquipmentListModel(
        invId: json["invId"],
        invName: json["invName"],
        moduleQuantity: json["moduleQuantity"],
        smbs: json["smbs"] != null ? List<SMBS>.from(json["smbs"].map((x) => SMBS.fromJson(x))) : [],
      );

  Map<String, dynamic> toJson() => {
        "invId": invId,
        "invName": invName,
        "moduleQuantity": moduleQuantity,
        "smbs": List<dynamic>.from(smbs.map((x) => x)),
      };
}

class SMBS {
  SMBS({
    this.parentId,
    this.smbId,
    this.smbName,
    this.isCleanedSmbCheck = false,
    this.isAbandonSmbCheck = false,
    this.moduleQuantity,
    this.selectedDay,
    // this.status,
    // this.short_status,
  });

  int? parentId;
  int? smbId;
  String? smbName;
  bool? isCleanedSmbCheck;
  bool? isAbandonSmbCheck;
  int? moduleQuantity;
  String? selectedDay;
  // int? status;
  // String? short_status;

  factory SMBS.fromJson(Map<String, dynamic> json) => SMBS(
      parentId: json["parentId"],
      smbId: json['smbId'],
      smbName: json['smbName'],
      moduleQuantity: json['moduleQuantity'],
      selectedDay: json["selectedDay"],
      // status: json['status'],
      // short_status: json['short_status'],
      // isCleanedSmbCheck:  json['status'] == 407 ? true : false,
      // isAbandonSmbCheck: json['status'] == 408 ? true : false
      );

  Map<String, dynamic> toJson() => {
        "parentId": parentId,
        "smbId": smbId,
        "smbName": smbName,
        "moduleQuantity": moduleQuantity,
        "selectedDay": selectedDay,
        // "status": status,
        // "short_status": short_status
      };
}

String smbModelToJson(SMBS data) => json.encode(data.toJson());
