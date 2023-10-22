import 'dart:convert';

String createAuditPlanToJson(List<CreateAuditPlan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateAuditPlan {
  String plan_number;
  int facility_id;
  int auditee_id;
  int auditor_id;
  int ApplyFrequency;

  CreateAuditPlan(
      {required this.ApplyFrequency,
      required this.auditee_id,
      required this.auditor_id,
      required this.plan_number,
      required this.facility_id});

  factory CreateAuditPlan.fromJson(Map<String, dynamic> json) =>
      CreateAuditPlan(
        ApplyFrequency: json['ApplyFrequency'],
        auditee_id: json['auditee_id'],
        auditor_id: json['auditor_id'],
        plan_number: json['plan_number'],
        facility_id: json['facility_id'],
      );

  Map<String, dynamic> toJson() => {
        'ApplyFrequency': ApplyFrequency,
        'auditee_id': auditee_id,
        'auditor_id': auditor_id,
        'plan_number': plan_number,
        'facility_id': facility_id,
      };
}
