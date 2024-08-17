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
  int? facility_id;
  String? task_code;
  String? plan_title;
  String? last_done_date;
  String? due_date;
  String? done_date;
  int? plan_id;
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
  int? ptw_tbt_done;
  int? started_by_id;
  String? started_by_name;
  String? started_at;
  int? closed_by_id;
  String? closed_by_name;
  String? closed_at;
  int? cancelled_by_id;
  String? cancelled_by_name;
  String? cancelled_at;
  int? approved_by_id;
  String? approved_by_name;
  String? approved_at;
  int? rejected_by_id;
  String? rejected_by_name;
  String? rejected_at;
  int? updated_by_id;
  String? updated_by_name;
  String? updated_at;
  String? status_long;
  String? approved_by;
  String? schedule_Date;
  List<ScheduleCheckPoint>? schedules;
  String? is_PTW;
  List<MaterialConsumption>? material_consumption;
  int? employee_ID;
  String? employee_name;
  String? company;
  int? isolation_taken;
  String? isolated_equipment;
  String? tbT_conducted_by_name;
  String? tbT_done_time;
  String? start_time;
  String? workdescription;
  String? new_remark;
  String? site_name;

  PmtaskViewModel({
    this.assigned_to_name,
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
    this.permit_type,
    this.ptw_tbt_done,
    this.approved_at,
    this.approved_by_id,
    this.approved_by_name,
    this.cancelled_at,
    this.cancelled_by_id,
    this.cancelled_by_name,
    this.closed_at,
    this.is_PTW,
    this.closed_by_id,
    this.closed_by_name,
    this.rejected_at,
    this.rejected_by_id,
    this.rejected_by_name,
    this.started_at,
    this.started_by_id,
    this.started_by_name,
    this.status_long,
    this.updated_at,
    this.plan_id,
    this.approved_by,
    this.updated_by_id,
    this.updated_by_name,
    this.schedule_Date,
    this.material_consumption,
    this.employee_ID,
    this.employee_name,
    this.company,
    this.isolation_taken,
    this.isolated_equipment,
    this.tbT_conducted_by_name,
    this.tbT_done_time,
    this.start_time,
    this.workdescription,
    this.new_remark,
    this.site_name,
  });

  factory PmtaskViewModel.fromJson(Map<String, dynamic> json) =>
      PmtaskViewModel(
        status_short_ptw: json["status_short_ptw"] ?? "",
        approved_by: json["approved_by"],
        plan_id: json["plan_id"] ?? 0,
        is_PTW: json['is_PTW'] ?? "",
        updated_by_name: json["updated_by_name"] ?? "",
        updated_by_id: json["updated_by_id"] ?? 0,
        updated_at: json["updated_at"] ?? "",
        status_long: json["status_long"] ?? "",
        started_by_name: json["started_by_name"] ?? "",
        started_by_id: json["started_by_id"] ?? 0,
        started_at: json["started_at"] ?? "",
        rejected_by_name: json["rejected_by_name"] ?? "",
        rejected_by_id: json["rejected_by_id"] ?? 0,
        rejected_at: json["rejected_at"] ?? "",
        closed_by_name: json["closed_by_name"] ?? "",
        closed_by_id: json["closed_by_id"] ?? 0,
        closed_at: json["closed_at"] ?? "",
        cancelled_by_name: json["cancelled_by_name"] ?? "",
        cancelled_by_id: json["cancelled_by_id"] ?? 0,
        cancelled_at: json["cancelled_at"] ?? "",
        approved_by_name: json["approved_by_name"] ?? "",
        approved_by_id: json["approved_by_id"] ?? 0,
        approved_at: json['approved_at'] == null
            ? json['approved_at']
            : Utility.getFormatedyearMonthDay(json['approved_at']),
        schedule_Date: json['schedule_Date'] == null
            ? json['schedule_Date']
            : Utility.getFormatedyearMonthDay(json['schedule_Date']),
        ptw_status: json["ptw_status"] ?? 0,
        ptw_tbt_done: json["ptw_tbt_done"] ?? 0,
        assigned_to_name: json["assigned_to_name"] ?? "",
        category_id: json["category_id"] ?? 0,
        category_name: json["category_name"] ?? "",
        frequency_id: json["frequency_id"] ?? 0,
        frequency_name: json["frequency_name"] ?? "",
        id: json["id"] ?? 0,
        site_name: json["site_name"] ?? "",
        tbT_done_time: json["tbT_done_time"] ?? "",
        tbT_conducted_by_name: json["tbT_conducted_by_name"] ?? "",
        start_time: json["start_time"] ?? "",
        new_remark: json["new_remark"] ?? "",
        workdescription: json["workdescription"] ?? "",
        employee_name: json["employee_name"] ?? "",
        employee_ID: json["employee_ID"] ?? 0,
        permit_code: json["permit_code"] ?? "",
        company: json["company"] ?? "",
        isolation_taken: json["isolation_taken"] ?? 0,
        isolated_equipment: json["isolated_equipment"] ?? "",
        permit_id: json["permit_id"] ?? 0,
        status: json["status"] ?? 0,
        facility_id: json["facility_id"] ?? 0,
        assigned_to_id: json["assigned_to_id"] ?? 0,
        done_date: json['done_date'] == null
            ? json['done_date']
            : Utility.getFormatedyearMonthDay(json['done_date']),
        due_date: json['due_date'] == null
            ? json['due_date']
            : Utility.getFormatedyearMonthDay(json['due_date']),
        last_done_date: json['last_done_date'] == null
            ? json['last_done_date']
            : Utility.getFormatedyearMonthDay(json['last_done_date']),
        plan_title: json["plan_title"] ?? "",
        status_short: json["status_short"] ?? "",
        task_code: json["task_code"] ?? "",
        permit_type: json["permit_type"] ?? "",
        schedules: List<ScheduleCheckPoint>.from(
            json["schedules"].map((x) => ScheduleCheckPoint.fromJson(x))),
        material_consumption: List<MaterialConsumption>.from(
            json["material_consumption"]
                .map((x) => MaterialConsumption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ptw_status": ptw_status,
        "approved_by": approved_by,
        "is_PTW": is_PTW,
        "schedule_Date": schedule_Date,
        "plan_id": plan_id,
        "tbT_conducted_by_name": tbT_conducted_by_name,
        "start_time": start_time,
        "new_remark": new_remark,
        "site_name": site_name,
        "workdescription": workdescription,
        "tbT_done_time": tbT_done_time,
        "employee_ID": employee_ID,
        "employee_name": employee_name,
        "company": company,
        "isolation_taken": isolation_taken,
        "isolated_equipment": isolated_equipment,
        "updated_by_name": updated_by_name,
        "updated_by_id": updated_by_id,
        "updated_at": updated_at,
        "status_long": status_long,
        "started_by_name": started_by_name,
        "started_by_id": started_by_id,
        "started_at": started_at,
        "rejected_by_name": rejected_by_name,
        "rejected_by_id": rejected_by_id,
        "rejected_at": rejected_at,
        "closed_by_name": closed_by_name,
        "closed_by_id": closed_by_id,
        "closed_at": closed_at,
        "cancelled_by_name": cancelled_by_name,
        "cancelled_by_id": cancelled_by_id,
        "cancelled_at": cancelled_at,
        "approved_by_name": approved_by_name,
        "approved_by_id": approved_by_id,
        "approved_at": approved_at,
        "ptw_tbt_done": ptw_tbt_done,
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
        "material_consumption": List<dynamic>.from(
            material_consumption?.map((x) => x.toJson()) ?? []),
      };
}

class ScheduleCheckPoint {
  int? schedule_id;
  int? clone_of_asset;
  String? clone_of_name;
  String? name;
  int? assetsID;
  String? checklist_name;
  int? completedBy_id;
  String? completedBy_name;
  List<ChecklistObservation>? checklist_observation;
  List<ScheduleLinkJob>? schedule_link_job;

  ScheduleCheckPoint({
    this.name,
    this.checklist_name,
    this.clone_of_asset,
    this.clone_of_name,
    this.schedule_id,
    this.assetsID,
    this.checklist_observation,
    this.schedule_link_job,
    this.completedBy_name,
    this.completedBy_id,
  });

  factory ScheduleCheckPoint.fromJson(Map<String, dynamic> json) =>
      ScheduleCheckPoint(
        name: json["asset_name"] ?? '',
        checklist_name: json["checklist_name"] ?? '',
        clone_of_asset: json["clone_of_asset"] ?? 0,
        assetsID: json["assetsID"] ?? 0,
        clone_of_name: json["clone_of_name"] ?? '',
        schedule_id: json["schedule_id"] ?? 0,
        completedBy_id: json["completedBy_id"] ?? 0,
        completedBy_name: json["completedBy_name"] ?? "",
        checklist_observation: List<ChecklistObservation>.from(
            json["checklist_observation"]
                .map((x) => ChecklistObservation.fromJson(x))),
        schedule_link_job: List<ScheduleLinkJob>.from(
            json["schedule_link_job"].map((x) => ScheduleLinkJob.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "asset_name": name,
        "completedBy_name": completedBy_name,
        "completedBy_id": completedBy_id,
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
  RxInt type_bool = RxInt(0);
  dynamic type_text;
  String? observation;
  RxInt linked_job_id = RxInt(0);
  RxInt cp_ok = RxInt(0);
  int? is_custom_check_point;
  int? is_file_required;
  TextEditingController? observation_value_controller;
  TextEditingController? type_text_value_controller;
  dynamic min_range;
  dynamic max_range;

  ChecklistObservation({
    this.check_point_id,
    this.check_point_name,
    this.check_point_type,
    this.execution_id,
    this.failure_waightage,
    this.is_custom_check_point,
    this.is_file_required,
    int? linked_job_id,
    int? cp_ok,
    this.observation,
    this.requirement,
    int? type_bool,
    this.type_range,
    this.type_text,
    this.files,
    this.max_range,
    this.min_range,
    this.observation_value_controller,
    this.type_text_value_controller,
  }) {
    this.linked_job_id.value = linked_job_id!;
    this.cp_ok.value = cp_ok!;
    this.type_bool.value = type_bool!;
  }

  factory ChecklistObservation.fromJson(Map<String, dynamic> json) =>
      ChecklistObservation(
        check_point_id: json["check_point_id"] ?? 0,
        check_point_name: json["check_point_name"] ?? '',
        check_point_type: json["check_point_type"] ?? 0,
        execution_id: json["execution_id"] ?? 0,
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
        files: List<Files>.from(json["files"].map((x) => Files.fromJson(x))),
      );

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
        "file_description": file_description,
      };
}

class ScheduleLinkJob {
  int? job_id;
  String? job_title;
  String? job_description;
  String? job_date;
  String? job_status;
  int? no_of_tools;
  String? tool_name;

  ScheduleLinkJob({
    this.job_date,
    this.job_description,
    this.job_id,
    this.job_status,
    this.job_title,
    this.no_of_tools,
    this.tool_name,
  });

  factory ScheduleLinkJob.fromJson(Map<String, dynamic> json) =>
      ScheduleLinkJob(
        job_date: json["job_date"],
        job_description: json["job_description"],
        job_id: json["job_id"],
        job_status: json["job_status"],
        job_title: json["job_title"],
        no_of_tools: json["no_of_tools"],
        tool_name: json["tool_name"],
      );

  Map<String, dynamic> toJson() => {
        "job_title": job_title,
        "job_status": job_status,
        "job_id": job_id,
        "job_description": job_description,
        "job_date": job_date,
        "no_of_tools": no_of_tools,
        "tool_name": tool_name,
      };
}

class MaterialConsumption {
  int? material_ID;
  String? material_name;
  double? used_qty;
  double? issued_qty;
  String? material_type;
  int? equipment_ID;

  MaterialConsumption({
    this.material_ID,
    this.material_name,
    this.used_qty,
    this.issued_qty,
    this.material_type,
    this.equipment_ID,
  });

  factory MaterialConsumption.fromJson(Map<String, dynamic> json) =>
      MaterialConsumption(
        material_ID: json["material_ID"] ?? 0,
        material_name: json["material_name"] ?? '',
        used_qty: json["used_qty"]?.toDouble() ?? 0.0,
        issued_qty: json["issued_qty"]?.toDouble() ?? 0.0,
        material_type: json["material_type"] ?? '',
        equipment_ID: json["equipment_ID"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "material_ID": material_ID,
        "material_name": material_name,
        "used_qty": used_qty,
        "issued_qty": issued_qty,
        "material_type": material_type,
        "equipment_ID": equipment_ID,
      };
}
