import 'dart:convert';

import 'package:cmms/domain/models/create_permit_model.dart';
import 'package:cmms/domain/models/new_permit_details_model.dart';

NewPermitDetailModel newPermitDetailModelFromJson(String str) =>
    NewPermitDetailModel.fromJson(json.decode(str));

String newPermitDetailModelToJson(NewPermitDetailModel data) =>
    json.encode(data.toJson());

class NewPermitDetailModel {
  int? isExpired;
  int? insertedId;
  int? ptwStatus;
  int? permitNo;
  String? sitePermitNo;
  int? permitTypeid;
  int? job_type_id;
  int? sop_type_id;
  int? requester_id;
  String? requestedByName;
  String? cancelRequestByDesignation;
  String? cancelRequestByCompany;
  String? approverDesignation;
  String? requesterDesignation;
  String? requesterCompany;
  String? approverCompany;
  String? permitTypeName;
  String? job_type_name;
  String? sop_type_name;
  String? title;
  String? description;
  String? siteName;
  String? blockName;
  String? tbT_Done_By;
  DateTime? tbT_Done_At;
  DateTime? start_datetime;
  String? end_datetime;
  String? permitArea;
  int? workingTime;
  String? issuedByName;
  DateTime? issue_at;
  DateTime? request_datetime;
  String? approvedByName;
  DateTime? approve_at;
  String? completedByName;
  DateTime? close_at;
  String? closedByName;
  String? cancelRequestByName;
  DateTime? cancel_at;
  String? current_status_short;
  List<ListSafetyQuestion>? safety_question_list;
  List<ListEmployees?>? employee_list;
  List<FileList>? file_list;
  List<ListIsolation?>? lstIsolation;
  List<ListCategory?>? lstCategory;
  List<LotoLists>? loto_list;
  List<LotoOtherDetails>? lotoOtherDetails;

  List<ListAssociatedJob?>? lstAssociatedJobs;
  List<ListAssociatedPm?>? lstAssociatedPM;
  List<ListAssociatedMC?>? lstAssociatedMC;
  List<int?>? category_ids;

  ExtendDetails? extendDetails;
  CancelDetails? cancelDetails;
  CloseDetails? closeDetails;
  String? physical_iso_remark;
  bool? is_TBT_Expire;
  int? is_loto_required;
  int? tbT_Done_Check;
  int? is_physical_iso_required;
  // int? sop_type_id;
  // int? issuer_id;
  // int? approver_id;
  // int? user_id;
  // List<int?>? block_ids;
  // List<int?>? isolated_category_ids;

  NewPermitDetailModel({
    this.category_ids,
    this.isExpired,
    this.insertedId,
    this.ptwStatus,
    this.permitNo,
    this.sitePermitNo,
    this.permitTypeid,
    this.job_type_id,
    this.sop_type_id,
    this.requester_id,
    this.tbT_Done_By,
    this.requestedByName,
    this.cancelRequestByDesignation,
    this.cancelRequestByCompany,
    this.approverDesignation,
    this.requesterDesignation,
    this.requesterCompany,
    this.approverCompany,
    this.permitTypeName,
    this.job_type_name,
    this.sop_type_name,
    this.is_physical_iso_required,
    this.title,
    this.description,
    this.siteName,
    this.blockName,
    this.start_datetime,
    this.end_datetime,
    this.permitArea,
    this.workingTime,
    this.issuedByName,
    this.issue_at,
    this.request_datetime,
    this.approvedByName,
    this.approve_at,
    this.completedByName,
    this.close_at,
    this.closedByName,
    this.cancelRequestByName,
    this.cancel_at,
    this.tbT_Done_At,
    this.current_status_short,
    this.safety_question_list,
    this.employee_list,
    this.lstIsolation,
    this.loto_list,
    this.lotoOtherDetails,
    this.lstCategory,
    this.lstAssociatedJobs,
    this.lstAssociatedPM,
    this.lstAssociatedMC,
    this.extendDetails,
    this.cancelDetails,
    this.closeDetails,
    this.is_TBT_Expire,
    this.physical_iso_remark,
    this.file_list,
    this.is_loto_required,
    this.tbT_Done_Check,
  });

