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
  String? Schedule_Date;
  String? Description;
  CreateAuditPlan(
      {this.ApplyFrequency,
      this.Facility_id,
      this.auditee_id,
      this.auditor_id,
      this.plan_number,
      this.Checklist_id,
      this.Description,
      this.Schedule_Date,
      this.id});

  factory CreateAuditPlan.fromJson(Map<String, dynamic> json) =>
      CreateAuditPlan(
          ApplyFrequency: json['ApplyFrequency'],
          Facility_id: json['Facility_id'],
          auditee_id: json['auditee_id'],
          auditor_id: json['auditor_id'],
          plan_number: json['plan_number'],
          Checklist_id: json['Checklist_id'],
          Description: json['Description'],
          Schedule_Date: json['Schedule_Date'],
          id: json['id']);

  Map<String, dynamic> toJson() => {
        'plan_number': plan_number,
        'id': id,
        'auditor_id': auditor_id,
        'auditee_id': auditee_id,
        'Facility_id': Facility_id,
        'ApplyFrequency': ApplyFrequency,
        'Checklist_id': Checklist_id,
        'Description': Description,
        'Schedule_Date': Schedule_Date,
      };
}
