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
    this.startDate,
    this.doneDate,
    this.status_short,
  });

  int? id;
  int? planId;
  String? responsibility;
  String? frequency;
  int? noOfDays;
  String? startDate;
  String? doneDate;
  String? status_short;

  factory MCTaskListModel.fromJson(Map<String, dynamic> json) =>
      MCTaskListModel(
        id: json["id"],
        planId: json["planId"],
        responsibility: json["responsibility"] ?? '',
        frequency: json["frequency"],
        noOfDays: json["noOfDays"],
        startDate: Utility.getFormatedyearMonthDay(json['startDate']),
        doneDate: Utility.getFormatedyearMonthDay(json['doneDate']),
        status_short: json["status_short"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "planId": planId,
        "responsibility": responsibility,
        "frequency": frequency,
        "noOfDays": noOfDays,
        "startDate": startDate,
        "doneDate": doneDate,
        "status_short": status_short,
      };
}
