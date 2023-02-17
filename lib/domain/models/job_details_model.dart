// To parse this JSON data, do
//
//     final jobDetailsModel = jobDetailsModelFromJson(jsonString);

import 'dart:convert';

JobDetailsModel jobDetailsModelFromJson(String str) =>
    JobDetailsModel.fromJson(json.decode(str));

String jobDetailsModelToJson(JobDetailsModel data) =>
    json.encode(data.toJson());

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
    this.workingAreaNameList,
    this.associatedPermit,
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
  dynamic workType;
  dynamic standardAction;
  dynamic breakdownType;
  String? jobTitle;
  String? jobDescription;
  DateTime? breakdownTime;
  int? currentPtwId;
  String? currentPtwTitle;
  List<EquipmentCatList>? equipmentCatList;
  List<WorkingAreaNameList>? workingAreaNameList;
  List<AssociatedPermit>? associatedPermit;
  dynamic lstToolsRequired;

  factory JobDetailsModel.fromJson(Map<String, dynamic> json) =>
      JobDetailsModel(
        id: json["id"],
        facilityId: json["facility_id"],
        facilityName: json["facility_name"],
        blockId: json["block_id"],
        blockName: json["block_name"],
        status: json["status"],
        statusShort: json["status_short"],
        statusLong: json["status_long"],
        createdById: json["created_by_id"],
        createdByName: json["created_by_name"],
        assignedId: json["assigned_id"],
        assignedName: json["assigned_name"],
        jobType: json["job_type"],
        workType: json["work_type"],
        standardAction: json["standard_action"],
        breakdownType: json["breakdown_type"],
        jobTitle: json["job_title"],
        jobDescription: json["job_description"],
        breakdownTime: DateTime.parse(json["breakdown_time"]),
        currentPtwId: json["current_ptw_id"],
        currentPtwTitle: json["current_ptw_title"],
        equipmentCatList: List<EquipmentCatList>.from(json["equipment_cat_list"]
            .map((x) => EquipmentCatList.fromJson(x))),
        workingAreaNameList: List<WorkingAreaNameList>.from(
            json["working_area_name_list"]
                .map((x) => WorkingAreaNameList.fromJson(x))),
        associatedPermit: List<AssociatedPermit>.from(
            json["associated_permit"].map((x) => AssociatedPermit.fromJson(x))),
        lstToolsRequired: json["lst_tools_required"],
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
        "working_area_name_list": List<dynamic>.from(
            workingAreaNameList?.map((x) => x.toJson()) ?? []),
        "associated_permit":
            List<dynamic>.from(associatedPermit?.map((x) => x.toJson()) ?? []),
        "lst_tools_required": lstToolsRequired,
      };
}

class AssociatedPermit {
  AssociatedPermit({
    required this.permitId,
    required this.sitePermitNo,
    this.permitTypeName,
    required this.title,
    required this.issuedByName,
    required this.issueAt,
    required this.ptwStatus,
    required this.ptwStatusShort,
    required this.startDate,
    required this.endDate,
  });

  int permitId;
  String sitePermitNo;
  dynamic permitTypeName;
  String title;
  String issuedByName;
  DateTime issueAt;
  int ptwStatus;
  String ptwStatusShort;
  DateTime startDate;
  DateTime endDate;

