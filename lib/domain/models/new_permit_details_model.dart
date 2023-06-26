import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

NewPermitDetailModel newPermitDetailModelFromJson(String str) =>
    NewPermitDetailModel.fromJson(json.decode(str));

String newPermitDetailModelToJson(NewPermitDetailModel data) => json.encode(data.toJson());


class NewPermitDetailModel {
  int? insertedId;
  int? ptwStatus;
  int? permitNo;
  int? sitePermitNo;
  int? permitTypeid;
  int? job_type_id;
  int? sop_type_id;
  String? permitTypeName;
  String? job_type_name;
  String? sop_type_name;
  String? title;
  String? description;
  String? siteName;
  String? blockName;
  String? start_datetime;
  String? end_datetime;
  String? permitArea;
  int? workingTime;
  String? issuedByName;
  String? issue_at;
  String? approvedByName;
  String? approve_at;
  String? completedByName;
  String? close_at;
  String? closedByName;
  String? cancelRequestByName;
  String? cancel_at;
  String? current_status_short;
  List<ListSafetyQuestion>? safety_question_list;
  List<ListEmployees?>? employee_list;
  List<ListIsolation?>? lstIsolation;
  List<ListCategory?>? lstCategory;
  List<LotoLists>? loto_list;
  List<ListAssociatedJob?>? lstAssociatedJob;




  
  // int? sop_type_id;
  // int? issuer_id;
  // int? approver_id;
  // int? user_id;
  // bool? is_isolation_required;
  // List<int?>? block_ids;
  // List<int?>? category_ids;
  // List<int?>? isolated_category_ids;

   NewPermitDetailModel(
       {
      this.insertedId,
      this.ptwStatus,
      this.permitNo,
      this.sitePermitNo,
      this.permitTypeid,
      this.job_type_id,
      this.sop_type_id,
      this.permitTypeName,
      this.job_type_name,
      this.sop_type_name,
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
      this.approvedByName,
      this.approve_at,
      this.completedByName,
      this.close_at,
      this.closedByName,
      this.cancelRequestByName,
      this.cancel_at,
      this.current_status_short,
      this.safety_question_list,
      this.employee_list,
      this.lstIsolation,
      this.loto_list,
      this.lstCategory,
      this.lstAssociatedJob,


      // this.approver_id,
      // this.block_ids,
      // this.category_ids,
      // this.is_isolation_required,
      // this.isolated_category_ids,
      // this.issuer_id,
      // this.sop_type_id,
      // this.user_id,
       });

  factory NewPermitDetailModel.fromJson(Map<String, dynamic> json) =>
      NewPermitDetailModel(
        insertedId: json["insertedId"],
        ptwStatus: json["ptwStatus"],
        permitNo: json["permitNo"],
        sitePermitNo: json["sitePermitNo"],
        permitTypeid: json["permitTypeid"],
        job_type_id: json['job_type_id'],
        sop_type_id: json['sop_type_id'],
        permitTypeName: json['permitTypeName'],
        job_type_name: json['job_type_name'] ?? '',
        sop_type_name: json['sop_type_name'] ?? '',
        title: json["title"] ?? '',
        description: json["description"],
        siteName: json['siteName'],
        blockName: json['blockName'],
        start_datetime: json["start_datetime"],
        end_datetime: json["end_datetime"],
        permitArea: json['permitArea'],
        workingTime: json['workingTime'],
        issuedByName: json['issuedByName'],
        issue_at: json['issue_at'],
        approvedByName: json['approvedByName'],
        approve_at: json['approve_at'],
        completedByName: json['completedByName'],
        close_at: json['close_at'],
        closedByName: json['closedByName'],
        cancelRequestByName: json['cancelRequestByName'] ?? '',
        cancel_at: json['cancel_at'] ?? '',
        current_status_short: json['current_status_short'],
        safety_question_list:json["safety_question_list"]!=null? List<ListSafetyQuestion>.from(
            json["safety_question_list"]
                .map((x) => ListSafetyQuestion.fromJson(x))):[],
        employee_list: json["employee_list"]!=null? List<ListEmployees>.from(
            json["employee_list"].map((x) => ListEmployees.fromJson(x))):[],
        lstIsolation: json["lstIsolation"]!=null? List<ListIsolation>.from(
            json["lstIsolation"].map((x) => ListIsolation.fromJson(x))):[],
        loto_list: json["loto_list"]!=null? List<LotoLists>.from(
            json["loto_list"]?.map((x) => LotoLists.fromJson(x))):[],
        lstCategory: json["lstCategory"]!=null? List<ListCategory>.from(
            json["lstCategory"].map((x) => ListCategory.fromJson(x))):[],
        lstAssociatedJob: json["lstAssociatedJob"]!=null? List<ListAssociatedJob>.from(
            json["lstAssociatedJob"].map((x) => ListAssociatedJob.fromJson(x))):[],




        // approver_id: json["approver_id"],
        // issuer_id: json["issuer_id"],
        // sop_type_id: json["sop_type_id"],
        // user_id: json["user_id"],
        // is_isolation_required: json["is_isolation_required"],
        
        // block_ids:json["block_ids"]!=null? List<int>.from(json["block_ids"].map((x) => x)):[],
        // isolated_category_ids:json["isolated_category_ids"]!=null?
        //     List<int>.from(json["isolated_category_ids"].map((x) => x)):[],
        // category_ids:json["category_ids"]!=null? List<int>.from(json["category_ids"].map((x) => x)):[],
      );

