import 'package:flutter/material.dart';

class UpdatePmExecutionMdel {
  UpdatePmExecutionMdel(
      {required this.task_id, required this.schedules, this.comment});

  int task_id;
  String? comment;
  List<SchedulesTask> schedules;

  factory UpdatePmExecutionMdel.fromJson(Map<String, dynamic> json) {
    // AddObservations(observation_value_controller: TextEditingController());
    return UpdatePmExecutionMdel(
      task_id: json["task_id"],
      comment: json["comment"],
      schedules: List<SchedulesTask>.from(
          json["Schedules"].map((x) => SchedulesTask.fromJson(x))),
    );
  }
  Map<String, dynamic> toJson() => {
        "task_id": task_id,
        "comment": comment,
        "Schedules": List<dynamic>.from(schedules.map((x) => x.toJson())),
      };
}

class SchedulesTask {
  SchedulesTask(
      {required this.schedule_id, this.add_observations, this.subtask_id});

  int schedule_id;
  int? subtask_id;
  List<AddObservations>? add_observations;

  factory SchedulesTask.fromJson(Map<String, dynamic> json) {
    AddObservations(observation_value_controller: TextEditingController());
    return SchedulesTask(
      schedule_id: json["schedule_id"],
      subtask_id: json["subtask_id"],
      add_observations: List<AddObservations>.from(
          json["add_observations"].map((x) => AddObservations.fromJson(x))),
    );
  }
  Map<String, dynamic> toJson() => {
        "schedule_id": schedule_id,
        "subtask_id": subtask_id,
        "add_observations":
            List<dynamic>.from(add_observations!.map((x) => x.toJson())),
      };
}

class AddObservations {
  AddObservations(
      {this.execution_id,
      this.observation,
      this.job_create,
      this.pm_files,
      // this.boolean,
      this.cp_ok,
      this.text,
      this.is_job_deleted,
      this.observation_value_controller,
      this.text_value_controller});

  int? execution_id;
  String? observation;
  int? job_create;
  // int? boolean; // 1 for ok ,0 for not ok
  int? cp_ok;
  String? text;
  int? is_job_deleted;
  List<PmFiles>? pm_files;
  TextEditingController? observation_value_controller;
  TextEditingController? text_value_controller;

  factory AddObservations.fromJson(Map<String, dynamic> json) =>
      AddObservations(
        execution_id: json["execution_id"],
        observation: json["observation"],
        job_create: json["job_create"],
        // boolean: json["boolean"],
        cp_ok: json["cp_ok"],
        text: json["text"], is_job_deleted: json["is_job_deleted"],
        observation_value_controller:
            TextEditingController(text: json["observation"]),
        text_value_controller: TextEditingController(text: json["text"]),
        pm_files: List<PmFiles>.from(
            json["pm_files"].map((x) => PmFiles.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "execution_id": execution_id,
        "observation": observation,
        "job_create": job_create,
        "is_job_deleted": is_job_deleted,
        "cp_ok": cp_ok,
        "text": text,
        "pm_files": List<dynamic>.from(pm_files!.map((x) => x.toJson())),
      };
}

class PmFiles {
  PmFiles({
    this.file_id,
    this.file_desc,
    this.pm_event,
  });
  int? file_id;
  String? file_desc;
  int? pm_event;

  factory PmFiles.fromJson(Map<String, dynamic> json) => PmFiles(
        file_id: json["file_id"],
        file_desc: json["file_desc"],
        pm_event: json["pm_event"],
      );

  Map<String, dynamic> toJson() => {
        "file_id": file_id,
        "file_desc": file_desc,
        "pm_event": pm_event,
      };
}