  factory AssociatedPermit.fromJson(Map<String, dynamic> json) =>
      AssociatedPermit(
        permitId: json["permitId"],
        sitePermitNo: json["sitePermitNo"],
        permitTypeName: json["permitTypeName"],
        title: json["title"],
        issuedByName: json["issuedByName"],
        issueAt: DateTime.parse(json["issue_at"]),
        ptwStatus: json["ptwStatus"],
        ptwStatusShort: json["ptwStatus_short"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toJson() => {
        "permitId": permitId,
        "sitePermitNo": sitePermitNo,
        "permitTypeName": permitTypeName,
        "title": title,
        "issuedByName": issuedByName,
        "issue_at": issueAt.toIso8601String(),
        "ptwStatus": ptwStatus,
        "ptwStatus_short": ptwStatusShort,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
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

class WorkingAreaNameList {
  WorkingAreaNameList({
    required this.workingAreaId,
    required this.workingAreaName,
  });

  int workingAreaId;
  String workingAreaName;

  factory WorkingAreaNameList.fromJson(Map<String, dynamic> json) =>
      WorkingAreaNameList(
        workingAreaId: json["workingArea_id"],
        workingAreaName: json["workingArea_name"],
      );

  Map<String, dynamic> toJson() => {
        "workingArea_id": workingAreaId,
        "workingArea_name": workingAreaName,
      };
}






//---------------------------------
// // To parse this JSON data, do
// //
// //     final jobDetailModel = jobDetailModelFromJson(jsonString);

// import 'dart:convert';

// List<JobDetailsModel> jobDetailModelFromJson(String str) =>
//     List<JobDetailsModel>.from(
//         json.decode(str).map((x) => JobDetailsModel.fromJson(x)));

// String jobDetailModelToJson(List<JobDetailsModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class JobDetailsModel {
//   JobDetailsModel({
//     this.id,
//     this.facilityName,
//     this.blockId,
//     this.blockName,
//     this.status,
//     this.assignedId,
//     this.assignedName,
//     this.workType,
//     this.jobTitle,
//     this.jobDescription,
//     this.breaKdownTime,
//     this.currentPtwId,
//     this.lstCMequipmentCatList,
//     this.lstCMworkingAreaNameList,
//     this.lstAssociatedPermit,
//   });

//   int? id;
//   String? facilityName;
//   int? blockId;
//   String? blockName;
//   int? status;
//   int? assignedId;
//   String? assignedName;
//   dynamic workType;
//   String? jobTitle;
//   String? jobDescription;
//   dynamic breaKdownTime;
//   int? currentPtwId;
//   List<CMequipmentCatList>? lstCMequipmentCatList;
//   List<CMworkingAreaNameList>? lstCMworkingAreaNameList;
//   List<AssociatedPermit>? lstAssociatedPermit;

//   factory JobDetailsModel.fromJson(Map<String, dynamic> json) =>
//       JobDetailsModel(
//         id: json["id"],
//         facilityName: json["facility_name"],
//         blockId: json["block_id"],
//         blockName: json["block_name"],
//         status: json["status"],
//         assignedId: json["assigned_id"],
//         assignedName: json["assigned_name"],
//         workType: json["workType"],
//         jobTitle: json["job_title"],
//         jobDescription: json["job_description"],
//         breaKdownTime: json["breaKdownTime"],
//         currentPtwId: json["current_ptwId"],
//         lstCMequipmentCatList: List<CMequipmentCatList>.from(
//             json["lstCMequipmentCatList"]
//                 .map((x) => CMequipmentCatList.fromJson(x))),
//         lstCMworkingAreaNameList: List<CMworkingAreaNameList>.from(
//             json["lstCMworkingAreaNameList"]
//                 .map((x) => CMworkingAreaNameList.fromJson(x))),
//         lstAssociatedPermit: List<AssociatedPermit>.from(
//             json["lstAssociatedPermit"]
//                 .map((x) => AssociatedPermit.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "facility_name": facilityName,
//         "block_id": blockId,
//         "block_name": blockName,
//         "status": status,
//         "assigned_id": assignedId,
//         "assigned_name": assignedName,
//         "workType": workType,
//         "job_title": jobTitle,
//         "job_description": jobDescription,
//         "breaKdownTime": breaKdownTime,
//         "current_ptwId": currentPtwId,
//         "lstCMequipmentCatList": List<dynamic>.from(
//             lstCMequipmentCatList?.map((x) => x.toJson()) ?? []),
//         "lstCMworkingAreaNameList": List<dynamic>.from(
//             lstCMworkingAreaNameList?.map((x) => x.toJson()) ?? []),
//         "lstAssociatedPermit": List<dynamic>.from(
//             lstAssociatedPermit?.map((x) => x.toJson()) ?? []),
//       };
// }

// class AssociatedPermit {
//   AssociatedPermit({
//     required this.jobId,
//     required this.sitePermitNo,
//     this.permitTypeName,
//     this.issuedByName,
//     required this.issueAt,
//     required this.ptwStatus,
//   });

//   int jobId;
//   int sitePermitNo;
//   dynamic permitTypeName;
//   dynamic issuedByName;
//   DateTime issueAt;
//   int ptwStatus;

//   factory AssociatedPermit.fromJson(Map<String, dynamic> json) =>
//       AssociatedPermit(
//         jobId: json["jobId"],
//         sitePermitNo: json["sitePermitNo"],
//         permitTypeName: json["permitTypeName"],
//         issuedByName: json["issuedByName"],
//         issueAt: DateTime.parse(json["issue_at"]),
//         ptwStatus: json["ptwStatus"],
//       );

//   Map<String, dynamic> toJson() => {
//         "jobId": jobId,
//         "sitePermitNo": sitePermitNo,
//         "permitTypeName": permitTypeName,
//         "issuedByName": issuedByName,
//         "issue_at": issueAt.toIso8601String(),
//         "ptwStatus": ptwStatus,
//       };
// }

// class CMequipmentCatList {
//   CMequipmentCatList({
//     required this.equipmentCatId,
//     required this.equipmentCatName,
//   });

//   int equipmentCatId;
//   String equipmentCatName;

//   factory CMequipmentCatList.fromJson(Map<String, dynamic> json) =>
//       CMequipmentCatList(
//         equipmentCatId: json["equipmentCat_id"],
//         equipmentCatName: json["equipmentCat_name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "equipmentCat_id": equipmentCatId,
//         "equipmentCat_name": equipmentCatName,
//       };
// }

// class CMworkingAreaNameList {
//   CMworkingAreaNameList({
//     required this.workingAreaId,
//     required this.workingAreaName,
//   });

//   int workingAreaId;
//   String workingAreaName;

//   factory CMworkingAreaNameList.fromJson(Map<String, dynamic> json) =>
//       CMworkingAreaNameList(
//         workingAreaId: json["workingArea_id"],
//         workingAreaName: json["workingArea_name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "workingArea_id": workingAreaId,
//         "workingArea_name": workingAreaName,
//       };
// }
