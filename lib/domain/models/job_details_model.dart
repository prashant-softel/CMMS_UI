// To parse this JSON data, do
//
//     final jobDetailsModel = jobDetailsModelFromJson(jsonString);

import 'dart:convert';

JobDetailsModel jobDetailsModelFromJson(String str) =>
    JobDetailsModel.fromJson(json.decode(str));

String jobDetailsModelToJson(JobDetailsModel data) =>
    json.encode(data.toJson());

List<JobDetailsModel> jobDetailsModelListFromJson(String str) =>
    List<JobDetailsModel>.from(json.decode(str).map(JobDetailsModel.fromJson));

String jobDetailsModelListToJson(List<JobDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobDetailsModel {
  JobDetailsModel({
    this.id,
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
    this.lstToolsRequired,
  });

  int? id;
  int? facilityId;
  String? facilityName;
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
  DateTime? breakdownTime;
  int? currentPtwId;
  String? currentPtwTitle;
  List<EquipmentCatList>? equipmentCatList;
  List<WorkingAreaList>? workingAreaList;
  List<WorkTypeList>? workTypeList;
  List<AssociatedPermit>? associatedPermitList;

  dynamic lstToolsRequired;

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
        breakdownTime: json['breakdown_time'] == null
            ? null
            : DateTime.parse(json['breakdown_time'] as String),
        //DateTime.parse(json["breakdown_time"]),
        currentPtwId:
            json["current_ptw_id"] == null ? 0 : json['current_ptw_id'],
        currentPtwTitle:
            json["current_ptw_title"] == null ? '' : json['current_ptw_title'],
        equipmentCatList: (json["equipment_cat_list"] != null)
            ? List<EquipmentCatList>.from(json["equipment_cat_list"]
                .map((x) => EquipmentCatList.fromJson(x)))
            : [],
        workTypeList: json["work_type_list"] != null
            ? List<WorkTypeList>.from(
                json["work_type_list"].map((x) => WorkTypeList.fromJson(x)))
            : [],

        workingAreaList: (json["working_area_name_list"] != null)
            ? List<WorkingAreaList>.from(json["working_area_name_list"]
                .map((x) => WorkingAreaList.fromJson(x)))
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
        "breakdown_time": breakdownTime?.toIso8601String(),
        "current_ptw_id": currentPtwId,
        "current_ptw_title": currentPtwTitle,
        "equipment_cat_list":
            List<dynamic>.from(equipmentCatList?.map((x) => x.toJson()) ?? []),
        "working_area_name_list":
            List<dynamic>.from(workingAreaList?.map((x) => x.toJson()) ?? []),
        "work_type_list":
            List<dynamic>.from(workTypeList?.map((x) => x.toJson()) ?? []),
        "associated_permit_list": List<dynamic>.from(
            associatedPermitList?.map((x) => x.toJson()) ?? []),
        "lst_tools_required": lstToolsRequired,
      };
}

class AssociatedPermit {
  AssociatedPermit({
    this.permitId,
    this.sitePermitNo,
    this.permitTypeName,
    this.title,
    this.issuedByName,
    this.issueAt,
    this.ptwStatus,
    this.ptwStatusShort,
    this.startDate,
    this.endDate,
  });

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

  factory AssociatedPermit.fromJson(Map<String, dynamic> json) =>
      AssociatedPermit(
        permitId: json["permitId"] == null ? 0 : json['permitId'],
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
    required this.equipmentCatId,
    required this.equipmentCatName,
  });

  int equipmentCatId;
  String equipmentCatName;

  factory EquipmentCatList.fromJson(Map<String, dynamic> json) =>
      EquipmentCatList(
        equipmentCatId: json["equipmentCat_id"],
        equipmentCatName: json["equipmentCat_name"],
      );

  Map<String, dynamic> toJson() => {
        "equipmentCat_id": equipmentCatId,
        "equipmentCat_name": equipmentCatName,
      };
}

class WorkingAreaList {
  WorkingAreaList({
    required this.workingAreaId,
    required this.workingAreaName,
  });

  int workingAreaId;
  String workingAreaName;

  factory WorkingAreaList.fromJson(Map<String, dynamic> json) =>
      WorkingAreaList(
        workingAreaId: json["workingArea_id"],
        workingAreaName: json["workingArea_name"],
      );

  Map<String, dynamic> toJson() => {
        "workingArea_id": workingAreaId,
        "workingArea_name": workingAreaName,
      };

  ///
}

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

