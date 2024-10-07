import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<AuditPlanListModel> auditModelFromJson(String str) =>
    List<AuditPlanListModel>.from(
        json.decode(str).map((x) => AuditPlanListModel.fromJson(x)));

String auditplanListModelToJson(List<AuditPlanListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AuditPlanListModel {
  int? id;
  String? plan_number;
  String? facility_name;
  dynamic auditee_Emp_Name;
  String? auditor_Emp_Name;
  int? frequency;
  int? status;
  String? short_status;
  String? frequencyApplicable;

  int? checklist_id;
  String? description;
  String? schedule_Date;
  String? frequency_name;
  String? checklist_name;
  String? created_at;
  String? created_by;

  AuditPlanListModel(
      {this.auditee_Emp_Name,
      this.auditor_Emp_Name,
      this.facility_name,
      this.frequency,
      this.frequencyApplicable,
      this.id,
      this.plan_number,
      this.short_status,
      this.status,
      this.checklist_id,
      this.description,
      this.schedule_Date,
      this.checklist_name,
      this.created_at,
      this.created_by,
      this.frequency_name});

  factory AuditPlanListModel.fromJson(Map<String, dynamic> parsedJson) {
    return AuditPlanListModel(
      auditee_Emp_Name: parsedJson['auditee_Emp_Name'],
      checklist_name: parsedJson['checklist_name'],
      created_at: parsedJson['created_at'] == null
          ? parsedJson['created_at']
          : Utility.getFormatedyearMonthDay(parsedJson['created_at']),
      created_by: parsedJson['created_by'],
      frequency_name: parsedJson['frequency_name'],
      auditor_Emp_Name: parsedJson['auditor_Emp_Name'],
      facility_name: parsedJson['facility_name'],
      frequency: parsedJson['frequency'],
      frequencyApplicable: parsedJson['frequencyApplicable'],
      id: parsedJson['id'],
      plan_number: parsedJson['title'],
      short_status: parsedJson['short_status'],
      status: parsedJson['status'],
      checklist_id: parsedJson['checklist_id'],
      description: parsedJson['description'],
      schedule_Date: parsedJson['schedule_Date'] == null
          ? parsedJson['schedule_Date']
          : Utility.getFormatedyearMonthDay(parsedJson['schedule_Date']),
    );
  }
  Map<String, dynamic> toJson() => {
        "auditee_Emp_Name": auditee_Emp_Name,
        "auditor_Emp_Name": auditor_Emp_Name,
        "facility_name": facility_name,
        "frequency": frequency,
        "frequencyApplicable": frequencyApplicable,
        "id": id,
        "title": plan_number,
        "short_status": short_status,
        "status": status,
        "checklist_id": checklist_id,
        "description": description,
        "schedule_Date": schedule_Date,
        "frequency_name": frequency_name,
        "checklist_name": checklist_name,
        "created_at": created_at,
        "created_by": created_by,
      };
}
