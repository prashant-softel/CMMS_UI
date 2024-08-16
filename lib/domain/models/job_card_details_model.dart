// To parse this JSON data, do
//
//     final jobCardDetailsModel = jobCardDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/domain/models/employee_model.dart';

List<JobCardDetailsModel> jobCardDetailsModelFromJson(String str) =>
    List<JobCardDetailsModel>.from(
        json.decode(str).map((x) => JobCardDetailsModel.fromJson(x)));

String jobCardDetailsModelToJson(List<JobCardDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobCardDetailsModel {
  JobCardDetailsModel(
      {this.plantName,
      this.blockName,
      this.jcApprovedByName,
      this.updatedByName,
      this.id,
      this.title,
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
      this.assetcatlist,
      this.toolList,
      this.status,
      this.status_long,
      this.status_short,
      this.created_by,
      this.fileListJc,
      this.jC_Approved,
      this.jC_Start_By_Name});

  String? plantName;
  String? blockName;
  String? jcApprovedByName;
  String? updatedByName;
  int? id;
  int? currentEmpId;
  String? currentStatus;
  String? jcClosedByName;
  String? jcRejectedByName;
  String? description;
  int? jC_Approved;
  int? jobId;
  int? ptwId;
  String? title;
  String? created_by;
  List<LstCmjcJobDetailList>? lstCmjcJobDetailList;
  List<LstPermitDetailList>? lstPermitDetailList;
  List<LstCmjcIsolatedDetailList>? lstCmjcIsolatedDetailList;
  List<dynamic>? lstCmjcLotoDetailList;
  List<EmployeeModel>? lstCmjcEmpList;
  List<FilesModel?>? fileList;
  List<FilesModel?>? fileListJc;
  List<ToolList>? toolList;
  List<AssetCategories>? assetcatlist;
  int? status;
  String? status_short;
  String? status_long;
  String? jC_Start_By_Name;
  factory JobCardDetailsModel.fromJson(Map<String, dynamic> json) =>
      JobCardDetailsModel(
        plantName: json["plant_name"],
        blockName: json["block_name"],
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
        title: json["title"],
        status: json["status"],
        jC_Start_By_Name: json["jC_Start_By_Name"],
        status_long: json["status_long"],
        status_short: json["status_short"],
        created_by: json["created_by"],
        jC_Approved: json["jC_Approved"],
        lstCmjcJobDetailList: 
        List<LstCmjcJobDetailList>.from(
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
        lstCmjcEmpList: List<EmployeeModel>.from(
            json["lstCMJCEmpList"].map((x) => EmployeeModel.fromJson(x))),
        fileList: List<FilesModel>.from(
            json["file_list"].map((x) => FilesModel.fromJson(x))),
        fileListJc: List<FilesModel>.from(
            json["file_listJc"].map((x) => FilesModel.fromJson(x))),
        toolList: List<ToolList>.from(
            json["tool_List"].map((x) => ToolList.fromJson(x))),
        assetcatlist: List<AssetCategories>.from(json["asset_category_name"]
            .map((x) => AssetCategories.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "plant_name": plantName,
        "block_name": blockName,
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
        "title": title,
        "status": status,
        "jC_Start_By_Name": jC_Start_By_Name,
        "status_long": status_long,
        "status_short": status_short,
        "created_by": created_by,
        "jC_Approved": jC_Approved,
        "lstCMJCJobDetailList": List<LstCmjcJobDetailList>.from(
            lstCmjcJobDetailList?.map((x) => x.toJson()) ?? []),
        "lstPermitDetailList": List<LstPermitDetailList>.from(
            lstPermitDetailList?.map((x) => x.toJson()) ?? []),
        "lstCMJCIsolatedDetailList": List<LstCmjcIsolatedDetailList>.from(
            lstCmjcIsolatedDetailList?.map((x) => x.toJson()) ?? []),
        "lstCMJCLotoDetailList":
            List<dynamic>.from(lstCmjcLotoDetailList?.map((x) => x) ?? []),
        "lstCMJCEmpList":
            List<dynamic>.from(lstCmjcEmpList?.map((x) => x) ?? []),
        "file_list": List<int>.from(fileList?.map((x) => x) ?? []),
        "tool_List":
            List<ToolList>.from(toolList?.map((x) => x.toJson()) ?? []),
        "asset_category_name": List<AssetCategories>.from(
            assetcatlist?.map((x) => x.toJson()) ?? []),
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
    this.facility_id,
    this.status,
    this.status_short,
  });

  int? jobId;
  String? jobTitle;
  String? jobAssignedEmployeeName;
  String? jobDescription;
  String? workType;
  int? facility_id;
  int? status;
  String? status_short;

  factory LstCmjcJobDetailList.fromJson(Map<String, dynamic> json) =>
      LstCmjcJobDetailList(
        jobId: json["job_id"],
        jobTitle: json["job_title"],
        jobAssignedEmployeeName: json["job_assigned_employee_name"],
        jobDescription: json["job_description"],
        workType: json["work_type"],
        facility_id: json["facility_id"],
        status: json["status"],
        status_short: json["status_short"],
      );

  Map<String, dynamic> toJson() => {
        "job_id": jobId,
        "job_title": jobTitle,
        "job_assigned_employee_name": jobAssignedEmployeeName,
        "job_description": jobDescription,
        "work_type": workType,
        "facility_id": facility_id,
        "status": status,
        "status_short": status_short,
      };
}

class LstPermitDetailList {
  LstPermitDetailList({
    this.permitId,
    this.sitePermitNo,
    this.permitType,
    this.permitDescription,
    this.jobCreatedByName,
    this.permitIssuedByName,
    this.permitApprovedByName,
    this.status,
    this.status_short,
    this.tbT_Done_Check,
  });

  int? permitId;
  int? sitePermitNo;
  String? permitType;
  String? permitDescription;
  String? jobCreatedByName;
  String? permitIssuedByName;
  String? permitApprovedByName;
  int? status;
  String? status_short;
  int? tbT_Done_Check;

  factory LstPermitDetailList.fromJson(Map<String, dynamic> json) =>
      LstPermitDetailList(
        permitId: json["permit_id"],
        sitePermitNo: json["site_permit_no"],
        permitType: json["permit_type"],
        permitDescription: json["permit_description"],
        jobCreatedByName: json["job_created_by_name"],
        permitIssuedByName: json["permit_issued_by_name"],
        permitApprovedByName: json["permit_approved_by_name"],
        status: json["status"],
        status_short: json["status_short"],
        tbT_Done_Check: json["tbT_Done_Check"],
      );

  Map<String, dynamic> toJson() => {
        "permit_id": permitId,
        "site_permit_no": sitePermitNo,
        "permit_type": permitType,
        "permit_description": permitDescription,
        "job_created_by_name": jobCreatedByName,
        "permit_issued_by_name": permitIssuedByName,
        "permit_approved_by_name": permitApprovedByName,
        "status_short": status_short,
        "tbT_Done_Check": tbT_Done_Check
      };
}

class FilesModel {
  int? id;
  String? fileName;
  String? fileCategory;
  int? fileSize;
  int? status;
  String? ptwFiles;
  String? description;

  FilesModel({
    this.id,
    this.fileName,
    this.fileCategory,
    this.fileSize,
    this.status,
    this.ptwFiles,
    this.description,
  });

  factory FilesModel.fromJson(Map<String, dynamic> json) => FilesModel(
        id: json["id"],
        fileName: json["fileName"],
        fileCategory: json["fileCategory"],
        fileSize: json["fileSize"],
        status: json["status"],
        ptwFiles: json["ptwFiles"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fileName": fileName,
        "fileCategory": fileCategory,
        "fileSize": fileSize,
        "status": status,
        "ptwFiles": ptwFiles,
        "description": description,
      };
}

class ToolList {
  ToolList({this.toolId, this.toolName});
  int? toolId;
  String? toolName;

  factory ToolList.fromJson(Map<String, dynamic> json) => ToolList(
        toolId: json["toolId"],
        toolName: json["toolName"],
      );
  Map<String, dynamic> toJson() => {
        "toolId": toolId,
        "toolName": toolName,
      };
}

class UploadFiles {
  List<dynamic>? uploadfile_ids;
  UploadFiles({
    this.uploadfile_ids,
  });
  factory UploadFiles.fromJson(Map<String, dynamic> json) => UploadFiles(
        uploadfile_ids: json["uploadfile_ids"] != null
            ? List<int>.from(json["uploadfile_ids"].map((x) => x))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "uploadfile_ids": List<dynamic>.from(uploadfile_ids!.map((x) => x)),
      };
}

// class SelectedEmployee {
//   int? id;
//   String? name;
//   String? responsibility;

//   SelectedEmployee({this.id, this.name, this.responsibility});

//   factory SelectedEmployee.fromJson(Map<String, dynamic> json) =>
//       SelectedEmployee(
//         id: json["id"],
//         name: json["name"],
//         responsibility: json["responsibility"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "responsibility": responsibility,
//       };
// }

class AssetCategories {
  String? name;
  AssetCategories({this.name});
  factory AssetCategories.fromJson(Map<String, dynamic> json) =>
      AssetCategories(
        name: json["asset_category_name"],
      );
  Map<String, dynamic> toJson() => {
        "asset_category_name": name,
      };
}