  factory NewPermitDetailModel.fromJson(Map<String, dynamic> json) =>
      NewPermitDetailModel(
        isExpired: json['isExpired'],
        insertedId: json["insertedId"],
        is_physical_iso_required: json["is_physical_iso_required"],
        ptwStatus: json["ptwStatus"],
        permitNo: json["permitNo"],
        tbT_Done_Check: json["tbT_Done_Check"],
        sitePermitNo: json["sitePermitNo"],
        permitTypeid: json["permitTypeid"],
        job_type_id: json['job_type_id'],
        sop_type_id: json['sop_type_id'],
        tbT_Done_By: json['tbT_Done_By'],
        requester_id: json['requester_id'],
        requestedByName: json['requestedByName'],
        cancelRequestByDesignation: json['cancelRequestByDesignation'],
        cancelRequestByCompany: json['cancelRequestByCompany'],
        approverDesignation: json['approverDesignation'],
        approverCompany: json['approverCompany'],
        requesterDesignation: json['requesterDesignation'],
        requesterCompany: json['requesterCompany'],
        permitTypeName: json['permitTypeName'],
        job_type_name: json['job_type_name'] ?? '',
        sop_type_name: json['sop_type_name'] ?? '',
        title: json["title"] ?? '',
        description: json["description"],
        siteName: json['siteName'],
        blockName: json['blockName'],
        start_datetime: json["start_datetime"] == null
            ? null
            : DateTime.parse(json['start_datetime'] as String),
        end_datetime: json["end_datetime"],
        permitArea: json['permitArea'],
        workingTime: json['workingTime'],
        issuedByName: json['issuedByName'],
        issue_at: json["issue_at"] == null
            ? null
            : DateTime.parse(json['issue_at'] as String),
        request_datetime: json["request_datetime"] == null
            ? null
            : DateTime.parse(json['request_datetime'] as String),
        approvedByName: json['approvedByName'],
        approve_at: json["approve_at"] == null
            ? null
            : DateTime.parse(json['approve_at'] as String),
        completedByName: json['completedByName'],
        close_at: json["close_at"] == null
            ? null
            : DateTime.parse(json['close_at'] as String),
        closedByName: json['closedByName'],
        cancelRequestByName: json['cancelRequestByName'] ?? '',
        cancel_at: json["cancel_at"] == null
            ? null
            : DateTime.parse(json['cancel_at'] as String),
        tbT_Done_At: json["tbT_Done_At"] == null
            ? null
            : DateTime.parse(json['tbT_Done_At'] as String),
        current_status_short: json['current_status_short'],
        safety_question_list: json["safety_question_list"] != null
            ? List<ListSafetyQuestion>.from(json["safety_question_list"]
                .map((x) => ListSafetyQuestion.fromJson(x)))
            : [],
        employee_list: json["employee_list"] != null
            ? List<ListEmployees>.from(
                json["employee_list"].map((x) => ListEmployees.fromJson(x)))
            : [],
        category_ids: json["category_ids"] != null
            ? List<int>.from(json["category_ids"])
            : [],
        lstIsolation: json["lstIsolation"] != null
            ? List<ListIsolation>.from(
                json["lstIsolation"].map((x) => ListIsolation.fromJson(x)))
            : [],
        loto_list: json["loto_list"] != null
            ? List<LotoLists>.from(
                json["loto_list"]?.map((x) => LotoLists.fromJson(x)))
            : [],
        lotoOtherDetails: json["lotoOtherDetails"] != null
            ? List<LotoOtherDetails>.from(json["lotoOtherDetails"]
                ?.map((x) => LotoOtherDetails.fromJson(x)))
            : [],
        lstCategory: json["lstCategory"] != null
            ? List<ListCategory>.from(
                json["lstCategory"].map((x) => ListCategory.fromJson(x)))
            : [],
        lstAssociatedJobs: json["lstAssociatedJobs"] != null
            ? List<ListAssociatedJob>.from(json["lstAssociatedJobs"]
                .map((x) => ListAssociatedJob.fromJson(x)))
            : [],
        lstAssociatedPM: json["lstAssociatedPM"] != null
            ? List<ListAssociatedPm>.from(json["lstAssociatedPM"]
                .map((x) => ListAssociatedPm.fromJson(x)))
            : [],
        lstAssociatedMC: json["listAssociatedMC"] != null
            ? List<ListAssociatedMC>.from(json["listAssociatedMC"]
                .map((x) => ListAssociatedMC.fromJson(x)))
            : [],
        file_list: json["file_list"] != null
            ? List<FileList>.from(
                json["file_list"].map((x) => FileList.fromJson(x)))
            : [],
        extendDetails: ExtendDetails.fromJson(json['extendDetails']),
        cancelDetails: CancelDetails.fromJson(json['cancelDetails']),
        closeDetails: CloseDetails.fromJson(json['closeDetails']),
        physical_iso_remark: json['physical_iso_remark'],
        is_TBT_Expire: json['is_TBT_Expire'],
        is_loto_required: json["is_loto_required"],
      );

