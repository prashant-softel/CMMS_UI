import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<VegTaskListModel> VegTaskListModelFromJson(String str) =>
    List<VegTaskListModel>.from(
        json.decode(str).map((x) => VegTaskListModel.fromJson(x)));

String VegTaskListModelToJson(List<VegTaskListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VegTaskListModel {
  int? id;
  int? planId;
  int? scheduled_Qnty;
  int? actual_Qnty;
  int? deviation;
  int? time_taken;
  dynamic remark;
  dynamic abondend;
  dynamic sitename;
  dynamic responsibility;
  dynamic frequency;
  int? noOfDays;
  dynamic scheduledDate;
  dynamic doneDate;
  dynamic lastDoneDate;
  int? status;
  dynamic abondond_done_date;
  dynamic status_short;
  int? water_used;
  dynamic title;

  VegTaskListModel({
    this.id,
    this.planId,
    this.responsibility,
    this.scheduled_Qnty,
    this.actual_Qnty,
    this.deviation,
    this.remark,
    this.time_taken,
    this.sitename,
    this.abondend,
    this.frequency,
    this.noOfDays,
    this.scheduledDate,
    this.doneDate,
    this.lastDoneDate,
    this.status,
    this.status_short,
    this.water_used,
    this.title,
    this.abondond_done_date,
  });

  factory VegTaskListModel.fromJson(Map<String, dynamic> json) =>
      VegTaskListModel(
        id: json['executionId'],
        planId: json['planId'],
        responsibility: json['responsibility'] ?? '',
        sitename: json['sitename'] ?? '',
        abondend: json['abondend'] ?? '',
        remark: json['remark'] ?? '',
        frequency: json['frequency'],
        noOfDays: json['noOfDays'],
        water_used: json['water_used'] ?? 0,
        scheduled_Qnty: json['scheduled_Qnty'] ?? 0,
        actual_Qnty: json['actual_Qnty'] ?? 0,
        deviation: json['deviation'] ?? 0,
        time_taken: json['time_taken'] ?? 0,
        scheduledDate: Utility.getFormatedyearMonthDay(json['scheduledDate']),
        doneDate: json['doneDate'] == "0001-01-01T05:30:00"
            ? ''
            : Utility.getFormatedyearMonthDay(json['doneDate']),
        lastDoneDate: json['lastDoneDate'] == "0001-01-01T05:30:00"
            ? ''
            : Utility.getFormatedyearMonthDay(json['lastDoneDate']),
        status: json['status'],
        status_short: json['status_short'],
        title: json['title'],
        abondond_done_date: json['abondond_done_date'] == "0001-01-01T05:30:00"
            ? ''
            : Utility.getFormatedyearMonthDay(json['abondond_done_date']),
      );

  Map<String, dynamic> toJson() => {
        "executionId": id,
        "planId": planId,
        "responsibility": responsibility,
        "deviation": deviation,
        "time_taken": time_taken,
        "actual_Qnty": actual_Qnty,
        "scheduled_Qnty": scheduled_Qnty,
        "sitename": sitename,
        "remark": remark,
        "abondend": abondend,
        "frequency": frequency,
        "noOfDays": noOfDays,
        "water_used": water_used,
        "scheduledDate": scheduledDate,
        "doneDate": doneDate,
        "lastDoneDate": lastDoneDate,
        "status": status,
        "status_short": status_short,
        "title": title,
        "abondond_done_date": abondond_done_date
      };
}
