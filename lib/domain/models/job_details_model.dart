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
  List<LstCMequipmentCatList>? lstCMequipmentCatList;
  List<LstCMworkingAreaNameList>? lstCMworkingAreaNameList;
  List<LstAssociatedPermit>? lstAssociatedPermit;

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
        lstCMequipmentCatList: List<LstCMequipmentCatList>.from(
            json["lstCMequipmentCatList"]
                .map((x) => LstCMequipmentCatList.fromJson(x))),
        lstCMworkingAreaNameList: List<LstCMworkingAreaNameList>.from(
            json["lstCMworkingAreaNameList"]
                .map((x) => LstCMworkingAreaNameList.fromJson(x))),
        lstAssociatedPermit: List<LstAssociatedPermit>.from(
            json["lstAssociatedPermit"]
                .map((x) => LstAssociatedPermit.fromJson(x))),
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

class LstAssociatedPermit {
  LstAssociatedPermit({
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

  factory LstAssociatedPermit.fromJson(Map<String, dynamic> json) =>
      LstAssociatedPermit(
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

class LstCMequipmentCatList {
  LstCMequipmentCatList({
    required this.equipmentCatId,
    required this.equipmentCatName,
  });

  int equipmentCatId;
  String equipmentCatName;

  factory LstCMequipmentCatList.fromJson(Map<String, dynamic> json) =>
      LstCMequipmentCatList(
        equipmentCatId: json["equipmentCat_id"],
        equipmentCatName: json["equipmentCat_name"],
      );

  Map<String, dynamic> toJson() => {
        "equipmentCat_id": equipmentCatId,
        "equipmentCat_name": equipmentCatName,
      };
}

class LstCMworkingAreaNameList {
  LstCMworkingAreaNameList({
    required this.workingAreaId,
    required this.workingAreaName,
  });

  int workingAreaId;
  String workingAreaName;

  factory LstCMworkingAreaNameList.fromJson(Map<String, dynamic> json) =>
      LstCMworkingAreaNameList(
        workingAreaId: json["workingArea_id"],
        workingAreaName: json["workingArea_name"],
      );

  Map<String, dynamic> toJson() => {
        "workingArea_id": workingAreaId,
        "workingArea_name": workingAreaName,
      };
}
