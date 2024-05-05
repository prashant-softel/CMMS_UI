import 'dart:convert';

import '../../app/utils/utility.dart';

AuditTaskViewModel auditTaskViewModelFromJson(String str) =>
    AuditTaskViewModel.fromJson(json.decode(str));

String auditTaskViewModelToJson(AuditTaskViewModel data) =>
    json.encode(data.toJson());

class AuditTaskViewModel {
  int? isDraft;
  int? type_id;
  int? plan_id;
  String? plan_name;
  int? status_id;
  String? status_short;
  String? status_long;
  String? plan_date;
  int? facility_id;
  String? facility_name;
  int? category_id;
  String? category_name;
  int? assigned_to_id;
  String? assigned_to_name;
  int? plan_freq_id;
  String? plan_freq_name;
  int? created_by_id;
  String? created_by_name;
  String? created_at;
  int? approved_by_id;
  String? approved_by_name;
  String? approved_at;
  int? rejected_by_id;
  String? rejected_by_name;
  String? rejected_at;
  int? updated_by_id;
  String? updated_by_name;
  String? updated_at;
  List<ScheduleAuditCheckPoint>? schedulesChecklist;

  AuditTaskViewModel(
      {this.assigned_to_name,
      this.category_id,
      this.category_name,
      this.facility_id,
      this.assigned_to_id,
      this.status_short,
      this.schedulesChecklist,
      this.approved_at,
      this.approved_by_id,
      this.approved_by_name,
      this.created_at,
      this.created_by_id,
      this.created_by_name,
      this.facility_name,
      this.isDraft,
      this.plan_date,
      this.plan_freq_id,
      this.plan_freq_name,
      this.plan_id,
      this.plan_name,
      this.rejected_at,
      this.rejected_by_id,
      this.rejected_by_name,
      this.status_id,
      this.status_long,
      this.type_id,
      this.updated_at,
      this.updated_by_id,
      this.updated_by_name});

  factory AuditTaskViewModel.fromJson(Map<String, dynamic> json) =>
      AuditTaskViewModel(
        updated_by_name: json["updated_by_name"] ?? "",
        updated_by_id: json["updated_by_id"] ?? 0,
        updated_at: json["updated_at"],
        assigned_to_name: json["assigned_to_name"] ?? "",
        category_id: json["category_id"] ?? "",
        category_name: json["category_name"] ?? "",
        type_id: json["type_id"],
        status_long: json["status_long"] ?? "",
        status_id: json["status_id"] ?? "",
        rejected_by_name: json["rejected_by_name"] ?? "",
        rejected_by_id: json["rejected_by_id"] ?? "",
        rejected_at: json["rejected_at"] ?? "",
        facility_id: json["facility_id"] ?? "",
        assigned_to_id: json["assigned_to_id"] ?? "",
        plan_date: json['plan_date'] == null
            ? json['plan_date']
            : Utility.getFormatedyearMonthDay(json['plan_date']),
        plan_name: json["plan_name"] ?? "",
        status_short: json["status_short"] ?? "",
        plan_id: json["plan_id"] ?? "",
        plan_freq_name: json["plan_freq_name"] ?? "",
        plan_freq_id: json["plan_freq_id"] ?? "",
        isDraft: json["isDraft"] ?? "",
        facility_name: json["facility_name"] ?? "",
        approved_by_name: json["approved_by_name"] ?? "",
        created_by_name: json["created_by_name"] ?? "",
        created_by_id: json["created_by_id"] ?? "",
        created_at: json['created_at'] == null
            ? json['created_at']
            : Utility.getFormatedyearMonthDay(json['created_at']),
        approved_by_id: json["approved_by_id"] ?? "",
        approved_at: json['approved_at'] == null
            ? json['approved_at']
            : Utility.getFormatedyearMonthDay(json['approved_at']),
        schedulesChecklist: List<ScheduleAuditCheckPoint>.from(
            json["mapAssetChecklist"]
                .map((x) => ScheduleAuditCheckPoint.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "approved_at": approved_at,
        "approved_by_id": approved_by_id,
        "created_at": created_at,
        "assigned_to_name": assigned_to_name,
        "category_id": category_id,
        "category_name": category_name,
        "assigned_to_id": assigned_to_id,
        "created_by_id": created_by_id,
        "created_by_name": created_by_name,
        "approved_by_name": approved_by_name,
        "facility_name": facility_name,
        "isDraft": isDraft,
        "facility_id": facility_id,
        "plan_freq_id": plan_freq_id,
        "plan_freq_name": plan_freq_name,
        "plan_id": plan_id,
        "plan_name": plan_name,
        "status_short": status_short,
        "plan_date": plan_date,
        "rejected_at": rejected_at,
        "rejected_by_id": rejected_by_id,
        "rejected_by_name": rejected_by_name,
        "status_id": status_id,
        "status_long": status_long,
        "type_id": type_id,
        "updated_at": updated_at,
        "updated_by_id": updated_by_id,
        "updated_by_name": updated_by_name,
        "mapAssetChecklist": List<dynamic>.from(
            schedulesChecklist?.map((x) => x.toJson()) ?? []),
      };
}

class ScheduleAuditCheckPoint {
  int? asset_id;
  String? asset_name;
  int? parent_id;
  String? parent_name;
  int? module_qty;
  int? checklist_id;
  String? checklist_name;

  // List<ChecklistObservation>? checklist_observation;
  // List<ScheduleLinkJob>? schedule_link_job;

  ScheduleAuditCheckPoint({
    this.asset_id,
    this.checklist_name,
    this.asset_name,
    this.checklist_id,
    this.module_qty,
    this.parent_id,
    this.parent_name,
  });

  factory ScheduleAuditCheckPoint.fromJson(Map<String, dynamic> json) =>
      ScheduleAuditCheckPoint(
        asset_id: json["asset_id"] ?? 0,
        checklist_name: json["checklist_name"] ?? '',
        asset_name: json["asset_name"] ?? "",
        module_qty: json["module_qty"] ?? 0,
        checklist_id: json["checklist_id"] ?? 0,
        parent_id: json["parent_id"] ?? 0,
        parent_name: json["parent_name"],
      );

  Map<String, dynamic> toJson() => {
        "asset_id": asset_id,
        "checklist_name": checklist_name,
        "asset_name": asset_name,
        "module_qty": module_qty,
        "checklist_id": checklist_id,
        "parent_id": parent_id,
        "parent_name": parent_name,
      };
}