  Map<String, dynamic> toJson() => {
        "insertedId": insertedId,
        "ptwStatus": ptwStatus,
        "permitNo": permitNo,
        "sitePermitNo": sitePermitNo,
        "permitTypeid": permitTypeid,
        "job_type_id": job_type_id,
        "sop_type_id": sop_type_id,
        "sop_type_name" : sop_type_name,
        "permitTypeName": permitTypeName,
        "job_type_name": job_type_name,
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
        "approvedByName": approvedByName,
        "approve_at": approve_at,
        "completedByName": completedByName,
        "close_at": close_at,
        "closedByName": closedByName,
        "cancelRequestByName": cancelRequestByName,
        "cancel_at": cancel_at,
        "current_status_short": current_status_short,
        "safety_question_list": List<dynamic>.from(safety_question_list!.map((x) => x)),
        "employee_list": List<dynamic>.from(employee_list!.map((x) => x)),
        "lstIsolation": List<dynamic>.from(lstIsolation!.map((x) => x)),
        "lstCategory": List<dynamic>.from(lstCategory!.map((x) => x)),
        "loto_list": List<dynamic>.from(loto_list!.map((x) => x.toJson())),

        "lstAssociatedJob": List<dynamic>.from(lstAssociatedJob!.map((x) => x)),


        // "approver_id": approver_id,
        // "issuer_id": issuer_id,
        // "sop_type_id": sop_type_id,
        // "user_id": user_id,
        // "is_isolation_required": is_isolation_required,
        // "block_ids": List<dynamic>.from(block_ids!.map((x) => x)),
        // "isolated_category_ids": List<dynamic>.from(isolated_category_ids!.map((x) => x)),
        // "category_ids": List<dynamic>.from(category_ids!.map((x) => x)),



      };
}

class LotoLists {
  LotoLists({
    this.asset_id,
    this.asset_name,
    this.locksrno,
  });

  int? asset_id;
  String? asset_name;
  String? locksrno;

  factory LotoLists.fromJson(Map<String, dynamic> json) => LotoLists(
        asset_id: json["asset_id"],
        asset_name: json["asset_name"],
        locksrno: json['locksrno']
      );

  Map<String, dynamic> toJson() => {
        "asset_id": asset_id,
        "asset_name": asset_name,
        "locksrno": locksrno
        
      };
}

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
  });

  int? saftyQuestionId;
  String? saftyQuestionName;
  int? input;

  factory ListSafetyQuestion.fromJson(Map<String, dynamic> json) =>
      ListSafetyQuestion(
        saftyQuestionId: json["saftyQuestionId"],
        saftyQuestionName: json["saftyQuestionName"],
        input: json['input']
        
      );

  Map<String, dynamic> toJson() => {
        "saftyQuestionId": saftyQuestionId,
        "saftyQuestionName": saftyQuestionName,
        "input": input,
      };
}

class FileList{
   FileList({
    this.id,
    this.fileName,
    this.fileCategory,
    this.fileSize,
    this.status,
    this.ptwFiles
  });

  int? id;
  String? fileName;
  String? fileCategory;
  int? fileSize;
  int? status;
  String? ptwFiles;

  factory FileList.fromJson(Map<String, dynamic> json) =>
      FileList(
        id: json["id"],
        fileName: json["fileName"],
        fileCategory: json['fileCategory'],
        fileSize: json['fileSize'],
        status: json['status'],
        ptwFiles: json['ptwFiles'] ?? ''
        
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fileName": fileName,
        "fileCategory": fileCategory,
        "fileSize": fileSize,
        "status": status,
        "ptwFiles": ptwFiles
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
    this.jobCardId,
    this.jobTitle,
    this.jobDes,
    this.jobDate,
    this.jobStatus,
  });

  int? jobId;
  int? jobCardId;
  String? jobTitle;
  String? jobDes;
  String? jobDate;
  int? jobStatus;

  factory ListAssociatedJob.fromJson(Map<String, dynamic> json) => ListAssociatedJob(
        jobId: json["jobId"],
        jobCardId: json['jobCardId'],
        jobTitle: json["jobTitle"] ?? '',
        jobDes: json['jobDes'],
        jobDate: json['jobDate'],
        jobStatus: json['jobStatus'],
      );

  Map<String, dynamic> toJson() => {
        "jobId": jobId,
        "jobCardId": jobCardId,
        "jobTitle": jobTitle,
        "jobDes": jobDes,
        "jobDate": jobDate,
        "jobStatus": jobStatus,
      };
}



String addsafetyToJson(ListSafetyQuestion data) => json.encode(data.toJson());

String addEmploylistToJson(ListEmployees data) => json.encode(data.toJson());

String addListLotoToJson(LotoLists data) => json.encode(data.toJson());

String addFileListToJson(FileList data) => json.encode(data.toJson());

String addListIsolationToJson(ListIsolation data) => json.encode(data.toJson());

String addListCategoryToJson(ListCategory data) => json.encode(data.toJson());

