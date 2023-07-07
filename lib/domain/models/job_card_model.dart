// To parse this JSON data, do
//
//     final jobCardDetailsModel = jobCardDetailsModelFromJson(jsonString);

import 'dart:convert';

List<JobCardModel> jobCardDetailsModelFromJson(String str) =>
    List<JobCardModel>.from(
        json.decode(str).map((x) => JobCardModel.fromJson(x)));

String jobCardDetailsModelToJson(List<JobCardModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobCardModel {
  JobCardModel({
    this.id,
    this.jobCardId,
    this.jobCardNo,
    this.jobId,
    this.permit_id,
    this.permit_no,
    this.currentStatus,
    this.description,
    this.job_assinged_to,
    this.job_card_date,
    this.start_time,
    this.end_time,
    this.lstequipmentCatList,
  });

  int? id;
  int? jobCardId;
  int? jobCardNo;
  int? jobId;
  int? permit_id;
  String? permit_no;
  int? currentStatus;
  String? description;
  String? job_assinged_to;
  DateTime? job_card_date;
  DateTime? start_time;
  DateTime? end_time;
  List<LstequipmentCatList>? lstequipmentCatList;

  factory JobCardModel.fromJson(Map<String, dynamic> json) =>
      JobCardModel(
        jobCardId: json["jobCardId"],
        jobCardNo: json["jobCardNo"],
        jobId: json["jobid"],
        permit_id: json["permit_id"], 
        permit_no: json["permit_no"],
        id: json["id"],
        job_assinged_to: json["currentEmpID"],
        currentStatus: json["current_status"],
        job_card_date: json["job_card_date"],
        description: json["description"],
        start_time: json["start_time"],
        end_time: json["end_time"],
        lstequipmentCatList: (json["lstequipmentCatList"] != null)
            ? List<LstequipmentCatList>.from(json["lstequipmentCatList"]
            .map((x) => LstequipmentCatList.fromJson(x)))
            : [],
        // lstequipmentCatList: List<LstequipmentCatList>.from(
        //     json["lstCMJCIsolatedDetailList"]
        //         .map((x) => LstequipmentCatList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "jobCardId": jobCardId,
        "jobCardNo": jobCardNo,
        "jobid": jobId,
        "jC_Approved_By_Name": permit_id,
        "permit_no": permit_no,
        "id": id,
        "currentEmpID": job_assinged_to,
        "current_status": currentStatus,
        "jC_Closed_by_Name": job_card_date,
        "description": description,
        "permit_id": permit_id,
        "start_time": start_time,
        "end_time": end_time,

        "lstequipmentCatList": List<dynamic>.from(
            lstequipmentCatList?.map((x) => x.toJson()) ?? []),
      };
}

class LstequipmentCatList {
  LstequipmentCatList({
    required this.equipmentCatId,
    required this.equipmentCatName,
  });

  int equipmentCatId;
  String equipmentCatName;

  factory LstequipmentCatList.fromJson(Map<String, dynamic> json) =>
      LstequipmentCatList(
        equipmentCatId: json["equipmentCat_id"],
        equipmentCatName: json["equipmentCat_name"],
      );

  Map<String, dynamic> toJson() => {
    "equipmentCat_id": equipmentCatId,
    "equipmentCat_name": equipmentCatName,
  };
}
