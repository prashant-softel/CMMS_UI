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
  String? responsibility;
  String? frequency;
  int? noOfDays;
  String? startDate;
  String? doneDate;
  String? lastDoneDate;
  int? status;
  String? abondond_done_date;
  String? status_short;
  int? water_used;
  String? title;

  VegTaskListModel({
    this.id,
    this.planId,
    this.responsibility,
    this.frequency,
    this.noOfDays,
    this.startDate,
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
        frequency: json['frequency'],
        noOfDays: json['noOfDays'],
        water_used: json['water_used'],
        startDate: Utility.getFormatedyearMonthDay(json['startDate']),
        doneDate: Utility.getFormatedyearMonthDay(json['doneDate']),
        lastDoneDate: Utility.getFormatedyearMonthDay(json['lastDoneDate']),
        status: json['status'],
        status_short: json['status_short'],
        title: json['title'],
        abondond_done_date:
            Utility.getFormatedyearMonthDay(json['abondond_done_date']),
      );

  Map<String, dynamic> toJson() => {
        "executionId": id,
        "planId": planId,
        "responsibility": responsibility,
        "frequency": frequency,
        "noOfDays": noOfDays,
        "water_used": water_used,
        "startDate": startDate,
        "doneDate": doneDate,
        "lastDoneDate": lastDoneDate,
        "status": status,
        "status_short": status_short,
        "title": title,
        "abondond_done_date": abondond_done_date
      };
}
