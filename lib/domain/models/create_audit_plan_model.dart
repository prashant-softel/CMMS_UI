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
  int? max_score;

  List<EvaluationChecklist>? map_checklist;

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
      this.isPTW,
      this.map_checklist,
      this.max_score});

  factory CreateAuditPlan.fromJson(Map<String, dynamic> json) =>
      CreateAuditPlan(
        ApplyFrequency: json['ApplyFrequency'],
        Facility_id: json['Facility_id'],
        Module_Type_id: json['Module_Type_id'],
        isPTW: json['is_PTW'],
        auditee_id: json['auditee_id'],
        auditor_id: json['auditor_id'],
        plan_number: json['plan_number'],
        Checklist_id: json['Checklist_id'],
        Description: json['Description'],
        Schedule_Date: json['Schedule_Date'],
        assignedTo: json['assignedTo'],
        max_score: json["max_score"],
        Employees: json["Employees"] != null
            ? List<String>.from(json["Employees"].map((x) => x))
            : [],
        id: json['id'],
        map_checklist: List<EvaluationChecklist>.from(
            json["map_checklist"].map((x) => EvaluationChecklist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'plan_number': plan_number,
        'assignedTo': assignedTo,
        'Module_Type_id': Module_Type_id,
        'is_PTW': isPTW,
        'id': id,
        "max_score": max_score,
        "Employees": List<dynamic>.from(Employees!.map((x) => x)),
        'auditor_id': auditor_id,
        'auditee_id': auditee_id,
        'Facility_id': Facility_id,
        'ApplyFrequency': ApplyFrequency,
        'Checklist_id': Checklist_id,
        'Description': Description,
        'Schedule_Date': Schedule_Date,
        "map_checklist":
            List<dynamic>.from(map_checklist!.map((x) => x.toJson())),
      };
}

class EvaluationChecklist {
  EvaluationChecklist(
      {this.checklist_id, required this.weightage, this.comment, this.ptw_req});

  int? checklist_id;
  int weightage;
  String? comment;
  int? ptw_req;

  factory EvaluationChecklist.fromJson(Map<String, dynamic> json) =>
      EvaluationChecklist(
        checklist_id: json["checklist_id"],
        weightage: json["asset_item_ID"],
        comment: json["comment"],
        ptw_req: json["ptw_req"],
      );

  Map<String, dynamic> toJson() => {
        "comment": comment,
        "weightage": weightage,
        "checklist_id": checklist_id,
        "ptw_req": ptw_req
      };
}
