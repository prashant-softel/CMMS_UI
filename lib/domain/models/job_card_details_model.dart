import 'dart:convert';

import 'package:cmms/domain/models/employee_model.dart';

List<JobCardDetailsModel> jobCardDetailsModelFromJson(String str) =>
    List<JobCardDetailsModel>.from(
        json.decode(str).map((x) => JobCardDetailsModel.fromJson(x)));

String jobCardDetailsModelToJson(List<JobCardDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobCardDetailsModel {
  JobCardDetailsModel({
    this.plantName,
    this.id,
    this.blockName,
    this.title,
    this.description,
    this.currentEmpId,
    this.jobId,
    this.ptwId,
    this.createdAt,
    this.createdBy,
    this.jcStartAt,
    this.jcStartByName,
    this.jcApprovedByName,
    this.jcRejectedByName,
    this.jcClosedByName,
    this.updatedByName,
    this.jcApproved,
    this.currentStatus,
    this.status,
    this.remarkNew,
    this.statusShort,
    this.statusLong,
    this.lstCmjcJobDetailList,
    this.lstPermitDetailList,
    this.assetCategoryName,
    this.lstCmjcIsolatedDetailList,
    this.lstCmjcLotoDetailList,
    this.lstCmjcEmpList,
    this.fileList,
    this.fileListJc,
    this.toolList,
    this.uploadFileIds,
    this.materialConsumption,
  });

  String? plantName;
  String? blockName;
  String? title;
  String? description;
  int? currentEmpId;
  int? jobId;
  int? ptwId;
  int? id;
  String? createdAt;
  String? createdBy;
  String? jcStartAt;
  String? jcStartByName;
  String? jcApprovedByName;
  String? jcRejectedByName;
  String? jcClosedByName;
  String? updatedByName;
  int? jcApproved;
  String? currentStatus;
  int? status;
  String? remarkNew;
  String? statusShort;
  String? statusLong;
  List<LstCmjcJobDetailList>? lstCmjcJobDetailList;
  List<LstPermitDetailList>? lstPermitDetailList;
  List<AssetCategories>? assetCategoryName;
  List<LstCmjcIsolatedDetailList>? lstCmjcIsolatedDetailList;
  List<LstCmjcLotoDetailList>? lstCmjcLotoDetailList;
  List<EmployeeModel>? lstCmjcEmpList;
  List<FilesModel>? fileList;
  List<FilesModel>? fileListJc;
  List<ToolList>? toolList;
  List<int>? uploadFileIds;
  List<MaterialConsumption>? materialConsumption;

  factory JobCardDetailsModel.fromJson(Map<String, dynamic> json) =>
      JobCardDetailsModel(
        plantName: json["plant_name"],
        id: json["id"],
        blockName: json["block_name"],
        title: json["title"],
        description: json["description"],
        currentEmpId: json["currentEmpID"],
        jobId: json["jobid"],
        ptwId: json["ptwId"],
        createdAt: json["created_at"],
        createdBy: json["created_by"],
        jcStartAt: json["jC_Start_At"],
        jcStartByName: json["jC_Start_By_Name"],
        jcApprovedByName: json["jC_Approved_By_Name"],
        jcRejectedByName: json["jC_Rejected_By_Name"],
        jcClosedByName: json["jC_Closed_by_Name"],
        updatedByName: json["updatedByName"],
        jcApproved: json["jC_Approved"],
        currentStatus: json["current_status"],
        status: json["status"],
        remarkNew: json["remark_new"],
        statusShort: json["status_short"],
        statusLong: json["status_long"],
        lstCmjcJobDetailList: List<LstCmjcJobDetailList>.from(
            json["lstCMJCJobDetailList"]
                .map((x) => LstCmjcJobDetailList.fromJson(x))),
        lstPermitDetailList: List<LstPermitDetailList>.from(
            json["lstPermitDetailList"]
                .map((x) => LstPermitDetailList.fromJson(x))),
        assetCategoryName: List<AssetCategories>.from(
            json["asset_category_name"]
                .map((x) => AssetCategories.fromJson(x))),
        lstCmjcIsolatedDetailList: List<LstCmjcIsolatedDetailList>.from(
            json["lstCMJCIsolatedDetailList"]
                .map((x) => LstCmjcIsolatedDetailList.fromJson(x))),
        lstCmjcLotoDetailList: List<LstCmjcLotoDetailList>.from(
            json["lstCMJCLotoDetailList"]
                .map((x) => LstCmjcLotoDetailList.fromJson(x))),
        lstCmjcEmpList: List<EmployeeModel>.from(
            json["lstCMJCEmpList"].map((x) => EmployeeModel.fromJson(x))),
        fileList: List<FilesModel>.from(
            json["file_list"].map((x) => FilesModel.fromJson(x))),
        fileListJc: List<FilesModel>.from(
            json["file_listJc"].map((x) => FilesModel.fromJson(x))),
        toolList: List<ToolList>.from(
            json["tool_List"].map((x) => ToolList.fromJson(x))),
        uploadFileIds: json["uploadfile_ids"] != null
            ? List<int>.from(json["uploadfile_ids"].map((x) => x))
            : null,
        materialConsumption: List<MaterialConsumption>.from(
            json["material_consumption"]
                .map((x) => MaterialConsumption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "plant_name": plantName,
        "block_name": blockName,
        "id": id,
        "title": title,
        "description": description,
        "currentEmpID": currentEmpId,
        "jobid": jobId,
        "ptwId": ptwId,
        "created_at": createdAt,
        "created_by": createdBy,
        "jC_Start_At": jcStartAt,
        "jC_Start_By_Name": jcStartByName,
        "jC_Approved_By_Name": jcApprovedByName,
        "jC_Rejected_By_Name": jcRejectedByName,
        "jC_Closed_by_Name": jcClosedByName,
        "updatedByName": updatedByName,
        "jC_Approved": jcApproved,
        "current_status": currentStatus,
        "status": status,
        "remark_new": remarkNew,
        "status_short": statusShort,
        "status_long": statusLong,
        "lstCMJCJobDetailList": List<dynamic>.from(
            lstCmjcJobDetailList?.map((x) => x.toJson()) ?? []),
        "lstPermitDetailList": List<dynamic>.from(
            lstPermitDetailList?.map((x) => x.toJson()) ?? []),
        "asset_category_name":
            List<dynamic>.from(assetCategoryName?.map((x) => x.toJson()) ?? []),
        "lstCMJCIsolatedDetailList": List<dynamic>.from(
            lstCmjcIsolatedDetailList?.map((x) => x.toJson()) ?? []),
        "lstCMJCLotoDetailList": List<dynamic>.from(
            lstCmjcLotoDetailList?.map((x) => x.toJson()) ?? []),
        "lstCMJCEmpList":
            List<dynamic>.from(lstCmjcEmpList?.map((x) => x.toJson()) ?? []),
        "file_list": List<dynamic>.from(fileList?.map((x) => x.toJson()) ?? []),
        "file_listJc":
            List<dynamic>.from(fileListJc?.map((x) => x.toJson()) ?? []),
        "tool_List": List<dynamic>.from(toolList?.map((x) => x.toJson()) ?? []),
        "uploadfile_ids": uploadFileIds != null
            ? List<dynamic>.from(uploadFileIds!.map((x) => x))
            : null,
        "material_consumption": List<dynamic>.from(
            materialConsumption?.map((x) => x.toJson()) ?? []),
      };
}

class LstCmjcJobDetailList {
  LstCmjcJobDetailList({
    this.jobId,
    this.jobTitle,
    this.jobAssignedEmployeeName,
    this.jobDescription,
    this.workType,
    this.facilityId,
    this.status,
    this.statusShort,
    this.performBy,
    this.breakdownEndTime,
    this.breakdownStartTime,
    this.jobClosedOn,
    this.jobRaisedOn,
    this.typeOfJob,
    this.turnaroundTimeMinutes,
    this.company,
    this.employee_name,
    this.employee_ID,
  });
  String? company;
  String? employee_name;
  int? employee_ID;
  int? jobId;
  String? jobTitle;
  String? jobAssignedEmployeeName;
  String? jobDescription;
  String? workType;
  int? facilityId;
  int? status;
  String? statusShort;
  String? performBy;
  String? breakdownEndTime;
  String? breakdownStartTime;
  String? jobClosedOn;
  String? jobRaisedOn;
  String? typeOfJob;
  int? turnaroundTimeMinutes;

  factory LstCmjcJobDetailList.fromJson(Map<String, dynamic> json) =>
      LstCmjcJobDetailList(
        jobId: json["job_id"],
        jobTitle: json["job_title"],
        jobAssignedEmployeeName: json["job_assigned_employee_name"],
        jobDescription: json["job_description"],
        workType: json["work_type"],
        facilityId: json["facility_id"],
        status: json["status"],
        statusShort: json["status_short"],
        performBy: json["perform_by"],
        breakdownEndTime: json["breakdown_end_time"],
        breakdownStartTime: json["breakdown_start_time"],
        jobClosedOn: json["job_closed_on"],
        jobRaisedOn: json["job_raised_on"],
        typeOfJob: json["type_of_Job"],
        turnaroundTimeMinutes: json["turnaround_time_minutes"],
        company: json["company"],
        employee_name: json["employee_name"],
        employee_ID: json["employee_ID"],
      );

  Map<String, dynamic> toJson() => {
        "job_id": jobId,
        "job_title": jobTitle,
        "job_assigned_employee_name": jobAssignedEmployeeName,
        "job_description": jobDescription,
        "work_type": workType,
        "facility_id": facilityId,
        "status": status,
        "status_short": statusShort,
        "perform_by": performBy,
        "breakdown_end_time": breakdownEndTime,
        "breakdown_start_time": breakdownStartTime,
        "job_closed_on": jobClosedOn,
        "job_raised_on": jobRaisedOn,
        "type_of_Job": typeOfJob,
        "turnaround_time_minutes": turnaroundTimeMinutes,
        "company": company,
        "employee_name": employee_name,
        "employee_ID": employee_ID,
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
    this.statusShort,
    this.isolationTaken,
    this.isolatedEquipment,
    this.tbTConductedByName,
    this.tbTDoneTime,
    this.startTime,
    this.statusPTW,
    this.tbTDoneCheck,
  });

  int? permitId;
  int? sitePermitNo;
  String? permitType;
  String? permitDescription;
  String? jobCreatedByName;
  String? permitIssuedByName;
  String? permitApprovedByName;
  int? status;
  String? statusShort;
  String? isolationTaken;
  String? isolatedEquipment;
  String? tbTConductedByName;
  String? tbTDoneTime;
  String? startTime;
  int? statusPTW;
  int? tbTDoneCheck;

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
        statusShort: json["status_short"],
        isolationTaken: json["isolation_taken"],
        isolatedEquipment: json["isolated_equipment"],
        tbTConductedByName: json["tbT_conducted_by_name"],
        tbTDoneTime: json["tbT_done_time"],
        startTime: json["start_time"],
        statusPTW: json["status_PTW"],
        tbTDoneCheck: json["tbT_Done_Check"],
      );

  Map<String, dynamic> toJson() => {
        "permit_id": permitId,
        "site_permit_no": sitePermitNo,
        "permit_type": permitType,
        "permit_description": permitDescription,
        "job_created_by_name": jobCreatedByName,
        "permit_issued_by_name": permitIssuedByName,
        "permit_approved_by_name": permitApprovedByName,
        "status": status,
        "status_short": statusShort,
        "isolation_taken": isolationTaken,
        "isolated_equipment": isolatedEquipment,
        "tbT_conducted_by_name": tbTConductedByName,
        "tbT_done_time": tbTDoneTime,
        "start_time": startTime,
        "status_PTW": statusPTW,
        "tbT_Done_Check": tbTDoneCheck,
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
  ToolList({this.toolId, this.toolName, this.noOfTools});

  int? toolId;
  String? toolName;
  int? noOfTools;

  factory ToolList.fromJson(Map<String, dynamic> json) => ToolList(
        toolId: json["toolId"],
        toolName: json["toolName"],
        noOfTools: json["no_of_tools"],
      );

  Map<String, dynamic> toJson() => {
        "toolId": toolId,
        "toolName": toolName,
        "no_of_tools": noOfTools,
      };
}

class AssetCategories {
  AssetCategories({
    this.equipmentName,
    this.equipmentCategory,
  });

  String? equipmentName;
  String? equipmentCategory;

  factory AssetCategories.fromJson(Map<String, dynamic> json) =>
      AssetCategories(
        equipmentName: json["equipment_name"],
        equipmentCategory: json["equipment_category"],
      );

  Map<String, dynamic> toJson() => {
        "equipment_name": equipmentName,
        "equipment_category": equipmentCategory,
      };
}

class MaterialConsumption {
  MaterialConsumption({
    this.materialId,
    this.materialName,
    this.usedQty,
    this.issuedQty,
    this.materialType,
    this.equipmentId,
  });

  int? materialId;
  String? materialName;
  double? usedQty;
  double? issuedQty;
  String? materialType;
  int? equipmentId;

  factory MaterialConsumption.fromJson(Map<String, dynamic> json) =>
      MaterialConsumption(
        materialId: json["material_ID"],
        materialName: json["material_name"],
        usedQty: json["used_qty"]?.toDouble(),
        issuedQty: json["issued_qty"]?.toDouble(),
        materialType: json["material_type"],
        equipmentId: json["equipment_ID"],
      );

  Map<String, dynamic> toJson() => {
        "material_ID": materialId,
        "material_name": materialName,
        "used_qty": usedQty,
        "issued_qty": issuedQty,
        "material_type": materialType,
        "equipment_ID": equipmentId,
      };
}

class LstCmjcIsolatedDetailList {
  LstCmjcIsolatedDetailList({this.isolatedAssestLoto});

  String? isolatedAssestLoto;

  factory LstCmjcIsolatedDetailList.fromJson(Map<String, dynamic> json) =>
      LstCmjcIsolatedDetailList(
        isolatedAssestLoto: json["isolated_assest_loto"],
      );

  Map<String, dynamic> toJson() => {
        "isolated_assest_loto": isolatedAssestLoto,
      };
}

class LstCmjcLotoDetailList {
  LstCmjcLotoDetailList({this.isolatedAssestLoto});

  String? isolatedAssestLoto;

  factory LstCmjcLotoDetailList.fromJson(Map<String, dynamic> json) =>
      LstCmjcLotoDetailList(
        isolatedAssestLoto: json["isolated_assest_loto"],
      );

  Map<String, dynamic> toJson() => {
        "isolated_assest_loto": isolatedAssestLoto,
      };
}
