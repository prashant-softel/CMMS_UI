import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

PmtaskViewModel pmtaskViewModelFromJson(String str) =>
    PmtaskViewModel.fromJson(json.decode(str));

String pmtaskViewModelToJson(PmtaskViewModel data) =>
    json.encode(data.toJson());

class PmtaskViewModel {
  int? id;
  int? facility_id;
  String? task_code;
  String? plan_title;
  String? last_done_date;
  String? due_date;
  String? done_date;

  int? category_id;
  String? category_name;
  int? frequency_id;
  String? frequency_name;
  int? assigned_to_id;

  String? assigned_to_name;
  int? permit_id;
  String? permit_code;
  int? status;
  String? status_short;
  int? ptw_status;
  String? status_short_ptw;
  String? permit_type;
  List<ScheduleCheckPoint>? schedules;

  PmtaskViewModel(
      {this.assigned_to_name,
      this.category_id,
      this.category_name,
      this.frequency_id,
      this.frequency_name,
      this.id,
      this.permit_code,
      this.permit_id,
      this.status,
      this.facility_id,
      this.assigned_to_id,
      this.done_date,
      this.due_date,
      this.last_done_date,
      this.plan_title,
      this.status_short,
      this.task_code,
      this.schedules,
      this.status_short_ptw,
      this.ptw_status,
      this.permit_type});

