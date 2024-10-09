import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<PreventiveCheckListModel> preventiveCheckListModelFromJson(String str) =>
    List<PreventiveCheckListModel>.from(
        json.decode(str).map((x) => PreventiveCheckListModel.fromJson(x)));

String preventiveCheckListModelToJson(List<PreventiveCheckListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PreventiveCheckListModel {
  int? id;
  String? name;
  int? type;
  int? facility_id;
  String? facility_name;
  int? category_id;
  String? category_name;
  int? frequency_id;
  String? frequency_name;
  int? manPower;
  int? duration;
  int? status;
  int? createdById;
  String? createdByName;
  String? createdAt;
  String? updatedAt;
  int? updatedById;
  int? map_checlist;
  int? evalution_plan_id;
  dynamic weightage;
  String? comments;
  int? ptw_required;
  String? title;
  int? subtask_id;
  int? assign_to;
  String? assign_name;
  String? schedule_date;

  PreventiveCheckListModel(
      {this.id,
      this.category_id,
      this.category_name,
      this.name,
      this.createdAt,
      this.createdById,
      this.createdByName,
      this.duration,
      this.facility_id,
      this.facility_name,
      this.frequency_id,
      this.frequency_name,
      this.manPower,
      this.status,
      this.type,
      this.updatedAt,
      this.updatedById,
      this.comments,
      this.evalution_plan_id,
      this.map_checlist,
      this.ptw_required,
      this.weightage,
      this.title,
      this.assign_name,
      this.assign_to,
      this.schedule_date,
      this.subtask_id});

  factory PreventiveCheckListModel.fromJson(Map<String, dynamic> json) =>
      PreventiveCheckListModel(
        id: json['id'],
        assign_name: json['assign_name'],
        assign_to: json['assign_to'],
        schedule_date: json['schedule_date'] == null
            ? json['schedule_date']
            : Utility.getFormatedyearMonthDay(json['schedule_date']),
        subtask_id: json['subtask_id'],
        title: json['title'],
        comments: json['comments'],
        evalution_plan_id: json['evalution_plan_id'],
        map_checlist: json['map_checlist'],
        ptw_required: json['ptw_required'],
        weightage: json['weightage'],
        category_id: json['category_id'],
        category_name: json['category_name'],
        type: json['type'],
        facility_id: json['facility_id'],
        frequency_id: json['frequency_id'],
        facility_name: json['facility_name'],
        frequency_name: json['frequency_name'],
        manPower: json['manPower'],
        duration: json['duration'],
        status: json['status'],
        name: json['checklist_number'],
        createdAt: json['createdAt'],
        createdById: json['createdById'],
        createdByName: json['createdByName'],
        updatedAt: json['updatedAt'],
        updatedById: json['updatedById'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subtask_id": subtask_id,
        "assign_name": assign_name,
        "schedule_date": schedule_date,
        "assign_to": assign_to,
        "title": title,
        "category_id": category_id,
        "category_name": category_name,
        "updatedAt": updatedAt,
        "updatedById": updatedById,
        "type": type,
        "frequency_id": frequency_id,
        "checklist_number": name,
        "frequency_name": frequency_name,
        "createdByName": createdByName,
        "createdById": createdById,
        "facility_id": facility_id,
        "facility_name": facility_name,
        "status": status,
        "manPower": manPower,
        "duration": duration,
        "createdAt": createdAt,
      };
}