  Map<String, dynamic> toJson() => {
        "isExpired": isExpired,
        "is_physical_iso_required": is_physical_iso_required,
        "insertedId": insertedId,
        "ptwStatus": ptwStatus,
        "permitNo": permitNo,
        "tbT_Done_Check": tbT_Done_Check,
        "sitePermitNo": sitePermitNo,
        "permitTypeid": permitTypeid,
        "job_type_id": job_type_id,
        "sop_type_id": sop_type_id,
        "tbT_Done_By": tbT_Done_By,
        "sop_type_name": sop_type_name,
        "permitTypeName": permitTypeName,
        "job_type_name": job_type_name,
        "requester_id": requester_id,
        "requestedByName": requestedByName,
        "requesterDesignation": requesterDesignation,
        "cancelRequestByDesignation": cancelRequestByDesignation,
        "cancelRequestByCompany": cancelRequestByCompany,
        "approverDesignation": approverDesignation,
        "requesterCompany": requesterCompany,
        "approverCompany": approverCompany,
        "title": title,
        "description": description,
        "siteName": siteName,
        "blockName": blockName,
        "start_datetime": start_datetime,
        "end_datetime": end_datetime,
        "permitArea": permitArea,
        "workingTime": workingTime,
        "issuedByName": issuedByName,
        "issue_at": issue_at,
        "request_datetime": request_datetime,
        "approvedByName": approvedByName,
        "approve_at": approve_at,
        "completedByName": completedByName,
        "close_at": close_at,
        "closedByName": closedByName,
        "cancelRequestByName": cancelRequestByName,
        "cancel_at": cancel_at,
        "tbT_Done_At": tbT_Done_At,
        "current_status_short": current_status_short,
        "safety_question_list":
            List<dynamic>.from(safety_question_list!.map((x) => x)),
        "employee_list": List<dynamic>.from(employee_list!.map((x) => x)),
        "lstIsolation": List<dynamic>.from(lstIsolation!.map((x) => x)),
        "lstCategory": List<dynamic>.from(lstCategory!.map((x) => x)),
        "loto_list": List<dynamic>.from(loto_list!.map((x) => x.toJson())),
        "lotoOtherDetails":
            List<dynamic>.from(lotoOtherDetails!.map((x) => x.toJson())),
        "file_list": List<dynamic>.from(file_list!.map((x) => x.toJson())),

        "lstAssociatedJobs":
            List<dynamic>.from(lstAssociatedJobs!.map((x) => x)),
        "lstAssociatedPM": List<dynamic>.from(lstAssociatedPM!.map((x) => x)),

        "extendDetails": extendDetails,
        "cancelDetails": cancelDetails,
        "closeDetails": closeDetails,
        "physical_iso_remark": physical_iso_remark,
        "is_TBT_Expire": is_TBT_Expire,
        "is_loto_required": is_loto_required,

        // "approver_id": approver_id,
        // "issuer_id": issuer_id,
        // "sop_type_id": sop_type_id,
        // "user_id": user_id,
        // "block_ids": List<dynamic>.from(block_ids!.map((x) => x)),
        // "isolated_category_ids": List<dynamic>.from(isolated_category_ids!.map((x) => x)),
        // "category_ids": List<dynamic>.from(category_ids!.map((x) => x)),
      };
}

class LotoLists {
  LotoLists({
    this.equipment_name,
    this.equipment_cat,
    this.loto_Key,
    this.loto_lock_number,
    this.employee_name,
    this.loto_id,
  });

  String? equipment_name;
  String? equipment_cat;
  String? loto_Key;
  String? employee_name;
  String? loto_lock_number;
  int? loto_id;

