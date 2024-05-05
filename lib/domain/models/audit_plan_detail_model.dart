import 'dart:convert';

AuditPlanDetailModel auditPlanDetailModelFromJson(String str) =>
    AuditPlanDetailModel.fromJson(json.decode(str));

class AuditPlanDetailModel {
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
  String? checklist_name;
  String? schedule_Date;
  AuditPlanDetailModel(
      {this.auditee_Emp_Name,
      this.auditor_Emp_Name,
      this.checklist_id,
      this.description,
      this.facility_name,
      this.frequency,
      this.frequencyApplicable,
      this.id,
      this.plan_number,
      this.schedule_Date,
      this.short_status,
      this.status,
      this.checklist_name});

  factory AuditPlanDetailModel.fromJson(Map<String, dynamic> json) {
    return AuditPlanDetailModel(
      status: json['status'],
      short_status: json['short_status'],
      schedule_Date: json['schedule_Date'],
      plan_number: json['plan_number'],
      id: json['id'],
      frequencyApplicable: json['frequencyApplicable'],
      frequency: json['frequency'],
      auditee_Emp_Name: json['auditee_Emp_Name'],
      auditor_Emp_Name: json['auditor_Emp_Name'],
      checklist_id: json['checklist_id'],
      description: json['description'],
      checklist_name: json['checklist_name'],
      facility_name: json['facility_name'],
    );
  }
}
