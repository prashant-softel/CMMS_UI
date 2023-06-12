import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/utils/utility.dart';

PmtaskViewModel pmtaskViewModelFromJson(String str) =>
    PmtaskViewModel.fromJson(json.decode(str));

String pmtaskViewModelToJson(PmtaskViewModel data) =>
    json.encode(data.toJson());

class PmtaskViewModel {
  int? id;
  String? facility_name;
  String? maintenance_order_number;
  String? schedule_date;
  String? completed_date;
  int? equipment_id;
  String? equipment_name;
  int? category_id;
  String? category_name;
  int? frequency_id;
  String? frequency_name;
  String? assigned_to_name;
  int? permit_id;
  String? permit_code;
  int? status;
  String? status_name;
  String? schedule_link_job;
  int? is_custom_check_point;
  int? is_file_required;
  int? checklist_id;
  String? checklist_name;
  List<ScheduleCheckPoint>? schedule_check_points;
  List<HistoryLog>? history_log;
  List<Files>? files;

  PmtaskViewModel(
      {this.assigned_to_name,
      this.category_id,
      this.category_name,
      this.completed_date,
      this.equipment_id,
      this.equipment_name,
      this.facility_name,
      this.frequency_id,
      this.frequency_name,
      this.history_log,
      this.id,
      this.maintenance_order_number,
      this.permit_code,
      this.permit_id,
      this.schedule_check_points,
      this.schedule_date,
      this.schedule_link_job,
      this.status,
      this.status_name,
      this.checklist_id,
      this.checklist_name,
      // this.files,
      this.is_custom_check_point,
      this.is_file_required});

  factory PmtaskViewModel.fromJson(Map<String, dynamic> json) =>
      PmtaskViewModel(
        assigned_to_name: json["assigned_to_name"] ?? "",
        category_id: json["category_id"] ?? "",
        category_name: json["category_name"] ?? "",
        completed_date: json["completed_date"] != null
            ? Utility.getFormatedyearMonthDay(json["completed_date"])
            : "--",
        equipment_id: json["equipment_id"] ?? "",
        equipment_name: json["equipment_name"] ?? "",
        facility_name: json["facility_name"] ?? "",
        frequency_id: json["frequency_id"] ?? "",
        frequency_name: json["frequency_name"] ?? "",
        id: json["id"] ?? "",
        maintenance_order_number: json["maintenance_order_number"] ?? "",
        permit_code: json["permit_code"] ?? "",
        permit_id: json["permit_id"] ?? "",
        schedule_date: Utility.getFormatedyearMonthDay(json["schedule_date"]),
        schedule_link_job: json["schedule_link_job"] ?? "",
        status: json["status"] ?? "",
        status_name: json["status_name"] ?? "",
        is_custom_check_point: json["is_custom_check_point"],
        is_file_required: json["is_file_required"],
        checklist_id: json["checklist_id"],
        checklist_name: json["checklist_name"],

        schedule_check_points: List<ScheduleCheckPoint>.from(
            json["schedule_check_points"]
                .map((x) => ScheduleCheckPoint.fromJson(x))),
        history_log: List<HistoryLog>.from(
            json["history_log"].map((x) => HistoryLog.fromJson(x))),
        //  files: List<Files>.from(json["files"].map((x) => Files.fromJson(x)))
      );

  Map<String, dynamic> toJson() => {
        "assigned_to_name": assigned_to_name,
        "category_id": category_id,
        "category_name": category_name,
        "completed_date": completed_date,
        "equipment_id": equipment_id,
        "equipment_name": equipment_name,
        "facility_name": facility_name,
        "frequency_id": frequency_id,
        "frequency_name": frequency_name,
        "id": id,
        "maintenance_order_number": maintenance_order_number,
        "permit_code": permit_code,
        "permit_id": permit_id,
        "schedule_date": schedule_date,
        "schedule_link_job": schedule_link_job,
        "status": status,
        "status_name": status_name,
        "is_custom_check_point": is_custom_check_point,
        "is_file_required": is_file_required,
        "checklist_id": checklist_id,
        "checklist_name": checklist_name,
        "history_log":
            List<dynamic>.from(history_log?.map((x) => x.toJson()) ?? []),
        "schedule_check_points":
            List<dynamic>.from(schedule_check_points?.map((x) => x) ?? []),
      };
}