  factory PmtaskViewModel.fromJson(Map<String, dynamic> json) =>
      PmtaskViewModel(
        status_short_ptw: json["status_short_ptw"] ?? "",
        ptw_status: json["ptw_status"] ?? 0,
        assigned_to_name: json["assigned_to_name"] ?? "",
        category_id: json["category_id"] ?? "",
        category_name: json["category_name"] ?? "",
        frequency_id: json["frequency_id"] ?? "",
        frequency_name: json["frequency_name"] ?? "",
        id: json["id"] ?? "",
        permit_code: json["permit_code"] ?? "",
        permit_id: json["permit_id"] ?? "",
        status: json["status"] ?? "",
        facility_id: json["facility_id"] ?? "",
        assigned_to_id: json["assigned_to_id"] ?? "",
        done_date: json["done_date"] ?? "",
        due_date: json["due_date"] ?? "",
        last_done_date: json["last_done_date"] ?? "",
        plan_title: json["plan_title"] ?? "",
        status_short: json["status_short"] ?? "",
        task_code: json["task_code"] ?? "",
        permit_type: json["permit_type"] ?? "",
        schedules: List<ScheduleCheckPoint>.from(
            json["schedules"].map((x) => ScheduleCheckPoint.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ptw_status": ptw_status,
        "status_short_ptw": status_short_ptw,
        "assigned_to_name": assigned_to_name,
        "category_id": category_id,
        "category_name": category_name,
        "assigned_to_id": assigned_to_id,
        "done_date": done_date,
        "due_date": due_date,
        "last_done_date": last_done_date,
        "frequency_id": frequency_id,
        "frequency_name": frequency_name,
        "facility_id": facility_id,
        "id": id,
        "plan_title": plan_title,
        "permit_code": permit_code,
        "permit_id": permit_id,
        "status_short": status_short,
        "status": status,
        "task_code": task_code,
        "permit_type": permit_type,
        "schedules":
            List<dynamic>.from(schedules?.map((x) => x.toJson()) ?? []),
      };
}

class ScheduleCheckPoint {
  int? schedule_id;
  int? clone_of_asset;
  String? clone_of_name;
  String? name;
  int? assetsID;
  String? checklist_name;
  List<ChecklistObservation>? checklist_observation;
  List<ScheduleLinkJob>? schedule_link_job;

  ScheduleCheckPoint(
      {this.name,
      this.checklist_name,
      this.clone_of_asset,
      this.clone_of_name,
      this.schedule_id,
      this.assetsID,
      this.checklist_observation,
      this.schedule_link_job});

  factory ScheduleCheckPoint.fromJson(Map<String, dynamic> json) =>
      ScheduleCheckPoint(
          name: json["asset_name"] ?? '',
          checklist_name: json["checklist_name"] ?? '',
          clone_of_asset: json["clone_of_asset"] ?? 0,
          assetsID: json["assetsID"] ?? 0,
          clone_of_name: json["clone_of_name"] ?? '',
          schedule_id: json["schedule_id"] ?? 0,
          checklist_observation: List<ChecklistObservation>.from(
              json["checklist_observation"]
                  .map((x) => ChecklistObservation.fromJson(x))),
          schedule_link_job: List<ScheduleLinkJob>.from(
              json["schedule_link_job"]
                  .map((x) => ScheduleLinkJob.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "asset_name": name,
        "checklist_name": checklist_name,
        "clone_of_asset": clone_of_asset,
        "clone_of_name": clone_of_name,
        "schedule_id": schedule_id,
        "assetsID": assetsID,
        "checklist_observation": List<dynamic>.from(
            checklist_observation?.map((x) => x.toJson()) ?? []),
        "schedule_link_job":
            List<dynamic>.from(schedule_link_job?.map((x) => x.toJson()) ?? []),
      };
}

class ChecklistObservation {
  int? execution_id;
  int? check_point_id;
  String? check_point_name;
  String? requirement;
  int? failure_waightage;
  List<Files>? files;

  int? check_point_type;
  int? type_range;
  // int? type_bool;
  RxInt type_bool = RxInt(0);

  dynamic type_text;
  String? observation;
  RxInt linked_job_id = RxInt(0);
  RxInt cp_ok = RxInt(0);

  int? is_custom_check_point;
  int? is_file_required;
  TextEditingController? observation_value_controller;
  TextEditingController? type_text_value_controller;
  int? min_range;
  int? max_range;
  ChecklistObservation(
      {this.check_point_id,
      this.check_point_name,
      this.check_point_type,
      this.execution_id,
      this.failure_waightage,
      this.is_custom_check_point,
      this.is_file_required,
      required int linked_job_id,
      required int cp_ok,
      this.observation,
      this.requirement,
      required int type_bool,
      this.type_range,
      this.type_text,
      this.files,
      this.max_range,
      this.min_range,
      this.observation_value_controller,
      this.type_text_value_controller}) {
    this.linked_job_id.value = linked_job_id;
    this.cp_ok.value = cp_ok;
    this.type_bool.value = type_bool;
  }

  factory ChecklistObservation.fromJson(Map<String, dynamic> json) =>
      ChecklistObservation(
          check_point_id: json["check_point_id"] ?? 0,
          check_point_name: json["check_point_name"] ?? '',
          check_point_type: json["check_point_type"] ?? 0,
          execution_id: json["execution_id"] ?? '',
          failure_waightage: json["failure_waightage"] ?? 0,
          is_custom_check_point: json["is_custom_check_point"] ?? 0,
          is_file_required: json["is_file_required"] ?? 0,
          linked_job_id: json["linked_job_id"] ?? 0,
          observation: json["observation"] ?? '',
          requirement: json["requirement"] ?? '',
          type_bool: json["type_bool"] ?? 0,
          type_range: json["type_range"] ?? 0,
          type_text: json["type_text"],
          cp_ok: json["cp_ok"] ?? 0,
          max_range: json["max_range"] ?? 0,
          min_range: json["min_range"] ?? 0,
          observation_value_controller: TextEditingController(
            text: json['observation'],
          ),
          type_text_value_controller: TextEditingController(
            text: json['type_text'].toString(),
          ),
          files: List<Files>.from(json["files"].map((x) => Files.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "check_point_id": check_point_id,
        "check_point_name": check_point_name,
        "check_point_type": check_point_type,
        "execution_id": execution_id,
        "failure_waightage": failure_waightage,
        "is_custom_check_point": is_custom_check_point,
        "is_file_required": is_file_required,
        "linked_job_id": linked_job_id,
        "observation": observation,
        "requirement": requirement,
        "type_bool": type_bool,
        "type_range": type_range,
        "type_text": type_text,
        "cp_ok": cp_ok,
        "min_range": min_range,
        "max_range": max_range,
        "files": List<dynamic>.from(files?.map((x) => x.toJson()) ?? []),
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

class ScheduleLinkJob {
  int? job_id;
  String? job_title;
  String? job_description;
  String? job_date;
  String? job_status;

  ScheduleLinkJob(
      {this.job_date,
      this.job_description,
      this.job_id,
      this.job_status,
      this.job_title});

  factory ScheduleLinkJob.fromJson(Map<String, dynamic> json) =>
      ScheduleLinkJob(
        job_date: json["job_date"],
        job_description: json["job_description"],
        job_id: json["job_id"],
        job_status: json["job_status"],
        job_title: json["job_title"],
      );

  Map<String, dynamic> toJson() => {
        "job_title": job_title,
        "job_status": job_status,
        "job_id": job_id,
        "job_description": job_description,
        "job_date": job_date
      };
}
