// To parse this JSON data, do
//
//     final jobCardDetailsModel = jobCardDetailsModelFromJson(jsonString);

import 'dart:convert';

List<JobCardDetailsModel> jobCardDetailsModelFromJson(String str) =>
    List<JobCardDetailsModel>.from(
        json.decode(str).map((x) => JobCardDetailsModel.fromJson(x)));

String jobCardDetailsModelToJson(List<JobCardDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobCardDetailsModel {
  JobCardDetailsModel({
    this.plantName,
    this.assetCategoryName,
    this.jcApprovedByName,
    this.updatedByName,
    this.id,
    this.currentEmpId,
    this.currentStatus,
    this.jcClosedByName,
    this.jcRejectedByName,
    this.description,
    this.jobId,
    this.ptwId,
    this.lstCmjcJobDetailList,
    this.lstPermitDetailList,
    this.lstCmjcIsolatedDetailList,
    this.lstCmjcLotoDetailList,
    this.lstCmjcEmpList,
    this.fileList,
  });

  String? plantName;
  String? assetCategoryName;
  String? jcApprovedByName;
  String? updatedByName;
  int? id;
  int? currentEmpId;
  dynamic currentStatus;
  String? jcClosedByName;
  String? jcRejectedByName;
  String? description;
  int? jobId;
  int? ptwId;
  List<LstCmjcJobDetailList>? lstCmjcJobDetailList;
  List<LstPermitDetailList>? lstPermitDetailList;
  List<LstCmjcIsolatedDetailList>? lstCmjcIsolatedDetailList;
  List<dynamic>? lstCmjcLotoDetailList;
  List<dynamic>? lstCmjcEmpList;
  List<dynamic>? fileList;

  factory JobCardDetailsModel.fromJson(Map<String, dynamic> json) =>
      JobCardDetailsModel(
        plantName: json["plant_name"],
        assetCategoryName: json["asset_category_name"],
        jcApprovedByName: json["jC_Approved_By_Name"],
        updatedByName: json["updatedByName"],
        id: json["id"],
        currentEmpId: json["currentEmpID"],
        currentStatus: json["current_status"],
        jcClosedByName: json["jC_Closed_by_Name"],
        jcRejectedByName: json["jC_Rejected_By_Name"],
        description: json["description"],
        jobId: json["jobid"],
        ptwId: json["ptwId"],
        lstCmjcJobDetailList: List<LstCmjcJobDetailList>.from(
            json["lstCMJCJobDetailList"]
                .map((x) => LstCmjcJobDetailList.fromJson(x))),
        lstPermitDetailList: List<LstPermitDetailList>.from(
            json["lstPermitDetailList"]
                .map((x) => LstPermitDetailList.fromJson(x))),
        lstCmjcIsolatedDetailList: List<LstCmjcIsolatedDetailList>.from(
            json["lstCMJCIsolatedDetailList"]
                .map((x) => LstCmjcIsolatedDetailList.fromJson(x))),
        lstCmjcLotoDetailList:
            List<dynamic>.from(json["lstCMJCLotoDetailList"].map((x) => x)),
        lstCmjcEmpList:
            List<dynamic>.from(json["lstCMJCEmpList"].map((x) => x)),
        fileList: List<dynamic>.from(json["file_list"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "plant_name": plantName,
        "asset_category_name": assetCategoryName,
        "jC_Approved_By_Name": jcApprovedByName,
        "updatedByName": updatedByName,
        "id": id,
        "currentEmpID": currentEmpId,
        "current_status": currentStatus,
        "jC_Closed_by_Name": jcClosedByName,
        "jC_Rejected_By_Name": jcRejectedByName,
        "description": description,
        "jobid": jobId,
        "ptwId": ptwId,
        "lstCMJCJobDetailList": List<dynamic>.from(
            lstCmjcJobDetailList?.map((x) => x.toJson()) ?? []),
        "lstPermitDetailList": List<dynamic>.from(
            lstPermitDetailList?.map((x) => x.toJson()) ?? []),
        "lstCMJCIsolatedDetailList": List<dynamic>.from(
            lstCmjcIsolatedDetailList?.map((x) => x.toJson()) ?? []),
        "lstCMJCLotoDetailList":
            List<dynamic>.from(lstCmjcLotoDetailList?.map((x) => x) ?? []),
        "lstCMJCEmpList":
            List<dynamic>.from(lstCmjcEmpList?.map((x) => x) ?? []),
        "file_list": List<dynamic>.from(fileList?.map((x) => x) ?? []),
      };
}

class LstCmjcIsolatedDetailList {
  LstCmjcIsolatedDetailList({
    required this.isolatedAssestName,
  });

  String isolatedAssestName;

  factory LstCmjcIsolatedDetailList.fromJson(Map<String, dynamic> json) =>
      LstCmjcIsolatedDetailList(
        isolatedAssestName: json["isolated_assestName"],
      );

  Map<String, dynamic> toJson() => {
        "isolated_assestName": isolatedAssestName,
      };
}

class LstCmjcJobDetailList {
  LstCmjcJobDetailList({
    this.jobId,
    this.jobTitle,
    this.jobAssignedEmployeeName,
    this.jobDescription,
    this.workType,
  });

  int? jobId;
  String? jobTitle;
  String? jobAssignedEmployeeName;
  String? jobDescription;
  String? workType;

  factory LstCmjcJobDetailList.fromJson(Map<String, dynamic> json) =>
      LstCmjcJobDetailList(
        jobId: json["job_id"],
        jobTitle: json["job_title"],
        jobAssignedEmployeeName: json["job_assigned_employee_name"],
        jobDescription: json["job_description"],
        workType: json["work_type"],
      );

  Map<String, dynamic> toJson() => {
        "job_id": jobId,
        "job_title": jobTitle,
        "job_assigned_employee_name": jobAssignedEmployeeName,
        "job_description": jobDescription,
        "work_type": workType,
      };
}

class LstPermitDetailList {
  LstPermitDetailList({
    required this.permitId,
    required this.sitePermitNo,
    this.permitType,
    required this.permitDescription,
    this.jobCreatedByName,
    this.permitIssuedByName,
    this.permitApprovedByName,
  });

  int permitId;
  int sitePermitNo;
  dynamic permitType;
  String permitDescription;
  String? jobCreatedByName;
  String? permitIssuedByName;
  String? permitApprovedByName;

  factory LstPermitDetailList.fromJson(Map<String, dynamic> json) =>
      LstPermitDetailList(
        permitId: json["permit_id"],
        sitePermitNo: json["site_permit_no"],
        permitType: json["permit_type"],
        permitDescription: json["permit_description"],
        jobCreatedByName: json["job_created_by_name"],
        permitIssuedByName: json["permit_issued_by_name"],
        permitApprovedByName: json["permit_approved_by_name"],
      );

  Map<String, dynamic> toJson() => {
        "permit_id": permitId,
        "site_permit_no": sitePermitNo,
        "permit_type": permitType,
        "permit_description": permitDescription,
        "job_created_by_name": jobCreatedByName,
        "permit_issued_by_name": permitIssuedByName,
        "permit_approved_by_name": permitApprovedByName,
      };
}