  factory LotoLists.fromJson(Map<String, dynamic> json) => LotoLists(
      equipment_name: json["equipment_name"],
      equipment_cat: json["equipment_cat"],
      loto_Key: json['loto_Key'],
      loto_lock_number: json['loto_lock_number'],
      loto_id: json['loto_id'],
      employee_name: json['employee_name']);

  Map<String, dynamic> toJson() => {
        "equipment_name": equipment_name,
        "equipment_cat": equipment_cat,
        "loto_Key": loto_Key,
        "loto_lock_number": loto_lock_number,
        "employee_name": employee_name,
        "loto_id": loto_id,
      };
}

// class LotoOtherDetail {
//   LotoOtherDetail({
//     this.employee_name,
//     this.contact_number,
//     this.responsibility,
//   });

//   int? contact_number;
//   String? employee_name;
//   String? responsibility;

//   factory LotoOtherDetail.fromJson(Map<String, dynamic> json) =>
//       LotoOtherDetail(
//           employee_name: json["employee_name"],
//           contact_number: json["contact_number"],
//           responsibility: json['responsibility']);

//   Map<String, dynamic> toJson() => {
//         "employee_name": employee_name,
//         "contact_number": contact_number,
//         "responsibility": responsibility
//       };
// }

class ListEmployees {
  ListEmployees({
    this.empName,
    this.resp,
  });

  String? empName;
  String? resp;

  factory ListEmployees.fromJson(Map<String, dynamic> json) => ListEmployees(
        empName: json["empName"],
        resp: json["resp"],
      );

  Map<String, dynamic> toJson() => {
        "empName": empName,
        "resp": resp,
      };
}

class ListSafetyQuestion {
  ListSafetyQuestion({
    this.saftyQuestionId,
    this.saftyQuestionName,
    this.input,
    this.ischeck,
  });

  int? saftyQuestionId;
  String? saftyQuestionName;
  int? input;
  int? ischeck;

  factory ListSafetyQuestion.fromJson(Map<String, dynamic> json) =>
      ListSafetyQuestion(
        saftyQuestionId: json["saftyQuestionId"],
        saftyQuestionName: json["saftyQuestionName"],
        input: json['input'],
        ischeck: json['ischeck'],
      );

  Map<String, dynamic> toJson() => {
        "saftyQuestionId": saftyQuestionId,
        "saftyQuestionName": saftyQuestionName,
        "input": input,
        "ischeck": ischeck,
      };
}

class FileList {
  FileList({
    this.id,
    this.fileName,
    this.fileCategory,
    this.fileSize,
    this.status,
    this.ptwFiles,
    this.description,
  });

  int? id;
  String? fileName;
  String? fileCategory;
  int? fileSize;
  int? status;
  String? ptwFiles;
  String? description;

