import 'dart:convert';

import 'package:cmms/app/app.dart';

List<PmPlanListModel> pmPlanModelFromJson(String str) =>
    List<PmPlanListModel>.from(
        json.decode(str).map((x) => PmPlanListModel.fromJson(x)));

String pmPlanModelToJson(List<PmPlanListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PmPlanListModel {
  int? plan_id;
  String? plan_name;
  int? status_id;
  String? status_name;
  String? plan_date;
  int? facility_id;
  String? facility_name;
  int? category_id;
  String? category_name;
  int? plan_freq_id;
  String? plan_freq_name;
  int? created_by_id;
  String? created_by_name;
  String? created_at;
  int? updated_by_id;
  String? updated_by_name;
  String? updated_at;
  int? assign_to_id;
  String? assign_to_name;
  int? approved_by_id;
  String? approved_by_name;
  String? approved_at;
  int? rejected_by_id;
  String? rejected_by_name;
  String? rejected_at;
  String? next_schedule_date;
  PmPlanListModel(
      {this.category_id,
      this.category_name,
      this.created_at,
      this.created_by_id,
      this.created_by_name,
      this.facility_id,
      this.facility_name,
      this.plan_date,
      this.plan_freq_id,
      this.plan_freq_name,
      this.plan_id,
      this.plan_name,
      this.status_id,
      this.status_name,
      this.updated_at,
      this.updated_by_id,
      this.updated_by_name,
      this.approved_at,
      this.approved_by_id,
      this.approved_by_name,
      this.assign_to_id,
      this.assign_to_name,
      this.rejected_at,
      this.rejected_by_id,
      this.rejected_by_name,
      this.next_schedule_date});

  factory PmPlanListModel.fromJson(Map<String, dynamic> parsedJson) {
    return PmPlanListModel(
        category_id: parsedJson['category_id'],
        category_name: parsedJson['category_name'],
        created_at: parsedJson['created_at'],
        created_by_id: parsedJson['created_by_id'],
        created_by_name: parsedJson['created_by_name'],
        facility_id: parsedJson['facility_id'],
        facility_name: parsedJson['facility_name'],
        plan_date: parsedJson['plan_date'] == null
            ? parsedJson['plan_date']
            : Utility.getFormatedyearMonthDay(parsedJson['plan_date']),
        plan_freq_id: parsedJson['plan_freq_id'],
        plan_freq_name: parsedJson['plan_freq_name'],
        plan_id: parsedJson['plan_id'],
        plan_name: parsedJson['title'],
        status_id: parsedJson['status_id'],
        status_name: parsedJson['status_short'],
        updated_at: parsedJson['updated_at'],
        updated_by_id: parsedJson['updated_by_id'],
        updated_by_name: parsedJson['updated_by_name'],
        approved_at: parsedJson['approved_at'],
        approved_by_id: parsedJson['approved_by_id'],
        approved_by_name: parsedJson['approved_by_name'],
        assign_to_id: parsedJson['assign_to_id'],
        assign_to_name: parsedJson['assigned_to_name'],
        rejected_at: parsedJson['rejected_at'],
        rejected_by_id: parsedJson['rejected_by_id'],
        rejected_by_name: parsedJson['rejected_by_name'],
        next_schedule_date: parsedJson['next_schedule_date'] == null
            ? parsedJson['next_schedule_date']
            : Utility.getFormatedyearMonthDay(
                parsedJson['next_schedule_date']));
  }
  Map<String, dynamic> toJson() => {
        "category_id": category_id,
        "approved_at": approved_at,
        "approved_by_id": approved_by_id,
        "approved_by_name": approved_by_name,
        "assign_to_id": assign_to_id,
        "assigned_to_name": assign_to_name,
        "rejected_by_name": rejected_by_name,
        "rejected_at": rejected_at,
        "rejected_by_id": rejected_by_id,
        "category_name": category_name,
        "created_at": created_at,
        "created_by_id": created_by_id,
        "created_by_name": created_by_name,
        "facility_id": facility_id,
        "facility_name": facility_name,
        "plan_date": plan_date,
        "plan_freq_id": plan_freq_id,
        "plan_freq_name": plan_freq_name,
        "plan_id": plan_id,
        "title": plan_name,
        "status_id": status_id,
        "status_short": status_name,
        "updated_at": updated_at,
        "updated_by_id": updated_by_id,
        "updated_by_name": updated_by_name,
        "next_schedule_date": next_schedule_date
      };
}
