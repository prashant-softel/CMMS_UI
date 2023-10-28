import 'dart:convert';

String createAuditPlanToJson(List<CreateAuditPlan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateAuditPlan {
  String? plan_number;
  int? Facility_id;
  int? auditee_id;
  int? auditor_id;
  int? ApplyFrequency;
  CreateAuditPlan(
      {this.ApplyFrequency,
      this.Facility_id,
      this.auditee_id,
      this.auditor_id,
      this.plan_number});

  factory CreateAuditPlan.fromJson(Map<String, dynamic> json) =>
      CreateAuditPlan(
        ApplyFrequency: json['ApplyFrequency'],
        Facility_id: json['Facility_id'],
        auditee_id: json['auditee_id'],
        auditor_id: json['auditor_id'],
        plan_number: json['plan_number'],
      );

  Map<String, dynamic> toJson() => {
        'plan_number': plan_number,
        'auditor_id': auditor_id,
        'auditee_id': auditee_id,
        'Facility_id': Facility_id,
        'ApplyFrequency': ApplyFrequency,
      };
}
