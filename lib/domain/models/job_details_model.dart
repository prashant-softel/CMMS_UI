// To parse this JSON data, do
//
//     final jobDetailsModel = jobDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/models/tools_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';

JobDetailsModel jobDetailsModelFromJson(String str) =>
    JobDetailsModel.fromJson(json.decode(str));

JobAssociatedModel jobAssociatedModelFromJson(String str) =>
    JobAssociatedModel.fromJson(json.decode(str));
String jobDetailsModelToJson(JobDetailsModel data) =>
    json.encode(data.toJson());

List<JobDetailsModel> jobDetailsModelListFromJson(String str) =>
    List<JobDetailsModel>.from(json.decode(str).map(JobDetailsModel.fromJson));

String jobDetailsModelListToJson(List<JobDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobDetailsModel {
  JobDetailsModel(
      {this.id,
      this.facilityId,
      this.facilityName,
      this.blockId,
      this.blockName,
      this.status,
      this.statusShort,
      this.statusLong,
      this.createdById,
      this.createdByName,
      this.assignedId,
      this.assignedName,
      this.jobType,
      this.workType,
      this.standardAction,
      this.breakdownType,
      this.jobTitle,
      this.jobDescription,
      this.breakdownTime,
      this.currentPtwId,
      this.currentPtwTitle,
      this.equipmentCatList,
      this.workingAreaList,
      this.workTypeList,
      this.associatedPermitList,
      this.latestJCStatus,
      this.toolsRequiredList,
      this.latestJCStatusShort});

  int? id;
  int? facilityId;
  String? facilityName;
  String? latestJCStatusShort;
  int? blockId;
  String? blockName;
  int? status;
  String? statusShort;
  String? statusLong;
  int? createdById;
  String? createdByName;
  int? assignedId;
  String? assignedName;
  int? jobType;
  List<String?>? workType;
  String? standardAction;
  String? breakdownType;
  String? jobTitle;
  String? jobDescription;
  String? breakdownTime;
  int? currentPtwId;
  String? currentPtwTitle;
  int? latestJCStatus;
  List<InventoryCategoryModel>? equipmentCatList;
  List<InventoryModel>? workingAreaList;
  List<WorkTypeModel>? workTypeList;
  List<AssociatedPermit>? associatedPermitList;
  List<ToolsModel>? toolsRequiredList;

  factory JobDetailsModel.fromJson(Map<String, dynamic> json) =>
      JobDetailsModel(
        id: json["id"] == null ? 0 : json['id'],
        facilityId: json["facility_id"] == null ? 0 : json['facility_id'],
        facilityName:
            json["facility_name"] == null ? '' : json['facility_name'],
        blockId: json["block_id"] == null ? 0 : json['block_id'],
        blockName: json["block_name"] == null ? '' : json['block_name'],
        status: json["status"] == null ? 0 : json['status'],
        statusShort: json["status_short"] == null ? '' : json['status_short'],
        statusLong: json["status_long"] == null ? '' : json['status_long'],
        createdById: json["created_by_id"] == null ? 0 : json['created_by_id'],
        latestJCStatus:
            json["latestJCStatus"] == null ? 0 : json['latestJCStatus'],
        latestJCStatusShort: json["latestJCStatusShort"] == null
            ? 0
            : json['latestJCStatusShort'],
        createdByName:
            json["created_by_name"] == null ? '' : json['created_by_name'],
        assignedId: json["assigned_id"] == null ? 0 : json['assigned_id'],
        assignedName:
            json["assigned_name"] == null ? '' : json['assigned_name'],
        jobType: json["job_type"] == null ? 0 : json['job_type'],
        workType: json["work_type"] == null ? <String>[] : json['work_type'],
        standardAction:
            json["standard_action"] == null ? '' : json['standard_action'],
        breakdownType:
            json["breakdown_type"] == null ? '' : json['breakdown_type'],
        jobTitle: json["job_title"] == null ? '' : json['job_title'],
        jobDescription:
            json["job_description"] == null ? '' : json['job_description'],
        breakdownTime: json['breakdown_time'],
        //DateTime.parse(json["breakdown_time"]),
        currentPtwId:
            json["current_ptw_id"] == null ? 0 : json['current_ptw_id'],
        currentPtwTitle:
            json["current_ptw_title"] == null ? '' : json['current_ptw_title'],
        equipmentCatList: (json["equipment_cat_list"] != null)
            ? List<InventoryCategoryModel>.from(json["equipment_cat_list"]
                .map((x) => InventoryCategoryModel.fromJson(x)))
            : [],
        workTypeList: json["work_type_list"] != null
            ? List<WorkTypeModel>.from(
                json["work_type_list"].map((x) => WorkTypeModel.fromJson(x)))
            : [],

        workingAreaList: (json["working_area_name_list"] != null)
            ? List<InventoryModel>.from(json["working_area_name_list"]
                .map((x) => InventoryModel.fromJson(x)))
            : [],
        toolsRequiredList: (json["tools_required_list"] != null)
            ? List<ToolsModel>.from(
                json["tools_required_list"].map((x) => ToolsModel.fromJson(x)))
            : [],
        associatedPermitList: (json["associated_permit_list"] != null)
            ? List<AssociatedPermit>.from(json["associated_permit_list"]
                .map((x) => AssociatedPermit.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "facility_id": facilityId,
        "facility_name": facilityName,
        "block_id": blockId,
        "block_name": blockName,
        "status": status,
        "status_short": statusShort,
        "status_long": statusLong,
        "created_by_id": createdById,
        "created_by_name": createdByName,
        "assigned_id": assignedId,
        "assigned_name": assignedName,
        "job_type": jobType,
        "work_type": workType,
        "standard_action": standardAction,
        "breakdown_type": breakdownType,
        "job_title": jobTitle,
        "job_description": jobDescription,
        "breakdown_time": breakdownTime,
        "current_ptw_id": currentPtwId,
        "current_ptw_title": currentPtwTitle,
        "latestJCStatus": latestJCStatus,
        "latestJCStatusShort": latestJCStatusShort,
        "equipment_cat_list":
            List<dynamic>.from(equipmentCatList?.map((x) => x.toJson()) ?? []),
        "working_area_name_list":
            List<dynamic>.from(workingAreaList?.map((x) => x.toJson()) ?? []),
        "work_type_list":
            List<dynamic>.from(workTypeList?.map((x) => x.toJson()) ?? []),
        "associated_permit_list": List<dynamic>.from(
            associatedPermitList?.map((x) => x.toJson()) ?? []),
        "tools_required_list":
            List<dynamic>.from(toolsRequiredList?.map((x) => x.toJson()) ?? []),
      };
}

class AssociatedPermit {
  AssociatedPermit(
      {this.permitId,
      this.sitePermitNo,
      this.permitTypeName,
      this.title,
      this.issuedByName,
      this.issueAt,
      this.ptwStatus,
      this.ptwStatusShort,
      this.startDate,
      this.endDate,
      this.isExpired});

  int? permitId;
  String? sitePermitNo;
  String? permitTypeName;
  String? title;
  String? issuedByName;
  DateTime? issueAt;
  int? ptwStatus;
  String? ptwStatusShort;
  DateTime? startDate;
  DateTime? endDate;
  int? isExpired;

  factory AssociatedPermit.fromJson(Map<String, dynamic> json) =>
      AssociatedPermit(
        permitId: json["permitId"] == null ? 0 : json['permitId'],
        isExpired: json["isExpired"] == null ? 0 : json['isExpired'],
        sitePermitNo: json["sitePermitNo"] == null ? '' : json['sitePermitNo'],
        permitTypeName:
            json["permitTypeName"] == null ? '' : json['permitTypeName'],
        title: json["title"] == null ? '' : json['title'],
        issuedByName: json["issuedByName"] == null ? '' : json['issuedByName'],
        issueAt:
            json['issue_at'] == null ? null : DateTime.parse(json["issue_at"]),
        ptwStatus: json["ptwStatus"] == null ? 0 : json['ptwStatus'],
        ptwStatusShort:
            json["ptwStatus_short"] == null ? '' : json['ptwStatus_short'],
        startDate: json['startDate'] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json['endDate'] == null ? null : DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toJson() => {
        "permitId": permitId,
        "isExpired": isExpired,
        "sitePermitNo": sitePermitNo,
        "permitTypeName": permitTypeName,
        "title": title,
        "issuedByName": issuedByName,
        "issue_at": issueAt?.toIso8601String(),
        "ptwStatus": ptwStatus,
        "ptwStatus_short": ptwStatusShort,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
      };
}

class EquipmentCatList {
  EquipmentCatList({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory EquipmentCatList.fromJson(Map<String, dynamic> json) =>
      EquipmentCatList(
        id: json["equipmentCat_id"],
        name: json["equipmentCat_name"],
      );

  Map<String, dynamic> toJson() => {
        "equipmentCat_id": id,
        "equipmentCat_name": name,
      };
}

class WorkingAreaList {
  int? asset_id;
  String? name;
  List<UsedItems>? items;
  WorkingAreaList({this.asset_id, this.items, this.name});

  factory WorkingAreaList.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['items'] == null ? [] : parsedJson['items'] as List;
    List<UsedItems> usedItems = list.map((i) => UsedItems.fromJson(i)).toList();

    return WorkingAreaList(
        asset_id: parsedJson["asset_id"] == null ? 0 : parsedJson['asset_id'],
        name: parsedJson["asset_name"],
        items: usedItems);
  }

  // map(DataCell Function(dynamic mapData) param0) {}
}

// class WorkingAreaList {
//   WorkingAreaList({
//     required this.workingAreaId,
//     required this.name,
//   });

//   int workingAreaId;
//   String name;
//   List<UsedItems>? items;

//   factory WorkingAreaList.fromJson(Map<String, dynamic> json) =>
//       WorkingAreaList(
//         workingAreaId: json["asset_id"],
//         name: json["asset_name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "asset_id": workingAreaId,
//         "asset_name": name,
//       };

//   ///
// }

class WorkTypeList {
  int? workTypeId;
  String? workTypeName;

  WorkTypeList({this.workTypeId, this.workTypeName});

  factory WorkTypeList.fromJson(Map<String, dynamic> json) => WorkTypeList(
        workTypeId: json['workTypeId'],
        workTypeName: json['workTypeName'],
      );

  Map<String, dynamic> toJson() => {
        'workTypeId': workTypeId,
        'workTypeName': workTypeName,
      };
}

///
class JobAssociatedModel {
  JobAssociatedModel(
      {
      // this.id,
      this.jobCardId,
      this.jobCardNo,
      this.jobId,
      this.permitId,
      this.permitNo,
      // this.current_status,
      // this.description,
      this.jobAssingedTo,
      this.jobCardDate,
      this.permitStatus,
      this.endTime,
      this.status,
      this.approvedStatus,
      this.status_short,
      this.permit_status_short,
      this.isExpired});

  // int? id;
  int? jobCardId;
  String? jobCardNo;
  int? jobId;
  int? permitId;
  String? permitNo;
  int? permitStatus;
  String? jobAssingedTo;
  String? jobCardDate;
  String? permit_status_short;
  String? endTime;
  int? status;
  int? approvedStatus;
  String? status_short;
  int? isExpired;

  factory JobAssociatedModel.fromJson(Map<String, dynamic> json) =>
      JobAssociatedModel(
        permitStatus: json["permitStatus"] == null ? 0 : json['permitStatus'],
        isExpired: json["isExpired"] == null ? 0 : json['isExpired'],
        jobCardId: json["jobCardId"] == null ? 0 : json['jobCardId'],
        jobCardNo: json["jobCardNo"] == null ? "" : json['jobCardNo'],
        permit_status_short: json['permit_status_short'],
        jobId: json["jobId"] == null ? 0 : json['jobId'],
        permitId: json["permitId"] == null ? 0 : json['permitId'],
        permitNo: json["permitNo"] == null ? "" : json['permitNo'],
        jobAssingedTo:
            json["jobAssingedTo"] == null ? "" : json['jobAssingedTo'],
        jobCardDate: json["jobCardDate"] == null ? "" : json['jobCardDate'],
        endTime: json["endTime"] == null ? "" : json['endTime'],
        status: json["status"] == null ? 0 : json['status'],
        approvedStatus:
            json["approvedStatus"] == null ? 0 : json['approvedStatus'],
        status_short: json["status_short"] == null ? "" : json['status_short'],
      );

  Map<String, dynamic> toJson() => {
        "permitStatus": permitStatus,
        "isExpired": isExpired,
        "jobCardId": jobCardId,
        "jobCardNo": jobCardNo,
        "permit_status_short": permit_status_short,
        "jobId": jobId,
        "permitId": permitId,
        "permitNo": permitNo,
        "jobAssingedTo": jobAssingedTo,
        "jobCardDate": jobCardDate,
        "endTime": endTime,
        "status": status,
        "approvedStatus": approvedStatus,
        "status_short": status_short,
      };
}

class ToolsRequiredList {
  int? toolId;
  String? toolName;

  ToolsRequiredList(this.toolId, this.toolName);
  factory ToolsRequiredList.fromJson(Map<String, dynamic> json) =>
      ToolsRequiredList(
        json["toolId"] == null ? 0 : json["toolId"],
        json["toolName"] == null ? '' : json["toolName"],
      );
}
