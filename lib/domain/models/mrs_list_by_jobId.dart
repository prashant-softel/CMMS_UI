// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

List<MRSListByJobIdModel> linkedJobsToPermitModelFromJson(String str) => List<MRSListByJobIdModel>.from(
    json.decode(str).map((x) => MRSListByJobIdModel.fromJson(x)));

String linkedJobsToPermitModelToJson(List<MRSListByJobIdModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MRSListByJobIdModel {
  MRSListByJobIdModel({
    this.mrsId,
    this.jobId,
    this.jobCardId,
    this.pmId,
    this.mrsItems,
    this.status,
    this.status_short,
  });

  int? mrsId;
  int? jobId;
  int? jobCardId;
  int? pmId;
  String? mrsItems;
  int? status;
  String? status_short;

  factory MRSListByJobIdModel.fromJson(Map<String, dynamic> json) => MRSListByJobIdModel(
        mrsId: json['mrsId'] == null ? 0 : json['mrsId'],
        jobId: json["jobId"] == null ? 0 : json["jobId"],
        jobCardId: json["jobCardId"] == null ? 0 : json["jobCardId"],
        pmId:json["pmId"] == null ? 0 : json["pmId"],
        mrsItems: json["mrsItems"] == null ? '' : json["mrsItems"],
        status: json["status"] == null ? 0 : json["status"],
        status_short: json['status_short'] == null ? '' : json['status_short'],
        

      );

  Map<String, dynamic> toJson() => {
        "mrsId": mrsId,
        "jobId": jobId,
        "jobCardId": jobCardId,
        "pmId": pmId,
        "mrsItems": mrsItems,
        "status": status,
        "status_short": status_short,
      };
}


