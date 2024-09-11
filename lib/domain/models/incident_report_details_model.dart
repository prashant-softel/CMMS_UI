// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

IncidentReportDetailsModel incidentReportDetailModelFromJson(String str) =>
    IncidentReportDetailsModel.fromJson(json.decode(str));

String incidentReportDetailModelToJson(IncidentReportDetailsModel data) =>
    json.encode(data.toJson());

class IncidentReportDetailsModel {
  IncidentReportDetailsModel({
    this.id,
    this.facility_id,
    this.facility_name,
    this.block_id,
    this.block_name,
    this.equipment_id,
    this.equipment_name,
    this.risk_level,
    this.risk_level_name,
    this.updated_by_name,
    this.created_by_name,
    this.created_by_id,
    this.incident_datetime,
    this.victim_id,
    this.victim_name,
    this.action_taken_by,
    this.action_taken_by_name,
    this.action_taken_datetime,
    this.inverstigated_by,
    this.inverstigated_by_name,
    this.verified_by,
    this.verified_by_name,
    this.risk_type,
    this.risk_type_name,
    this.esi_applicability,
    this.esi_applicability_name,
    this.legal_applicability,
    this.legal_applicability_name,
    this.rca_required,
    this.rca_required_name,
    this.damaged_cost,
    this.generation_loss,
    this.job_id,
    this.job_name,
    this.title,
    this.description,
    this.is_insurance_applicable,
    this.is_insurance_applicable_name,
    this.insurance_name,
    this.insurance_status,
    this.insurance_status_name,
    this.insurance_remark,
    this.approved_by,
    this.approved_by_name,
    this.status,
    this.historyId,
    this.status_name,
    this.reporting_datetime,
    this.approved_at,
    this.status_short,
    this.status_long,
    this.severity,
    this.reject_comment,
    this.lstHistory,
    this.why_why_analysis,
    this.root_cause,
    this.immediate_correction,
    this.proposed_action_plan,
    this.esi_applicability_remark,
    this.legal_applicability_remark,
    this.location_of_incident,
    this.type_of_job,
    this.is_activities_trained,
    this.is_person_authorized,
    this.is_person_involved,
    this.instructions_given,
    this.safety_equipments,
    this.safe_procedure_observed,
    this.unsafe_condition_contributed,
    this.unsafe_act_cause,
    this.investigation_team,
    this.is_why_why_required,
    this.is_investigation_required,
    this.injured_person,
    this.Otherinjured_person,
    this.fileList,

    // this.additionalEmailEmployees,
    // this.externalEmails,
    // this.supplierActions,
  });

  int? id;
  int? facility_id;
  String? facility_name;
  int? block_id;
  String? block_name;
  int? equipment_id;
  String? equipment_name;
  int? risk_level;
  String? risk_level_name;
  String? updated_by_name;
  String? created_by_name;
  int? created_by_id;
  DateTime? incident_datetime;
  int? victim_id;
  String? is_person_involved;
  String? victim_name;
  int? action_taken_by;
  String? action_taken_by_name;
  DateTime? action_taken_datetime;
  DateTime? reporting_datetime;
  int? inverstigated_by;
  String? inverstigated_by_name;
  int? verified_by;
  String? verified_by_name;
  int? risk_type;
  String? risk_type_name;
  int? esi_applicability;
  String? esi_applicability_name;
  int? legal_applicability;
  String? legal_applicability_name;
  int? rca_required;
  String? rca_required_name;
  int? damaged_cost;
  int? generation_loss;
  int? job_id;
  String? job_name;
  String? title;
  String? description;
  int? is_insurance_applicable;
  String? is_insurance_applicable_name;
  String? insurance_name;
  int? insurance_status;
  String? insurance_status_name;
  String? insurance_remark;
  int? approved_by;
  String? approved_by_name;
  int? status;
  int? historyId;
  String? status_name;
  DateTime? approved_at;
  String? status_short;
  String? status_long;
  String? severity;
  String? reject_comment;
  String? esi_applicability_remark;
  String? legal_applicability_remark;
  String? location_of_incident;
  String? type_of_job;
  String? is_activities_trained;
  String? is_person_authorized;
  String? instructions_given;
  String? safety_equipments;
  String? safe_procedure_observed;
  String? unsafe_condition_contributed;
  String? unsafe_act_cause;
  List<ListHistory?>? lstHistory;

