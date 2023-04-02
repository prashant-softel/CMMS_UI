// To parse this JSON data, do
//
//     final permitDetailsModel = permitDetailsModelFromJson(jsonString);

import 'dart:convert';

PermitDetailsModel permitDetailsModelFromJson(String str) =>
    PermitDetailsModel.fromJson(json.decode(str));

String permitDetailsModelToJson(PermitDetailsModel data) =>
    json.encode(data.toJson());

class PermitDetailsModel {
  PermitDetailsModel({
    this.insertedId,
    this.ptwStatus,
    this.permitNo,
    this.sitePermitNo,
    this.permitTypeid,
    this.permitTypeName,
    this.title,
    this.description,
    this.siteName,
    this.blockName,
    this.startDate,
    this.tillDate,
    this.permitArea,
    this.workingTime,
    this.issuedByName,
    this.issueAt,
    this.approvedByName,
    this.approveAt,
    this.completedByName,
    this.closeAt,
    this.closedByName,
    this.cancelRequestByName,
    this.cancelAt,
    this.safetyQuestionList,
    this.fileList,
    this.lstLoto,
    this.lstEmp,
    this.lstIsolation,
    this.lstCategory,
    this.lstAssociatedJob,
  });

  int? insertedId;
  int? ptwStatus;
  int? permitNo;
  int? sitePermitNo;
  int? permitTypeid;
  String? permitTypeName;
  String? title;
  String? description;
  String? siteName;
  String? blockName;
  DateTime? startDate;
  DateTime? tillDate;
  dynamic permitArea;
  int? workingTime;
  String? issuedByName;
  DateTime? issueAt;
  String? approvedByName;
  DateTime? approveAt;
  String? completedByName;
  DateTime? closeAt;
  String? closedByName;
  String? cancelRequestByName;
  DateTime? cancelAt;
  List<dynamic>? safetyQuestionList;
  List<dynamic>? fileList;
  List<LotoAsset>? lstLoto;
  List<LstEmp>? lstEmp;
  List<IsolationAssetsCategory>? lstIsolation;
  List<dynamic>? lstCategory;
  List<dynamic>? lstAssociatedJob;

  factory PermitDetailsModel.fromJson(Map<String, dynamic> json) =>
      PermitDetailsModel(
        insertedId: json["insertedId"],
        ptwStatus: json["ptwStatus"],
        permitNo: json["permitNo"],
        sitePermitNo: json["sitePermitNo"],
        permitTypeid: json["permitTypeid"],
        permitTypeName: json["permitTypeName"],
        title: json["title"],
        description: json["description"],
        siteName: json["siteName"],
        blockName: json["blockName"],
        startDate: DateTime.parse(json["startDate"]),
        tillDate: DateTime.parse(json["tillDate"]),
        permitArea: json["permitArea"],
        workingTime: json["workingTime"],
        issuedByName: json["issuedByName"],
        issueAt: DateTime.parse(json["issue_at"]),
        approvedByName: json["approvedByName"],
        approveAt: DateTime.parse(json["approve_at"]),
        completedByName: json["completedByName"],
        closeAt: DateTime.parse(json["close_at"]),
        closedByName: json["closedByName"],
        cancelRequestByName: json["cancelRequestByName"],
        cancelAt: DateTime.parse(json["cancel_at"]),
        safetyQuestionList:
            List<dynamic>.from(json["safety_question_list"].map((x) => x)),
        fileList: List<dynamic>.from(json["file_list"].map((x) => x)),
        lstLoto: List<LotoAsset>.from(json["lstLoto"].map((x) => x)),
        lstEmp:
            List<LstEmp>.from(json["lstEmp"].map((x) => LstEmp.fromJson(x))),
        lstIsolation: List<IsolationAssetsCategory>.from(json["lstIsolation"]
            .map((x) => IsolationAssetsCategory.fromJson(x))),
        lstCategory: List<dynamic>.from(json["lstCategory"].map((x) => x)),
        lstAssociatedJob:
            List<dynamic>.from(json["lstAssociatedJob"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "insertedId": insertedId,
        "ptwStatus": ptwStatus,
        "permitNo": permitNo,
        "sitePermitNo": sitePermitNo,
        "permitTypeid": permitTypeid,
        "permitTypeName": permitTypeName,
        "title": title,
        "description": description,
        "siteName": siteName,
        "blockName": blockName,
        "startDate": startDate?.toIso8601String(),
        "tillDate": tillDate?.toIso8601String(),
        "permitArea": permitArea,
        "workingTime": workingTime,
        "issuedByName": issuedByName,
        "issue_at": issueAt?.toIso8601String(),
        "approvedByName": approvedByName,
        "approve_at": approveAt?.toIso8601String(),
        "completedByName": completedByName,
        "close_at": closeAt?.toIso8601String(),
        "closedByName": closedByName,
        "cancelRequestByName": cancelRequestByName,
        "cancel_at": cancelAt?.toIso8601String(),
        "safety_question_list":
            List<dynamic>.from(safetyQuestionList?.map((x) => x) ?? []),
        "file_list": List<dynamic>.from(fileList?.map((x) => x) ?? []),
        "lstLoto": List<dynamic>.from(lstLoto?.map((x) => x) ?? []),
        "lstEmp": List<dynamic>.from(lstEmp?.map((x) => x.toJson()) ?? []),
        "lstIsolation":
            List<dynamic>.from(lstIsolation?.map((x) => x.toJson()) ?? []),
        "lstCategory": List<dynamic>.from(lstCategory?.map((x) => x) ?? []),
        "lstAssociatedJob":
            List<dynamic>.from(lstAssociatedJob?.map((x) => x) ?? []),
      };
}

class LstEmp {
  LstEmp({
    this.empName,
    required this.resp,
  });

  String? empName;
  String resp;

  factory LstEmp.fromJson(Map<String, dynamic> json) => LstEmp(
        empName: json["empName"],
        resp: json["resp"],
      );

  Map<String, dynamic> toJson() => {
        "empName": empName,
        "resp": resp,
      };
}

class IsolationAssetsCategory {
  IsolationAssetsCategory({
    this.isolationAssetsCatId,
    this.isolationAssetsCatName,
    this.isNormalized,
  });

  int? isolationAssetsCatId;
  String? isolationAssetsCatName;
  int? isNormalized;

  factory IsolationAssetsCategory.fromJson(Map<String, dynamic> json) =>
      IsolationAssetsCategory(
        isolationAssetsCatId: json["isolationAssetsCatID"],
        isolationAssetsCatName: json["isolationAssetsCatName"],
        //isNormalized: json["isNormalized"],
      );

  Map<String, dynamic> toJson() => {
        "isolationAssetsCatID": isolationAssetsCatId,
        "isolationAssetsCatName": isolationAssetsCatName,
        //"isNormalized": isNormalized,
      };
}

class LotoAsset {
  LotoAsset({
    this.lotoId,
    this.removedStatus,
  });

  int? lotoId;
  int? removedStatus;

  factory LotoAsset.fromJson(Map<String, dynamic> json) => LotoAsset(
        lotoId: json["loto_id"],
        removedStatus: json["lotoRemovedStatus"],
      );

  Map<String, dynamic> toJson() => {
        "loto_id": lotoId,
        "lotoRemovedStatus": removedStatus,
      };
}