  factory FileList.fromJson(Map<String, dynamic> json) => FileList(
        id: json["id"],
        fileName: json["fileName"],
        fileCategory: json['fileCategory'],
        fileSize: json['fileSize'],
        status: json['status'],
        ptwFiles: json['ptwFiles'] ?? '',
        description: json['description'] ?? '',
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

class ListIsolation {
  ListIsolation({
    this.isolationAssetsCatID,
    this.isolationAssetsCatName,
  });

  int? isolationAssetsCatID;
  String? isolationAssetsCatName;

  factory ListIsolation.fromJson(Map<String, dynamic> json) => ListIsolation(
        isolationAssetsCatID: json["isolationAssetsCatID"],
        isolationAssetsCatName: json["isolationAssetsCatName"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "isolationAssetsCatID": isolationAssetsCatID,
        "isolationAssetsCatName": isolationAssetsCatName,
      };
}

class ListCategory {
  ListCategory({
    this.equipmentCat,
  });

  String? equipmentCat;

  factory ListCategory.fromJson(Map<String, dynamic> json) => ListCategory(
        equipmentCat: json["equipmentCat"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "equipmentCat": equipmentCat,
      };
}

class ListAssociatedJob {
  ListAssociatedJob({
    this.jobId,
    this.permitId,
    this.title,
    this.equipmentCat,
    this.equipment,
    this.breakdownTime,
    this.assignedTo,
    this.status,
    this.status_short,
  });

  int? jobId;
  int? permitId;
  String? title;
  String? equipmentCat;
  String? equipment;
  DateTime? breakdownTime;
  String? assignedTo;
  int? status;
  String? status_short;

  factory ListAssociatedJob.fromJson(Map<String, dynamic> json) =>
      ListAssociatedJob(
        jobId: json['jobId'],
        permitId: json['permitId'],
        title: json["title"] ?? '',
        equipmentCat: json['equipmentCat'],
        equipment: json['equipment'],
        breakdownTime: json['breakdownTime'] == null
            ? DateTime.now()
            : DateTime.parse(json['breakdownTime'] as String),
        assignedTo: json['assignedTo'] ?? '',
        status: json['status'],
        status_short: json['status_short'],
      );

  Map<String, dynamic> toJson() => {
        "jobId": jobId,
        "permitId": permitId,
        "title": title,
        "equipmentCat": equipmentCat,
        "equipment": equipment,
        "breakdownTime": breakdownTime,
        "assignedTo": assignedTo,
        "status": status,
        "status_short": status_short,
      };
}

class ListAssociatedPm {
  ListAssociatedPm(
      {this.permitId,
      this.title,
      this.equipmentCat,
      this.equipment,
      this.assignedTo,
      this.status,
      this.status_short,
      this.pmId,
      this.startDate});

  int? pmId;
  int? permitId;
  String? title;
  String? equipmentCat;
  String? equipment;
  String? startDate;
  String? assignedTo;
  int? status;
  String? status_short;

  factory ListAssociatedPm.fromJson(Map<String, dynamic> json) =>
      ListAssociatedPm(
        pmId: json['pmId'],
        permitId: json['permitId'],
        title: json["title"] ?? '',
        equipmentCat: json['equipmentCat'],
        equipment: json['equipment'],
        startDate: json['startDate'] == null ? "" : json['startDate'],
        assignedTo: json['assignedTo'] ?? '',
        status: json['status'],
        status_short: json['status_short'],
      );

  Map<String, dynamic> toJson() => {
        "pmId": pmId,
        "permitId": permitId,
        "title": title,
        "equipmentCat": equipmentCat,
        "equipment": equipment,
        "startDate": startDate,
        "assignedTo": assignedTo,
        "status": status,
        "status_short": status_short,
      };
}
class ListAssociatedMC {
  ListAssociatedMC(
      {this.permitId,
      this.mc_id,
      this.title,
      this.equipmentCat,
      this.equipment,
      this.assignedTo,
      this.status,
      this.status_short,
      this.startDate});

  int? permitId;
  int? mc_id;
  String? title;
  String? equipmentCat;
  String? equipment;
  String? startDate;
  String? assignedTo;
  int? status;
  String? status_short;

  factory ListAssociatedMC.fromJson(Map<String, dynamic> json) {
    String? startDate = json['start_date'];
    if (startDate != null && startDate.length > 3) {
      startDate = startDate.substring(0, startDate.length - 3);
    }
    return ListAssociatedMC(
      permitId: json['permitId'],
      mc_id: json['mc_id'],
      title: json["title"] ?? '',
      equipmentCat: json['equipmentCat'],
      equipment: json['equipment'],
      startDate: startDate ?? "",
      assignedTo: json['assignedTo'] ?? '',
      status: json['status'],
      status_short: json['status_short'],
    );
  }

  Map<String, dynamic> toJson() => {
        "permitId": permitId,
        "mc_id": mc_id,
        "title": title,
        "equipmentCat": equipmentCat,
        "equipment": equipment,
        "start_date": startDate,
        "assignedTo": assignedTo,
        "status": status,
        "status_short": status_short,
      };
}

class ExtendDetails {
  ExtendDetails({
    this.conditions,
    this.files,
  });

  List<ExtendConditions>? conditions;
  List<Files>? files;

  factory ExtendDetails.fromJson(Map<String, dynamic> json) => ExtendDetails(
        conditions: json["conditions"] != null
            ? List<ExtendConditions>.from(
                json["conditions"].map((x) => ExtendConditions.fromJson(x)))
            : [],
        files: json["files"] != null
            ? List<Files>.from(json["files"].map((x) => Files.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "conditions": List<dynamic>.from(conditions!.map((x) => x.toJson())),
        "files": List<dynamic>.from(files!.map((x) => x)),
      };
}

class ExtendConditions {
  ExtendConditions({
    this.id,
    this.value,
    this.name,
  });

  int? id;
  int? value;
  String? name;

  factory ExtendConditions.fromJson(Map<String, dynamic> json) =>
      ExtendConditions(
        id: json['id'],
        value: json['value'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "name": name,
      };
}

class Files {
  Files({
    this.fileId,
    this.path,
  });

  int? fileId;
  String? path;

  factory Files.fromJson(Map<String, dynamic> json) => Files(
        fileId: json['fileId'],
        path: json['path'],
      );

  Map<String, dynamic> toJson() => {
        "fileId": fileId,
        "path": path,
      };
}

class CancelDetails {
  CancelDetails({
    this.conditions,
    this.files,
  });

  List<CancelConditions>? conditions;
  List<CancelFiles>? files;

  factory CancelDetails.fromJson(Map<String, dynamic> json) => CancelDetails(
        conditions: json["conditions"] != null
            ? List<CancelConditions>.from(
                json["conditions"].map((x) => CancelConditions.fromJson(x)))
            : [],
        files: json["files"] != null
            ? List<CancelFiles>.from(
                json["files"].map((x) => CancelFiles.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "conditions": List<dynamic>.from(conditions!.map((x) => x.toJson())),
        "files": List<dynamic>.from(files!.map((x) => x)),
      };
}

class CancelConditions {
  CancelConditions({
    this.id,
    this.value,
    this.name,
  });

  int? id;
  int? value;
  String? name;

  factory CancelConditions.fromJson(Map<String, dynamic> json) =>
      CancelConditions(
        id: json['id'],
        value: json['value'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "name": name,
      };
}

class CancelFiles {
  CancelFiles({
    this.fileId,
    this.path,
  });

  int? fileId;
  String? path;

  factory CancelFiles.fromJson(Map<String, dynamic> json) => CancelFiles(
        fileId: json['fileId'],
        path: json['path'],
      );

  Map<String, dynamic> toJson() => {
        "fileId": fileId,
        "path": path,
      };
}

class CloseDetails {
  CloseDetails({
    this.conditions,
    this.files,
  });

  List<CloseConditions>? conditions;
  List<CloseFiles>? files;

  factory CloseDetails.fromJson(Map<String, dynamic> json) => CloseDetails(
        conditions: json["conditions"] != null
            ? List<CloseConditions>.from(
                json["conditions"].map((x) => CloseConditions.fromJson(x)))
            : [],
        files: json["files"] != null
            ? List<CloseFiles>.from(
                json["files"].map((x) => CloseFiles.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "conditions": List<dynamic>.from(conditions!.map((x) => x.toJson())),
        "files": List<dynamic>.from(files!.map((x) => x)),
      };
}

class CloseConditions {
  CloseConditions({
    this.id,
    this.value,
    this.name,
  });

  int? id;
  int? value;
  String? name;

  factory CloseConditions.fromJson(Map<String, dynamic> json) =>
      CloseConditions(
        id: json['id'],
        value: json['value'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "name": name,
      };
}

class CloseFiles {
  CloseFiles({
    this.fileId,
    this.path,
  });

  int? fileId;
  String? path;

  factory CloseFiles.fromJson(Map<String, dynamic> json) => CloseFiles(
        fileId: json['fileId'],
        path: json['path'],
      );

  Map<String, dynamic> toJson() => {
        "fileId": fileId,
        "path": path,
      };
}

String addsafetyToJson(ListSafetyQuestion data) => json.encode(data.toJson());

String addEmploylistToJson(ListEmployees data) => json.encode(data.toJson());

String addListLotoToJson(LotoLists data) => json.encode(data.toJson());

String addFileListToJson(FileList data) => json.encode(data.toJson());

String addListIsolationToJson(ListIsolation data) => json.encode(data.toJson());

String addListCategoryToJson(ListCategory data) => json.encode(data.toJson());

String addListAssocitedJobsToJson(ListAssociatedJob data) =>
    json.encode(data.toJson());

String addListExtendConditionsToJson(ExtendConditions data) =>
    json.encode(data.toJson());

String addListFilesToJson(Files data) => json.encode(data.toJson());

String addListCancelConditionsToJson(CancelConditions data) =>
    json.encode(data.toJson());

String addListCancelFilesToJson(CancelFiles data) => json.encode(data.toJson());

String addListCloseConditionsToJson(CloseConditions data) =>
    json.encode(data.toJson());

String addListCloseFilesToJson(CloseFiles data) => json.encode(data.toJson());
