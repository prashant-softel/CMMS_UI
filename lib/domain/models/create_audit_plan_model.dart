import 'dart:convert';

String createAuditPlanToJson(List<CreateAuditPlan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateAuditPlan {
  int? id;
  String? plan_number;
  int? Facility_id;
  int? auditee_id;
  int? auditor_id;
  int? ApplyFrequency;
  int? Checklist_id;
  String? assignedTo;
  String? Schedule_Date;
  String? Description;
  List<String>? Employees;
  bool? isPTW;
  int? Module_Type_id;

  CreateAuditPlan(
      {this.ApplyFrequency,
      this.Facility_id,
      this.auditee_id,
      this.auditor_id,
      this.plan_number,
      this.Checklist_id,
      this.Description,
      this.Schedule_Date,
      this.assignedTo,
      this.Employees,
      this.id,
      this.Module_Type_id,
      this.isPTW});

  factory CreateAuditPlan.fromJson(Map<String, dynamic> json) =>
      CreateAuditPlan(
          ApplyFrequency: json['ApplyFrequency'],
          Facility_id: json['Facility_id'],
          Module_Type_id: json['Module_Type_id'],
          isPTW: json['isPTW'],
          auditee_id: json['auditee_id'],
          auditor_id: json['auditor_id'],
          plan_number: json['plan_number'],
          Checklist_id: json['Checklist_id'],
          Description: json['Description'],
          Schedule_Date: json['Schedule_Date'],
          assignedTo: json['assignedTo'],
          Employees: json["Employees"] != null
              ? List<String>.from(json["Employees"].map((x) => x))
              : [],
          id: json['id']);

  Map<String, dynamic> toJson() => {
        'plan_number': plan_number,
        'assignedTo': assignedTo,
        'Module_Type_id': Module_Type_id,
        'isPTW': isPTW,
        'id': id,
        "Employees": List<dynamic>.from(Employees!.map((x) => x)),
        'auditor_id': auditor_id,
        'auditee_id': auditee_id,
        'Facility_id': Facility_id,
        'ApplyFrequency': ApplyFrequency,
        'Checklist_id': Checklist_id,
        'Description': Description,
        'Schedule_Date': Schedule_Date,
      };
}
