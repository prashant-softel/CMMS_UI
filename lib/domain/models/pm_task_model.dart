import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<PmTaskListModel> pmTaskListModelFromJson(String str) =>
    List<PmTaskListModel>.from(
        json.decode(str).map((x) => PmTaskListModel.fromJson(x)));

String mTaskListModelToJson(List<PmTaskListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PmTaskListModel {
  int? id;
  int? facility_id;
  int? plan_id;
  String? task_code;
  String? name;
  String? last_done_date;
  String? due_date;
  String? done_date;
  String? start_date;
  int? frequency_id;
  String? frequency_name;
  int? category_id;
  String? category_name;
  String? permit_type;
  String? isolation_taken;
  int? isolation;
  String? site_name;
  int? assigned_to_id;
  String? assigned_to_name;
  int? permit_id;
  String? permit_code;
  int? status;
  int? ptwstat;
  dynamic status_short;
  int? ptw_tbt_done;
  String? ptw_shortstatus;
  PmTaskListModel(
      {this.assigned_to_id,
      this.assigned_to_name,
      this.category_id,
      this.plan_id,
      this.category_name,
      this.done_date,
      this.due_date,
      this.facility_id,
      this.frequency_id,
      this.frequency_name,
      this.permit_type,
      this.isolation_taken,
      this.start_date,
      this.site_name,
      this.isolation,
      this.id,
      this.last_done_date,
      this.permit_code,
      this.permit_id,
      this.name,
      this.status,
      this.ptwstat,
      this.status_short,
      this.ptw_tbt_done,
      this.ptw_shortstatus,
      this.task_code});

  factory PmTaskListModel.fromJson(Map<String, dynamic> json) =>
      PmTaskListModel(
        assigned_to_id: json['assigned_to_id'] ?? 0,
        isolation: json['isolation'] ?? 0,
        assigned_to_name: json['assigned_to_name'] ?? '',
        category_id: json['category_id'] ?? 0,
        plan_id: json['plan_id'] ?? 0,
        category_name: json['category_name'] ?? '',
        task_code:
            json['task_code'] != null && json['task_code'].startsWith('PMTASK')
                ? 'PMT${json['task_code'].substring(6)}'
                : json['task_code'] ?? '',
        done_date: json['done_date'] == null
            ? ''
            : Utility.getFormatedyearMonthDay(json['done_date']),
        due_date: json['due_date'] == null
            ? ''
            : Utility.getFormatedyearMonthDay(json['due_date']),
        facility_id: json['facility_id'] ?? 0,
        permit_code: json['permit_code'] ?? '',
        permit_id: json['permit_id'] ?? 0,
        status: json['status'] ?? 0,
        ptwstat: json['ptw_status'] ?? 0,
        status_short: json['status_short'] ?? '',
        frequency_id: json['frequency_id'] ?? 0,
        frequency_name: json['frequency_name'] ?? '',
        id: json['id'] ?? 0,
        last_done_date: json['last_done_date'] == null
            ? ''
            : Utility.getFormatedyearMonthDay(json['last_done_date']),
        name: json['plan_title'] ?? '',
        ptw_shortstatus: json['status_short_ptw'] ?? '',
        permit_type: json['permit_type'] ?? '',
        isolation_taken: json['isolation_taken'] ?? '',
        start_date: json['start_date'] ?? '',
        site_name: json['site_name'] ?? '',
        ptw_tbt_done: json['ptw_tbt_done'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isolation": isolation,
        "category_id": category_id,
        "plan_id": plan_id,
        "facility_id": facility_id,
        "category_name": category_name,
        "frequency_id": frequency_id,
        "task_code": task_code,
        "frequency_name": frequency_name,
        "assigned_to_name": assigned_to_name,
        "permit_code": permit_code,
        "ptw_status": ptwstat,
        "permit_id": permit_id,
        "status": status,
        "status_short_ptw": ptw_shortstatus,
        "ptw_tbt_done": ptw_tbt_done,
        "status_short": status_short,
        "last_done_date": last_done_date,
        "plan_title": name,
        "permit_type": permit_type,
        "isolation_taken": isolation_taken,
        "start_date": start_date,
        "site_name": site_name,
        "due_date": due_date,
        "done_date": done_date,
        "assigned_to_id": assigned_to_id,
      };
}
