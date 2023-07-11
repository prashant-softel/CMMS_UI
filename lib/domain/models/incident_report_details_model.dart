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
    this.approved_at,
    this.status_short,
    this.status_long,
    this.severity,
    this.reject_comment,
    this.lstHistory,


    
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
  String? victim_name;
  int? action_taken_by;
  String? action_taken_by_name;
  DateTime? action_taken_datetime;
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
  List<ListHistory?>? lstHistory;



  
  // List<ExternalsEmailsList?>? externalEmails;
  // List<SuppliersActionsList?>? supplierActions;

  factory IncidentReportDetailsModel.fromJson(Map<String, dynamic> json) =>
      IncidentReportDetailsModel(
        id: json["id"],
        facility_id: json["facility_id"],
        facility_name: json["facility_name"],
        block_id: json['block_id'],
        block_name: json['block_name'] ?? '',
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
        lstHistory: json["lstHistory"] != null
          ? List<ListHistory>.from(json["lstHistory"].map((x) => ListHistory.fromJson(x)))
          : [],

       

        // externalEmails: json["externalEmails"] != null
        //     ? List<ExternalsEmailsList>.from(json["externalEmails"]
        //         ?.map((x) => ExternalsEmailsList.fromJson(x)))
        //     : [],

        // supplierActions: json["supplierActions"] != null
        //     ? List<SuppliersActionsList>.from(json["supplierActions"]
        //         ?.map((x) => SuppliersActionsList.fromJson(x)))
        //     : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "facility_id": facility_id,
         "facility_name": facility_name,
        "block_id": block_id,
        "block_name": block_name,
        "equipment_id": equipment_id,
        "equipment_name": equipment_name,
        "risk_level": risk_level,
        "risk_level_name": risk_level_name,
        "updated_by_name": updated_by_name,
        "created_by_name": created_by_name,
        "created_by_id": created_by_id,
        "incident_datetime": incident_datetime?.toIso8601String(),
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
        "lstHistory": List<dynamic>.from(lstHistory!.map((x) => x)),

       
       
        // "externalEmails": List<dynamic>.from(externalEmails!.map((x) => x)),
        // "supplierActions": List<dynamic>.from(supplierActions!.map((x) => x)),
      };
}

// class ExternalsEmailsList {
//   ExternalsEmailsList({
//     this.name,
//     this.email,
//   });

//   String? name;
//   String? email;

//   factory ExternalsEmailsList.fromJson(Map<String, dynamic> json) =>
//       ExternalsEmailsList(
//         name: json["name"],
//         email: json["email"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "email": email,
//       };
// }

class ListHistory {
  ListHistory({
    this.moduleRefId,
    this.moduleType,
    this.comment,
  });
  int? moduleRefId;
  int? moduleType;
  String? comment;

  factory ListHistory.fromJson(Map<String, dynamic> json) =>
      ListHistory(
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

String listHistoryToJson(ListHistory data) =>
    json.encode(data.toJson());
// String additionalEmailEmployeesListToJson(AdditionalEmailsEmployeesList data) =>
//     json.encode(data.toJson());
// String addSuppliersActionsListToJson(SuppliersActionsList data) =>
//     json.encode(data.toJson());
