import 'dart:convert';

CreateIncidentReportModel createIncidentReportModelFromJson(String str) =>
    CreateIncidentReportModel.fromJson(json.decode(str));

String createIncidentReportModelToJson(CreateIncidentReportModel data) =>
    json.encode(data.toJson());

class CreateIncidentReportModel {
  int? facility_id;
  int? block_id;
  int? equipment_id;
  int? risk_level;
  String? incident_datetime;
  String? reporting_datetime;
  int? victim_id;
  String? title;
  int? action_taken_by;
  String? action_taken_datetime;
  int? inverstigated_by;
  int? verified_by;
  int? risk_type;
  bool? esi_applicability;
  bool? legal_applicability;
  bool? rca_required;
  int? damaged_cost;
  int? generation_loss;
  int? job_id;
  String? description;
  bool? is_insurance_applicable;
  String? insurance;
  int? insurance_status;
  String? insurance_remark;
  int? id;
  String? severity;
  List<InvestigationTeam?>? investigationTeam;

  CreateIncidentReportModel({
    this.facility_id,
    this.block_id,
    this.equipment_id,
    this.risk_level,
    this.incident_datetime,
    this.reporting_datetime,
    this.victim_id,
    this.title,
    this.action_taken_by,
    this.action_taken_datetime,
    this.inverstigated_by,
    this.verified_by,
    this.risk_type,
    this.esi_applicability,
    this.legal_applicability,
    this.rca_required,
    this.damaged_cost,
    this.generation_loss,
    this.job_id,
    this.description,
    this.is_insurance_applicable,
    this.insurance,
    this.insurance_status,
    this.insurance_remark,
    this.id,
    this.severity,
    this.investigationTeam,
  });

  factory CreateIncidentReportModel.fromJson(Map<String, dynamic> json) =>
      CreateIncidentReportModel(
        facility_id: json["facility_id"],
        block_id: json["block_id"],
        equipment_id: json['equipment_id'],
        risk_level: json['risk_level'],
        incident_datetime: json['incident_datetime'],
        reporting_datetime: json['reporting_datetime'],
        victim_id: json['victim_id'],
        title: json['title'],
        action_taken_by: json['action_taken_by'],
        action_taken_datetime: json['action_taken_datetime'],
        inverstigated_by: json['inverstigated_by'],
        verified_by: json['verified_by'],
        risk_type: json['risk_type'],
        esi_applicability: json['esi_applicability'],
        legal_applicability: json['legal_applicability'],
        rca_required: json['rca_required'],
        damaged_cost: json['damaged_cost'],
        generation_loss: json['generation_loss'],
        job_id: json['job_id'],
        description: json['description'],
        is_insurance_applicable: json['is_insurance_applicable'],
        insurance: json['insurance'],
        insurance_status: json['insurance_status'],
        insurance_remark: json['insurance_remark'],
        id: json['id'],
        severity: json['severity'],
        investigationTeam: json["supplierActions"] != null
            ? List<InvestigationTeam>.from(json["supplierActions"]
                ?.map((x) => InvestigationTeam.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "facility_id": facility_id,
        "block_id": block_id,
        "equipment_id": equipment_id,
        "risk_level": risk_level,
        "incident_datetime": incident_datetime,
        "reporting_datetime": reporting_datetime,
        "victim_id": victim_id,
        "title": title,
        "action_taken_by": action_taken_by,
        "action_taken_datetime": action_taken_datetime,
        "inverstigated_by": inverstigated_by,
        "verified_by": verified_by,
        "risk_type": risk_type,
        "esi_applicability": esi_applicability,
        "legal_applicability": legal_applicability,
        "rca_required": rca_required,
        "damaged_cost": damaged_cost,
        "generation_loss": generation_loss,
        "description": description,
        "is_insurance_applicable": is_insurance_applicable,
        "insurance": insurance,
        "insurance_status": insurance_status,
        "insurance_remark": insurance_remark,
        "id": id,
        "severity": severity,
        "investigationTeam":
            List<dynamic>.from(investigationTeam!.map((x) => x)),
      };
}

class InvestigationTeam {
  InvestigationTeam(
      {this.srNumber,
      this.name,
      // this.is_required,
      // this.required_by_date,

      this.designation});

  String? srNumber;
  String? name;
  // bool? is_required;
  // String? required_by_date;

  String? designation;

  factory InvestigationTeam.fromJson(Map<String, dynamic> json) =>
      InvestigationTeam(
          srNumber: json['srNumber'],
          name: json["name"],
          // is_required: json["is_required"],
          // required_by_date: json["required_by_date"],

          designation: json['designation']);

  Map<String, dynamic> toJson() => {
        "srNumber": srNumber,
        "name": name,
        // "is_required": is_required,
        // "required_by_date": required_by_date,

        "designation": designation
      };
}
