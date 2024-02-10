import 'dart:convert';

IncidentReportSecondStepModel createIncidentReportModelFromJson(String str) =>
    IncidentReportSecondStepModel.fromJson(json.decode(str));

String createIncidentReportModelToJson(IncidentReportSecondStepModel data) =>
    json.encode(data.toJson());

class IncidentReportSecondStepModel {
  int? id;
  List<WhyWhyAnalysis2?>? why_why_analysis;
  List<RootCause2?>? root_cause;
  List<ImmediateCorrection2?>? immediate_correction;
  List<ProposedActionPlan2?>? proposed_action_plan;
  List<InvestigationTeam2?>? investigation_team;

  IncidentReportSecondStepModel({
    this.id,
    this.why_why_analysis,
    this.root_cause,
    this.immediate_correction,
    this.proposed_action_plan,
    this.investigation_team,
  });

  factory IncidentReportSecondStepModel.fromJson(Map<String, dynamic> json) =>
      IncidentReportSecondStepModel(
        id: json['id'],
        why_why_analysis: json['why_why_analysis'] != null
            ? List<WhyWhyAnalysis2>.from(json["why_why_analysis"]
                ?.map((x) => WhyWhyAnalysis2.fromJson(x)))
            : [],
        root_cause: json['root_cause'] != null
            ? List<RootCause2>.from(
                json["root_cause"]?.map((x) => RootCause2.fromJson(x)))
            : [],
        immediate_correction: json['immediate_correction'] != null
            ? List<ImmediateCorrection2>.from(json["immediate_correction"]
                ?.map((x) => ImmediateCorrection2.fromJson(x)))
            : [],
        proposed_action_plan: json['proposed_action_plan'] != null
            ? List<ProposedActionPlan2>.from(json["proposed_action_plan"]
                ?.map((x) => ProposedActionPlan2.fromJson(x)))
            : [],
        investigation_team: json["investigation_team"] != null
            ? List<InvestigationTeam2>.from(json["investigation_team"]
                ?.map((x) => InvestigationTeam2.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "why_why_analysis": List<dynamic>.from(why_why_analysis!.map((x) => x)),
        "root_cause": List<dynamic>.from(root_cause!.map((x) => x)),
        "immediate_correction":
            List<dynamic>.from(immediate_correction!.map((x) => x)),
        "proposed_action_plan":
            List<dynamic>.from(proposed_action_plan!.map((x) => x)),
        "investigation_team":
            List<dynamic>.from(investigation_team!.map((x) => x)),
      };
}

//Proposed Action Plan
class ProposedActionPlan2 {
  ProposedActionPlan2({
    this.proposed_item_id,
    this.incidents_id,
    this.actions_as_per_plan,
    this.responsibility,
    this.target_date,
    this.remarks,
    this.hse_remark,
    this.id_Status,
  });

  int? incidents_id;
  String? actions_as_per_plan;
  String? responsibility;
  String? target_date;
  String? remarks;
  String? hse_remark;
  int? id_Status;
  int? proposed_item_id;

  factory ProposedActionPlan2.fromJson(Map<String, dynamic> json) =>
      ProposedActionPlan2(
        incidents_id: json['incidents_id'],
        actions_as_per_plan: json['actions_as_per_plan'],
        responsibility: json['responsibility'],
        target_date: json['target_date'],
        remarks: json["remarks"],
        proposed_item_id: json["proposed_item_id"],
        id_Status: json["id_Status"],
        hse_remark: json["hse_remark"],
      );

  Map<String, dynamic> toJson() => {
        "incidents_id": incidents_id,
        "actions_as_per_plan": actions_as_per_plan,
        "responsibility": responsibility,
        "target_date": target_date,
        "remarks": remarks,
        "hse_remark": hse_remark,
        "id_Status": id_Status,
        "proposed_item_id": proposed_item_id,
      };
}

///why why Analysis
class WhyWhyAnalysis2 {
  WhyWhyAnalysis2({
    this.why_item_id,
    this.incidents_id,
    this.why,
    this.cause,
  });
  int? why_item_id;
  int? incidents_id;
  String? why;
  String? cause;

  factory WhyWhyAnalysis2.fromJson(Map<String, dynamic> json) =>
      WhyWhyAnalysis2(
        incidents_id: json['incidents_id'],
        why: json['why'],
        cause: json["cause"],
        why_item_id: json["why_item_id"],
      );

  Map<String, dynamic> toJson() => {
        "why_item_id": why_item_id,
        "incidents_id": incidents_id,
        "why": why,
        "cause": cause,
      };
}

//Root Cause
class RootCause2 {
  RootCause2({
    this.root_item_id,
    this.incidents_id,
    this.cause,
  });

  int? incidents_id;
  String? cause;
  int? root_item_id;

  factory RootCause2.fromJson(Map<String, dynamic> json) => RootCause2(
        incidents_id: json['incidents_id'],
        cause: json["cause"],
        root_item_id: json["root_item_id"],
      );

  Map<String, dynamic> toJson() => {
        "incidents_id": incidents_id,
        "cause": cause,
        "root_item_id": root_item_id,
      };
}

///Imeediate Correction
class ImmediateCorrection2 {
  ImmediateCorrection2({
    this.ic_item_id,
    this.incidents_id,
    this.details,
  });

  int? incidents_id;
  String? details;
  int? ic_item_id;

  factory ImmediateCorrection2.fromJson(Map<String, dynamic> json) =>
      ImmediateCorrection2(
        incidents_id: json['incidents_id'],
        details: json["details"],
        ic_item_id: json["ic_item_id"],
      );

  Map<String, dynamic> toJson() => {
        "incidents_id": incidents_id,
        "details": details,
        "ic_item_id": ic_item_id,
      };
}

class InvestigationTeam2 {
  InvestigationTeam2({
    this.investigation_item_id,
    this.person_id,
    this.name,
    this.designation,
    this.person_type,
    this.investigation_date,
  });

  String? person_id;
  int? person_type;
  String? name;
  String? designation;
  String? investigation_date;
  int? investigation_item_id;

  factory InvestigationTeam2.fromJson(Map<String, dynamic> json) =>
      InvestigationTeam2(
          investigation_item_id: json['investigation_item_id'],
          person_id: json['person_id'],
          person_type: json['person_type'],
          name: json["person_name"],
          designation: json['designation'],
          investigation_date: json['investigation_date']);

  Map<String, dynamic> toJson() => {
        "investigation_item_id": investigation_item_id,
        "person_id": person_id,
        "person_type": person_type,
        "name": name,
        "designation": designation,
        "investigation_date": investigation_date
      };
}
