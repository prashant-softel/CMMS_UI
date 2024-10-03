// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<MCTaskListModel> mcTaskListModelFromJson(String str) =>
    List<MCTaskListModel>.from(
        json.decode(str).map((x) => MCTaskListModel.fromJson(x)));

String mcTaskListModelToJson(List<MCTaskListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MCTaskListModel {
  MCTaskListModel(
      {this.executionId,
      this.scheduled_Qnty,
      this.actual_Qnty,
      this.abondend,
      this.sitename,
      this.time_taken,
      this.remark,
      this.cleaningType,
      this.deviation,
      this.planId,
      this.responsibility,
      this.frequency,
      this.noOfDays,
      this.water_used,
      this.scheduledDate,
      this.doneDate,
      this.status,
      this.status_short,
      this.title,
      this.waterused,
      this.abondond_done_date,
      this.cleaningTypeName});

  int? executionId;
  int? scheduled_Qnty;
  int? actual_Qnty;
  int? planId;
  dynamic abondend;
  dynamic sitename;
  dynamic remark;
  dynamic cleaningType;
  int? waterused;
  int? deviation;
  int? time_taken;
  dynamic responsibility;
  dynamic frequency;
  int? noOfDays;
  int? water_used;
  dynamic scheduledDate;
  dynamic doneDate;
  int? status;
  dynamic status_short;
  dynamic title;
  dynamic abondond_done_date;
  dynamic cleaningTypeName;

  factory MCTaskListModel.fromJson(Map<String, dynamic> json) =>
      MCTaskListModel(
        executionId: json["executionId"],
        cleaningTypeName: json['cleaningTypeName'],
        planId: json["planId"],
        responsibility: json["responsibility"] ?? '',
        sitename: json["sitename"] ?? '',
        frequency: json["frequency"],
        noOfDays: json["noOfDays"],
        water_used: json["water_used"],
        scheduledDate: Utility.getFormatedyearMonthDay(json['scheduledDate']),
        doneDate: Utility.getFormatedyearMonthDay(json['doneDate']),
        status: json['status'],
        status_short: json["status_short"],
        title: json["title"],
        cleaningType: json["cleaningType"] ?? '',
        waterused: json["waterused"] ?? 0,
        scheduled_Qnty: json["scheduled_Qnty"] ?? 0,
        actual_Qnty: json["actual_Qnty"] ?? 0,
        abondend: json["abondend"] ?? '',
        remark: json["remark"] ?? '',
        deviation: json["deviation"] ?? 0,
        time_taken: json["time_taken"] ?? 0,
        abondond_done_date:
            Utility.getFormatedyearMonthDay(json['abondond_done_date']),
      );

  Map<String, dynamic> toJson() => {
        "executionId": executionId,
        "cleaningTypeName": cleaningTypeName,
        "sitename": sitename,
        "planId": planId,
        "responsibility": responsibility,
        "cleaningType": cleaningType,
        "waterused": waterused,
        "scheduled_Qnty": scheduled_Qnty,
        "actual_Qnty": actual_Qnty,
        "abondend": abondend,
        "remark": remark,
        "deviation": deviation,
        "time_taken": time_taken,
        "frequency": frequency,
        "noOfDays": noOfDays,
        "water_used": water_used,
        "scheduledDate": scheduledDate,
        "doneDate": doneDate,
        "status": status,
        "status_short": status_short,
        "title": title,
        "abondond_done_date": abondond_done_date
      };
}
