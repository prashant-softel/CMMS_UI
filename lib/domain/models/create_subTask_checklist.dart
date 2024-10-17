import 'dart:convert';

String createSubTaskCheckListToJson(List<CreateSubTaskCheckList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateSubTaskCheckList {
  int? task_id;
  int? plan_id;

  List<SubTaskChecklist>? map_checklist;

  CreateSubTaskCheckList({this.plan_id, this.map_checklist, this.task_id});

  factory CreateSubTaskCheckList.fromJson(Map<String, dynamic> json) =>
      CreateSubTaskCheckList(
        plan_id: json['plan_id'],
        task_id: json['task_id'],
        map_checklist: List<SubTaskChecklist>.from(
            json["map_checklist"].map((x) => SubTaskChecklist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'plan_id': plan_id,
        'task_id': task_id,
        "map_checklist":
            List<dynamic>.from(map_checklist!.map((x) => x.toJson())),
      };
}

class SubTaskChecklist {
  SubTaskChecklist(
      {this.checklist_id,
      this.schedule_date,
      this.title,
      this.assign_to,
      this.subtask_id});
  int? checklist_id;
  int? assign_to;
  String? title;
  String? schedule_date;
  int? subtask_id;
  factory SubTaskChecklist.fromJson(Map<String, dynamic> json) =>
      SubTaskChecklist(
          checklist_id: json["checklist_id"],
          schedule_date: json["schedule_date"],
          assign_to: json["assign_to"],
          title: json['title'],
          subtask_id: json['subtask_id']);

  Map<String, dynamic> toJson() => {
        "schedule_date": schedule_date,
        "checklist_id": checklist_id,
        "title": title,
        "assign_to": assign_to,
        "subtask_id": subtask_id
      };
}
