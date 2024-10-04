import 'dart:convert';
import 'package:cmms/domain/models/preventive_checklist_model.dart';

import '../../app/utils/utility.dart';

AuditPlanDetailModel auditPlanDetailModelFromJson(String str) =>
    AuditPlanDetailModel.fromJson(json.decode(str));

class AuditPlanDetailModel {
  int? id;
  String? plan_number;
  String? facility_name;
  dynamic auditee_Emp_Name;
  String? auditor_Emp_Name;
  int? frequency;
  String? frequency_name;
  int? status;
  String? short_status;
  String? frequencyApplicable;
  int? checklist_id;
  String? description;
  String? checklist_name;
  String? schedule_Date;
  String? created_at;
  String? created_by;
  String? assignedTo;
  String? employees;
  String? is_PTW;
  String? approved_Date;
  String? approved_by;
  int? max_score;
  int? module_Type_id;
  List<PreventiveCheckListModel>? map_checklist;

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
      this.checklist_name,
      this.created_by,
      this.frequency_name,
      this.created_at,
      this.is_PTW,
      this.assignedTo,
      this.employees,
      this.approved_Date,
      this.approved_by,
      this.max_score,
      this.module_Type_id,
      this.map_checklist});

  factory AuditPlanDetailModel.fromJson(Map<String, dynamic> json) {
    return AuditPlanDetailModel(
      status: json['status'],
      module_Type_id: json['module_Type_id'],
      max_score: json['max_score'],
      assignedTo: json['assignedTo'],
      is_PTW: json['is_PTW'],
      employees: json['employees'],
      frequency_name: json['frequency_name'],
      created_by: json['created_by'],
      short_status: json['short_status'],
      created_at: json['created_at'] == null
          ? json['created_at']
          : Utility.getFormatedyearMonthDay(json['created_at']),
      schedule_Date: json['schedule_Date'] == null
          ? json['schedule_Date']
          : Utility.getFormatedyearMonthDay(json['schedule_Date']),
      approved_Date: json['approved_Date'] == null
          ? json['approved_Date']
          : Utility.getFormatedyearMonthDay(json['approved_Date']),
      approved_by: json['approved_by'],
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
      map_checklist: json['map_checklist'] != null
          ? List<PreventiveCheckListModel>.from(json["map_checklist"]
              .map((x) => PreventiveCheckListModel.fromJson(x)))
          : [],
    );
  }
}
