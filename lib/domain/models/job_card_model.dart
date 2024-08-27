// To parse this JSON data, do
//
//     final jobCardDetailsModel = jobCardDetailsModelFromJson(jsonString);

import 'dart:convert';

List<JobCardModel> jobCardDetailsModelFromJson(String str) =>
    List<JobCardModel>.from(
        json.decode(str).map((x) => JobCardModel.fromJson(x)));

String jobCardDetailslModelToJson(List<JobCardModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobCardModel {
  JobCardModel({
    this.id,
    this.jobCardId,
    this.jobCardNo,
    this.jobId,
    this.permit_id,
    this.permit_no,
    this.statusShort,
    this.currentStatus,
    this.description,
    this.permit_type,
    this.isolation_taken,
    this.breakdownTime,
    this.site_name,
    this.job_assinged_to,
    this.job_card_date,
    this.jobs_closed,
    this.start_time,
    this.end_time,
    this.lstequipmentCatList,
  });

  int? id;
  int? jobCardId;
  dynamic jobCardNo;
  int? jobId;
  int? permit_id;
  String? permit_no;
  String? statusShort;
  int? currentStatus;
  String? description;
  String? permit_type;
  String? isolation_taken;
  String? breakdownTime;
  String? site_name;
  String? job_assinged_to;
  dynamic job_card_date;
  dynamic jobs_closed;
  dynamic start_time;
  dynamic end_time;
  List<EquipCategory>? lstequipmentCatList;

  factory JobCardModel.fromJson(Map<String, dynamic> json) => JobCardModel(
        jobCardId: json["jobCardId"],
        jobCardNo: json["jobCardNo"],
        jobId: json["jobid"],
        permit_id: json["permit_id"],
        statusShort: json["status_short"],
        permit_no: json["permit_no"],
        id: json["id"],
        job_assinged_to: json["job_assinged_to"],
        currentStatus: json["current_status"],
        job_card_date: json["job_card_date"] == '0001-01-01T00:00:00'
            ? ''
            : json["job_card_date"],
        jobs_closed: json["jobs_closed"] == '0001-01-01T00:00:00'
            ? ''
            : json['jobs_closed'],
        description: json["description"],
        permit_type: json["permit_type"],
        isolation_taken:
            json["isolation_taken"] == null ? '' : json["isolation_taken"],
        breakdownTime: json["breakdownTime"],
        site_name: json["site_name"],
        start_time: json["start_time"] == null ||
                json["start_time"] == '0001-01-01T00:00:00'
            ? ''
            : json["start_time"],
        end_time: json["end_time"] == '0001-01-01T00:00:00' ||
                json["end_time"] == null
            ? ''
            : json["end_time"],
        lstequipmentCatList: json['lstequipmentCatList'] != null
            ? List<EquipCategory>.from(json['lstequipmentCatList']
                .map((x) => EquipCategory.fromJson(x)))
            : [],
        // lstequipmentCatList: (json["lstequipmentCatList"] != null)
        //     ? List<LstequipmentCatList>.from(json["lstequipmentCatList"]
        //         .map((x) => LstequipmentCatList.fromJson(x)))
        //     : [],
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
        "status_short": statusShort,
        "job_assinged_to": job_assinged_to,
        "current_status": currentStatus,
        "jC_Closed_by_Name": job_card_date,
        "description": description,
        "breakdownTime": breakdownTime,
        "permit_type": permit_type,
        "isolation_taken": isolation_taken,
        "job_card_date": job_card_date,
        "jobs_closed": jobs_closed,
        "site_name": site_name,
        "permit_id": permit_id,
        "start_time": start_time,
        "end_time": end_time,
        "lstequipmentCatList": lstequipmentCatList != null
            ? List<dynamic>.from(lstequipmentCatList!.map((x) => x.toJson()))
            : [],
      };
}

class EquipCategory {
  EquipCategory({
    required this.equipmentCatId,
    required this.equipmentCatName,
  });

  int equipmentCatId;
  String equipmentCatName;

  factory EquipCategory.fromJson(Map<String, dynamic> json) => EquipCategory(
        equipmentCatId: json["equipmentCat_id"],
        equipmentCatName: json["equipmentCat_name"],
      );

  Map<String, dynamic> toJson() => {
        "equipmentCat_id": equipmentCatId,
        "equipmentCat_name": equipmentCatName,
      };
}
