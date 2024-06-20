import 'dart:convert';

CreateObsModel createObsModelFromJson(String str) =>
    CreateObsModel.fromJson(json.decode(str));

class CreateObsModel {
  int? facility_id;
  String? contractor_name;

  int? risk_type_id;
  String? preventive_action;
  String? responsible_person;
  String? contact_number;

  String? cost_type;
  String? date_of_observation;
  int? type_of_observation;
  String? location_of_observation;
  int? source_of_observation;
  String? target_date;
  String? observation_description;
  dynamic uploadfileIds;

  CreateObsModel({
    this.facility_id,
    this.contractor_name,
    this.risk_type_id,
    this.preventive_action,
    this.responsible_person,
    this.contact_number,
    this.cost_type,
    this.date_of_observation,
    this.type_of_observation,
    this.location_of_observation,
    this.source_of_observation,
    this.target_date,
    this.observation_description,
    this.uploadfileIds,
  });

  factory CreateObsModel.fromJson(Map<String, dynamic> json) {
    return CreateObsModel(
      facility_id: json['facility_id'],
      contractor_name: json['contractor_name'],
      risk_type_id: json['risk_type_id'],
      preventive_action: json['preventive_action'],
      responsible_person: json['responsible_person'],
      contact_number: json['contact_number'],
      cost_type: json['cost_type'],
      date_of_observation: json['date_of_observation'],
      type_of_observation: json['type_of_observation'],
      location_of_observation: json['location_of_observation'],
      source_of_observation: json['source_of_observation'],
      target_date: json['target_date'],
      observation_description: json['observation_description'],
      uploadfileIds: json['uploadfileIds'],
    );
  }
  Map<String, dynamic> toJson() => {
        "facility_id": facility_id,
        "contractor_name": contractor_name,
        "risk_type_id": risk_type_id,
        "preventive_action": preventive_action,
        "responsible_person": responsible_person,
        "contact_number": contact_number,
        "cost_type": cost_type,
        "date_of_observation": date_of_observation,
        "type_of_observation": type_of_observation,
        "location_of_observation": location_of_observation,
        "source_of_observation": source_of_observation,
        "target_date": target_date,
        "observation_description": observation_description,
        "uploadfileIds": uploadfileIds,
      };
}