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
  MCTaskListModel({
    this.id,
    this.planId,
    this.responsibility,
    this.frequency,
    this.noOfDays,
    this.water_used,
    this.startDate,
    this.doneDate,
    this.status,
    this.status_short,
    this.title,
  });

  int? id;
  int? planId;
  String? responsibility;
  String? frequency;
  int? noOfDays;
  int? water_used;
  String? startDate;
  String? doneDate;
  int? status;
  String? status_short;
  String? title;

  factory MCTaskListModel.fromJson(Map<String, dynamic> json) =>
      MCTaskListModel(
        id: json["id"],
        planId: json["planId"],
        responsibility: json["responsibility"] ?? '',
        frequency: json["frequency"],
        noOfDays: json["noOfDays"],
        water_used: json["water_used"],
        startDate: Utility.getFormatedyearMonthDay(json['startDate']),
        doneDate: Utility.getFormatedyearMonthDay(json['doneDate']),
        status: json['status'],
        status_short: json["status_short"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "planId": planId,
        "responsibility": responsibility,
        "frequency": frequency,
        "noOfDays": noOfDays,
        "water_used": water_used,
        "startDate": startDate,
        "doneDate": doneDate,
        "status": status,
        "status_short": status_short,
        "title": title
      };
}
