// To parse this JSON data, do
//
//     final jobDetailModel = jobDetailModelFromJson(jsonString);

import 'dart:convert';

List<JobDetailsModel> jobDetailModelFromJson(String str) =>
    List<JobDetailsModel>.from(
        json.decode(str).map((x) => JobDetailsModel.fromJson(x)));

String jobDetailModelToJson(List<JobDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobDetailsModel {
  JobDetailsModel({
    this.id,
    this.facilityName,
    this.blockId,
    this.blockName,
    this.status,
    this.assignedId,
    this.assignedName,
    this.workType,
    this.jobTitle,
    this.jobDescription,
    this.breaKdownTime,
    this.currentPtwId,
    this.lstCMequipmentCatList,
    this.lstCMworkingAreaNameList,
    this.lstAssociatedPermit,
  });

  int? id;
  String? facilityName;
  int? blockId;
  String? blockName;
  int? status;
  int? assignedId;
  String? assignedName;
  dynamic workType;
  String? jobTitle;
  String? jobDescription;
  dynamic breaKdownTime;
  int? currentPtwId;
  List<CMequipmentCatList>? lstCMequipmentCatList;
  List<CMworkingAreaNameList>? lstCMworkingAreaNameList;
  List<AssociatedPermit>? lstAssociatedPermit;

  factory JobDetailsModel.fromJson(Map<String, dynamic> json) =>
      JobDetailsModel(
        id: json["id"],
        facilityName: json["facility_name"],
        blockId: json["block_id"],
        blockName: json["block_name"],
        status: json["status"],
        assignedId: json["assigned_id"],
        assignedName: json["assigned_name"],
        workType: json["workType"],
        jobTitle: json["job_title"],
        jobDescription: json["job_description"],
        breaKdownTime: json["breaKdownTime"],
        currentPtwId: json["current_ptwId"],
        lstCMequipmentCatList: List<CMequipmentCatList>.from(
            json["lstCMequipmentCatList"]
                .map((x) => CMequipmentCatList.fromJson(x))),
        lstCMworkingAreaNameList: List<CMworkingAreaNameList>.from(
            json["lstCMworkingAreaNameList"]
                .map((x) => CMworkingAreaNameList.fromJson(x))),
        lstAssociatedPermit: List<AssociatedPermit>.from(
            json["lstAssociatedPermit"]
                .map((x) => AssociatedPermit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "facility_name": facilityName,
        "block_id": blockId,
        "block_name": blockName,
        "status": status,
        "assigned_id": assignedId,
        "assigned_name": assignedName,
        "workType": workType,
        "job_title": jobTitle,
        "job_description": jobDescription,
        "breaKdownTime": breaKdownTime,
        "current_ptwId": currentPtwId,
        "lstCMequipmentCatList": List<dynamic>.from(
            lstCMequipmentCatList?.map((x) => x.toJson()) ?? []),
        "lstCMworkingAreaNameList": List<dynamic>.from(
            lstCMworkingAreaNameList?.map((x) => x.toJson()) ?? []),
        "lstAssociatedPermit": List<dynamic>.from(
            lstAssociatedPermit?.map((x) => x.toJson()) ?? []),
      };
}

class AssociatedPermit {
  AssociatedPermit({
    required this.jobId,
    required this.sitePermitNo,
    this.permitTypeName,
    this.issuedByName,
    required this.issueAt,
    required this.ptwStatus,
  });

  int jobId;
  int sitePermitNo;
  dynamic permitTypeName;
  dynamic issuedByName;
  DateTime issueAt;
  int ptwStatus;

  factory AssociatedPermit.fromJson(Map<String, dynamic> json) =>
      AssociatedPermit(
        jobId: json["jobId"],
        sitePermitNo: json["sitePermitNo"],
        permitTypeName: json["permitTypeName"],
        issuedByName: json["issuedByName"],
        issueAt: DateTime.parse(json["issue_at"]),
        ptwStatus: json["ptwStatus"],
      );

  Map<String, dynamic> toJson() => {
        "jobId": jobId,
        "sitePermitNo": sitePermitNo,
        "permitTypeName": permitTypeName,
        "issuedByName": issuedByName,
        "issue_at": issueAt.toIso8601String(),
        "ptwStatus": ptwStatus,
      };
}

class CMequipmentCatList {
  CMequipmentCatList({
    required this.equipmentCatId,
    required this.equipmentCatName,
  });

  int equipmentCatId;
  String equipmentCatName;

  factory CMequipmentCatList.fromJson(Map<String, dynamic> json) =>
      CMequipmentCatList(
        equipmentCatId: json["equipmentCat_id"],
        equipmentCatName: json["equipmentCat_name"],
      );

  Map<String, dynamic> toJson() => {
        "equipmentCat_id": equipmentCatId,
        "equipmentCat_name": equipmentCatName,
      };
}

class CMworkingAreaNameList {
  CMworkingAreaNameList({
    required this.workingAreaId,
    required this.workingAreaName,
  });

  int workingAreaId;
  String workingAreaName;

  factory CMworkingAreaNameList.fromJson(Map<String, dynamic> json) =>
      CMworkingAreaNameList(
        workingAreaId: json["workingArea_id"],
        workingAreaName: json["workingArea_name"],
      );

  Map<String, dynamic> toJson() => {
        "workingArea_id": workingAreaId,
        "workingArea_name": workingAreaName,
      };
}