class ScheduleCheckPoint {
  int? execution_id;
  int? check_point_id;
  String? check_point_name;
  String? requirement;
  RxInt linked_job_id = RxInt(0);
  String? observation;
  int? is_custom_check_point;
  int? is_file_required;
  TextEditingController? observation_value_controller;

  ScheduleCheckPoint(
      {this.check_point_id,
      this.execution_id,
      this.check_point_name,
      this.is_custom_check_point,
      this.is_file_required,
      required int linked_job_id,
      this.observation,
      this.observation_value_controller,
      this.requirement}) {
    this.linked_job_id.value = linked_job_id;
  }

  factory ScheduleCheckPoint.fromJson(Map<String, dynamic> json) =>
      ScheduleCheckPoint(
          check_point_id: json["check_point_id"] ?? 0,
          check_point_name: json["check_point_name"] ?? '',
          is_file_required: json["is_file_required"] ?? 0,
          is_custom_check_point: json["is_custom_check_point"] ?? 0,
          linked_job_id: json["linked_job_id"] ?? 0,
          observation: json["observation"] ?? "",
          requirement: json["requirement"] ?? "",
          execution_id: json["execution_id"] ?? "",
          observation_value_controller: TextEditingController(
            text: json['observation'],
          ));

  Map<String, dynamic> toJson() => {
        "check_point_id": check_point_id,
        "check_point_name": check_point_name,
        "is_file_required": is_file_required,
        "is_custom_check_point": is_custom_check_point,
        "linked_job_id": linked_job_id,
        "observation": observation,
        "requirement": requirement,
        "execution_id": execution_id
      };
}

class HistoryLog {
  int? id;
  int? module_type;
  int? module_ref_id;
  int? secondary_module_type;
  String? comment;
  int? created_by_id;
  String? created_by_name;
  String? created_at;
  int? status;
  String? latitude;
  String? longitude;

  HistoryLog(
      {this.comment,
      this.created_at,
      this.created_by_id,
      this.created_by_name,
      this.id,
      this.latitude,
      this.longitude,
      this.module_ref_id,
      this.module_type,
      this.secondary_module_type,
      this.status});

  factory HistoryLog.fromJson(Map<String, dynamic> json) => HistoryLog(
        comment: json["comment"] ?? "",
        created_at: Utility.getFormatedyearMonthDay(json["created_at"]),
        created_by_id: json["created_by_id"] ?? "",
        created_by_name: json["created_by_name"] ?? "",
        id: json["id"] ?? "",
        latitude: json["latitude"] ?? "",
        longitude: json["longitude"] ?? "",
        module_ref_id: json["module_ref_id"] ?? "",
        module_type: json["module_type"] ?? "",
        secondary_module_type: json["secondary_module_type"] ?? "",
        status: json["status"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "secondary_module_type": secondary_module_type,
        "module_type": module_type,
        "module_ref_id": module_ref_id,
        "longitude": longitude,
        "latitude": latitude,
        "id": id,
        "created_by_name": created_by_name,
        "created_by_id": created_by_id,
        "created_at": created_at,
        "comment": comment,
      };
}

class Files {
  String? event;
  String? file_path;
  String? file_description;

  Files({this.event, this.file_description, this.file_path});

  factory Files.fromJson(Map<String, dynamic> json) => Files(
        event: json["_event"],
        file_path: json["file_path"],
        file_description: json["file_description"],
      );

  Map<String, dynamic> toJson() => {
        "_event": event,
        "file_path": file_path,
        "file_description": file_description
      };
}