  List<WhyWhyAnalysisUpdate?>? why_why_analysis;
  List<RootCauseUpdate?>? root_cause;
  List<ImmediateCorrectionUpdate?>? immediate_correction;
  List<ProposedActionPlanUpdate?>? proposed_action_plan;
  List<InvestigationTeamUpdate?>? investigation_team;
  int? is_why_why_required;
  int? is_investigation_required;
  List<DetailsOfInjuredPersonUpdate?>? injured_person;
  List<DetailsOfOtherInjuredPersonUpdate?>? Otherinjured_person;
  List<FileList?>? fileList;

  // List<ExternalsEmailsList?>? externalEmails;
  // List<SuppliersActionsList?>? supplierActions;

  factory IncidentReportDetailsModel.fromJson(Map<String, dynamic> json) =>
      IncidentReportDetailsModel(
        id: json["id"],
        facility_id: json["facility_id"],
        facility_name: json["facility_name"],
        block_id: json['block_id'],
        block_name: json['block_name'] ?? '',
        is_person_involved: json['is_person_involved'],
        equipment_id: json['equipment_id'],
        equipment_name: json['equipment_name'],
        risk_level: json['risk_level'],
        risk_level_name: json['risk_level_name'],
        updated_by_name: json['updated_by_name'] ?? '',
        created_by_name: json['created_by_name'],
        created_by_id: json['created_by_id'],
        incident_datetime: json['incident_datetime'] == null
            ? null
            : DateTime.parse(json['incident_datetime'] as String),
        reporting_datetime: json['reporting_datetime'] == null
            ? null
            : DateTime.parse(json['reporting_datetime'] as String),
        victim_id: json['victim_id'],
        victim_name: json['victim_name'],
        action_taken_by: json['action_taken_by'],
        action_taken_by_name: json['action_taken_by_name'] ?? '',
        action_taken_datetime: json['action_taken_datetime'] == null
            ? null
            : DateTime.parse(json['action_taken_datetime'] as String),
        inverstigated_by: json['inverstigated_by'],
        inverstigated_by_name: json['inverstigated_by_name'],
        verified_by: json['verified_by'],
        verified_by_name: json['verified_by_name'],
        risk_type: json['risk_type'],
        risk_type_name: json['risk_type_name'] ?? '',
        esi_applicability: json['esi_applicability'],
        esi_applicability_name: json['esi_applicability_name'],
        legal_applicability: json['legal_applicability'],
        legal_applicability_name: json['legal_applicability_name'],
        rca_required: json['rca_required'],
        rca_required_name: json['rca_required_name'],
        damaged_cost: json['damaged_cost'],
        generation_loss: json['generation_loss'],
        job_id: json['job_id'],
        job_name: json['job_name'] ?? '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        is_insurance_applicable: json['is_insurance_applicable'],
        is_insurance_applicable_name: json['is_insurance_applicable_name'],
        insurance_name: json['insurance_name'] ?? '',
        insurance_status: json['insurance_status'],
        insurance_status_name: json['insurance_status_name'] ?? '',
        insurance_remark: json['insurance_remark'],
        approved_by: json['approved_by'],
        approved_by_name: json['approved_by_name'],
        status: json['status'],
        historyId: json['historyId'],
        status_name: json['status_name'] ?? '',
        approved_at: json['approved_at'] == null
            ? null
            : DateTime.parse(json['approved_at'] as String),
        status_short: json['status_short'],
        status_long: json['status_long'],
        severity: json['severity'] ?? '',
        reject_comment: json['reject_comment'] ?? '',
        esi_applicability_remark: json['esi_applicability_remark'],
        legal_applicability_remark: json['legal_applicability_remark'],
        location_of_incident: json['location_of_incident'],
        type_of_job: json['type_of_job'],
        is_activities_trained: json['is_activities_trained'],
        is_person_authorized: json['is_person_authorized'],
        instructions_given: json['instructions_given'],
        safety_equipments: json['safety_equipments'],
        safe_procedure_observed: json['safe_procedure_observed'],
        unsafe_condition_contributed: json['unsafe_condition_contributed'],
        unsafe_act_cause: json['unsafe_act_cause'],
        is_investigation_required: json['is_investigation_required'],
        is_why_why_required: json['is_why_why_required'],
        lstHistory: json["lstHistory"] != null
            ? List<ListHistory>.from(
                json["lstHistory"].map((x) => ListHistory.fromJson(x)))
            : [],
        why_why_analysis: json['why_why_analysis'] != null
            ? List<WhyWhyAnalysisUpdate>.from(json["why_why_analysis"]
                ?.map((x) => WhyWhyAnalysisUpdate.fromJson(x)))
            : [],
        root_cause: json['root_cause'] != null
            ? List<RootCauseUpdate>.from(
                json["root_cause"]?.map((x) => RootCauseUpdate.fromJson(x)))
            : [],
        immediate_correction: json['immediate_correction'] != null
            ? List<ImmediateCorrectionUpdate>.from(json["immediate_correction"]
                ?.map((x) => ImmediateCorrectionUpdate.fromJson(x)))
            : [],
        proposed_action_plan: json['proposed_action_plan'] != null
            ? List<ProposedActionPlanUpdate>.from(json["proposed_action_plan"]
                ?.map((x) => ProposedActionPlanUpdate.fromJson(x)))
            : [],
        investigation_team: json["investigation_team"] != null
            ? List<InvestigationTeamUpdate>.from(json["investigation_team"]
                ?.map((x) => InvestigationTeamUpdate.fromJson(x)))
            : [],
        injured_person: json['injured_person'] != null
            ? List<DetailsOfInjuredPersonUpdate>.from(json["injured_person"]
                ?.map((x) => DetailsOfInjuredPersonUpdate.fromJson(x)))
            : [],
        Otherinjured_person: json['other_injured'] != null
            ? List<DetailsOfOtherInjuredPersonUpdate>.from(json["other_injured"]
                ?.map((x) => DetailsOfOtherInjuredPersonUpdate.fromJson(x)))
            : [],
        fileList: json['file_list'] != null
            ? List<FileList>.from(
                json["file_list"]?.map((x) => FileList.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "facility_id": facility_id,
        "facility_name": facility_name,
        "block_id": block_id,
        "block_name": block_name,
        "is_person_involved": is_person_involved,
        "equipment_id": equipment_id,
        "equipment_name": equipment_name,
        "risk_level": risk_level,
        "risk_level_name": risk_level_name,
        "updated_by_name": updated_by_name,
        "created_by_name": created_by_name,
        "created_by_id": created_by_id,
        "incident_datetime": incident_datetime?.toIso8601String(),
        "reporting_datetime": reporting_datetime?.toIso8601String(),
        "victim_id": victim_id,
        "victim_name": victim_name,
        "action_taken_by": action_taken_by,
        "action_taken_by_name": action_taken_by_name,
        "action_taken_datetime": action_taken_datetime?.toIso8601String(),
        "inverstigated_by": inverstigated_by,
        "inverstigated_by_name": inverstigated_by_name,
        "verified_by": verified_by,
        "verified_by_name": verified_by_name,
        "risk_type": risk_type,
        "risk_type_name": risk_type_name,
        "esi_applicability": esi_applicability,
        "esi_applicability_name": esi_applicability_name,
        "legal_applicability": legal_applicability,
        "legal_applicability_name": legal_applicability_name,
        "rca_required": rca_required,
        "rca_required_name": rca_required_name,
        "damaged_cost": damaged_cost,
        "generation_loss": generation_loss,
        "job_id": job_id,
        "job_name": job_name,
        "title": title,
        "description": description,
        "is_insurance_applicable": is_insurance_applicable,
        "is_insurance_applicable_name": is_insurance_applicable_name,
        "insurance_name": insurance_name,
        "insurance_status": insurance_status,
        "insurance_status_name": insurance_status_name,
        "insurance_remark": insurance_remark,
        "approved_by": approved_by,
        "approved_by_name": approved_by_name,
        "status": status,
        "historyId": historyId,
        "status_name": status_name,
        "approved_at": approved_at?.toIso8601String(),
        "status_short": status_short,
        "status_long": status_long,
        "severity": severity,
        "reject_comment": reject_comment,
        "esi_applicability_remark": esi_applicability_remark,
        "legal_applicability_remark": legal_applicability_remark,
        "location_of_incident": location_of_incident,
        "type_of_job": type_of_job,
        "is_activities_trained": is_activities_trained,
        "is_person_authorized": is_person_authorized,
        "instructions_given": instructions_given,
        "safety_equipments": safety_equipments,
        "safe_procedure_observed": safe_procedure_observed,
        "unsafe_condition_contributed": unsafe_condition_contributed,
        "unsafe_act_cause": unsafe_act_cause,
        "is_why_why_required": is_why_why_required,
        "is_investigation_required": is_investigation_required,
        "lstHistory": List<dynamic>.from(lstHistory!.map((x) => x)),
        "why_why_analysis": List<dynamic>.from(why_why_analysis!.map((x) => x)),
        "root_cause": List<dynamic>.from(root_cause!.map((x) => x)),
        "immediate_correction":
            List<dynamic>.from(immediate_correction!.map((x) => x)),
        "proposed_action_plan":
            List<dynamic>.from(proposed_action_plan!.map((x) => x)),
        "investigation_team":
            List<dynamic>.from(investigation_team!.map((x) => x)),
        "injured_person": List<dynamic>.from(injured_person!.map((x) => x)),
        "Otherinjured_person":
            List<dynamic>.from(Otherinjured_person!.map((x) => x)),
        "file_list": List<dynamic>.from(fileList!.map((x) => x)),

        // "externalEmails": List<dynamic>.from(externalEmails!.map((x) => x)),
        // "supplierActions": List<dynamic>.from(supplierActions!.map((x) => x)),
      };
}

///Details of Injured Person
class DetailsOfInjuredPersonUpdate {
  DetailsOfInjuredPersonUpdate({
    this.incidents_id,
    this.name,
    this.person_type,
    this.age,
    this.sex,
    this.gender,
    this.designation,
    this.address,
    this.name_contractor,
    this.body_part_and_nature_of_injury,
    this.work_experience_years,
    this.plant_equipment_involved,
    this.location_of_incident,
    this.injured_item_id,
  });

  int? incidents_id;
  int? injured_item_id;
  String? name;
  int? person_type;
  int? age;
  String? sex;
  String? gender;
  String? designation;
  String? address;
  String? name_contractor;
  String? body_part_and_nature_of_injury;
  int? work_experience_years;
  String? plant_equipment_involved;
  String? location_of_incident;

  factory DetailsOfInjuredPersonUpdate.fromJson(Map<String, dynamic> json) =>
      DetailsOfInjuredPersonUpdate(
        injured_item_id: json["injured_item_id"],
        incidents_id: json['incidents_id'],
        name: json['name'],
        person_type: json['person_type'],
        age: json['age'],
        sex: json['sex'],
        gender: json['gender_name'],
        designation: json['designation'],
        address: json['address'],
        name_contractor: json["name_contractor"],
        body_part_and_nature_of_injury: json['body_part_and_nature_of_injury'],
        work_experience_years: json['work_experience_years'],
        plant_equipment_involved: json['plant_equipment_involved'],
        location_of_incident: json['location_of_incident'],
      );

  Map<String, dynamic> toJson() => {
        "injured_item_id": injured_item_id,
        "incidents_id": incidents_id,
        "name": name,
        "person_type": person_type,
        "age": age,
        "sex": sex,
        "gender_name": gender,
        "designation": designation,
        "address": address,
        "name_contractor": name_contractor,
        "body_part_and_nature_of_injury": body_part_and_nature_of_injury,
        "work_experience_years": work_experience_years,
        "plant_equipment_involved": plant_equipment_involved,
        "location_of_incident": location_of_incident
      };
}

// Details Of Other injured Person
class DetailsOfOtherInjuredPersonUpdate {
  DetailsOfOtherInjuredPersonUpdate(
      {this.incidents_id,
      this.name,
      this.person_type,
      this.age,
      this.sex,
      this.gender,
      this.designation,
      this.address,
      this.injured_item_id,
      this.name_contractor,
      this.body_part_and_nature_of_injury,
      this.work_experience_years,
      this.plant_equipment_involved,
      this.location_of_incident});

  int? incidents_id;
  String? name;
  int? person_type;
  int? age;
  String? sex;
  String? gender;
  String? designation;
  String? address;
  String? name_contractor;
  String? body_part_and_nature_of_injury;
  int? work_experience_years;
  String? plant_equipment_involved;
  String? location_of_incident;
  int? injured_item_id;
  factory DetailsOfOtherInjuredPersonUpdate.fromJson(
          Map<String, dynamic> json) =>
      DetailsOfOtherInjuredPersonUpdate(
        incidents_id: json['incidents_id'],
        name: json['name'],
        injured_item_id: json['injured_item_id'],
        person_type: json['person_type'],
        age: json['age'],
        sex: json['sex'],
        gender: json['gender_name'],
        designation: json['designation'],
        address: json['address'],
        name_contractor: json["name_contractor"],
        body_part_and_nature_of_injury: json['body_part_and_nature_of_injury'],
        work_experience_years: json['work_experience_years'],
        plant_equipment_involved: json['plant_equipment_involved'],
        location_of_incident: json['location_of_incident'],
      );

  Map<String, dynamic> toJson() => {
        "incidents_id": incidents_id,
        "name": name,
        "injured_item_id": injured_item_id,
        "person_type": person_type,
        "age": age,
        "sex": sex,
        "gender_name": gender,
        "designation": designation,
        "address": address,
        "name_contractor": name_contractor,
        "body_part_and_nature_of_injury": body_part_and_nature_of_injury,
        "work_experience_years": work_experience_years,
        "plant_equipment_involved": plant_equipment_involved,
        "location_of_incident": location_of_incident
      };
}

//Investigation team
class InvestigationTeamUpdate {
  InvestigationTeamUpdate({
    this.srNumber,
    this.person_id,
    this.name,
    this.designation,
    this.person_type,
    this.investigation_date,
    this.investigation_item_id,
  });

  String? srNumber;
  String? person_id;
  int? person_type;
  String? name;
  String? designation;
  String? investigation_date;
  int? investigation_item_id;
  factory InvestigationTeamUpdate.fromJson(Map<String, dynamic> json) =>
      InvestigationTeamUpdate(
          srNumber: json['srNumber'],
          person_id: json['person_id'],
          person_type: json['person_type'],
          name: json["name"],
          designation: json['designation'],
          investigation_item_id: json['investigation_item_id'],
          investigation_date: json['investigation_date']);

  Map<String, dynamic> toJson() => {
        "srNumber": srNumber,
        "person_id": person_id,
        "person_type": person_type,
        "investigation_item_id": investigation_item_id,
        "name": name,
        "designation": designation,
        "investigation_date": investigation_date
      };
}

class FileList {
  int? id;
  String? fileName;
  String? description;

  FileList({this.id, this.fileName, this.description});

  factory FileList.fromJson(Map<String, dynamic> json) => FileList(
        id: json['id'],
        fileName: json['fileName'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fileName": fileName,
        "description": description,
      };
}

///Proposed Action Plan
class ProposedActionPlanUpdate {
  ProposedActionPlanUpdate({
    this.proposed_item_id,
    this.incidents_id,
    this.actions_as_per_plan,
    this.responsibility,
    this.target_date,
    this.remarks,
    this.hse_remark,
    this.id_Status,
    this.status_name,
  });
  int? proposed_item_id;
  int? incidents_id;
  String? actions_as_per_plan;
  String? responsibility;
  String? target_date;
  String? remarks;
  String? hse_remark;
  int? id_Status;
  String? status_name;

  factory ProposedActionPlanUpdate.fromJson(Map<String, dynamic> json) =>
      ProposedActionPlanUpdate(
        proposed_item_id: json['proposed_item_id'],
        incidents_id: json['incidents_id'],
        actions_as_per_plan: json['actions_as_per_plan'],
        responsibility: json['responsibility'],
        target_date: json['target_date'],
        remarks: json["remarks"],
        hse_remark: json["hse_remark"],
        id_Status: json["id_Status"],
        status_name: json["status_name"],
      );

  Map<String, dynamic> toJson() => {
        "proposed_item_id": proposed_item_id,
        "incidents_id": incidents_id,
        "actions_as_per_plan": actions_as_per_plan,
        "responsibility": responsibility,
        "target_date": target_date,
        "remarks": remarks,
        "hse_remark": hse_remark,
        "id_Status": id_Status,
        "status_name": status_name,
      };
}

///why wy analysis
class WhyWhyAnalysisUpdate {
  WhyWhyAnalysisUpdate({
    this.incidents_id,
    this.why_item_id,
    this.why,
    this.cause,
  });

  int? incidents_id;
  int? why_item_id;
  String? why;
  String? cause;

  factory WhyWhyAnalysisUpdate.fromJson(Map<String, dynamic> json) =>
      WhyWhyAnalysisUpdate(
        incidents_id: json['incidents_id'],
        why_item_id: json['why_item_id'],
        why: json['why'],
        cause: json["cause"],
      );

  Map<String, dynamic> toJson() => {
        "incidents_id": incidents_id,
        "why_item_id": why_item_id,
        "why": why,
        "cause": cause,
      };
}

///Root cause
class RootCauseUpdate {
  RootCauseUpdate({
    this.root_item_id,
    this.incidents_id,
    this.cause,
  });

  int? root_item_id;
  int? incidents_id;
  String? cause;

  factory RootCauseUpdate.fromJson(Map<String, dynamic> json) =>
      RootCauseUpdate(
        root_item_id: json['root_item_id'],
        incidents_id: json['incidents_id'],
        cause: json["cause"],
      );

  Map<String, dynamic> toJson() => {
        "root_item_id": root_item_id,
        "incidents_id": incidents_id,
        "cause": cause,
      };
}

///Imediate correction
class ImmediateCorrectionUpdate {
  ImmediateCorrectionUpdate({
    this.incidents_id,
    this.ic_item_id,
    this.details,
  });

  int? incidents_id;
  String? details;
  int? ic_item_id;

  factory ImmediateCorrectionUpdate.fromJson(Map<String, dynamic> json) =>
      ImmediateCorrectionUpdate(
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

class ListHistory {
  ListHistory({
    this.moduleRefId,
    this.moduleType,
    this.comment,
  });
  int? moduleRefId;
  int? moduleType;
  String? comment;

  factory ListHistory.fromJson(Map<String, dynamic> json) => ListHistory(
        moduleRefId: json['moduleRefId'],
        moduleType: json["moduleType"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "moduleRefId": moduleRefId,
        "moduleType": moduleType,
        "comment": comment,
      };
}

// class SuppliersActionsList {
//   SuppliersActionsList({
//     this.name,
//     this.is_required,
//     this.required_by_date,
//   });

//   String? name;
//   int? is_required;
//   String? required_by_date;

//   factory SuppliersActionsList.fromJson(Map<String, dynamic> json) =>
//       SuppliersActionsList(
//         name: json["name"],
//         is_required: json["is_required"],
//         required_by_date: json["required_by_date"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "is_required": is_required,
//         "required_by_date": required_by_date,
//       };
// }

String listHistoryToJson(ListHistory data) => json.encode(data.toJson());
// String additionalEmailEmployeesListToJson(AdditionalEmailsEmployeesList data) =>
//     json.encode(data.toJson());
// String addSuppliersActionsListToJson(SuppliersActionsList data) =>
//     json.encode(data.toJson());
