import 'dart:convert';

CreateObsModel createObsModelFromJson(String str) =>
    CreateObsModel.fromJson(json.decode(str));

class CreateObsModel {
  int? id;
  int? facility_id;
  String? contractor_name;
  int? risk_type_id;
  String? preventive_action;
  int? assigned_to_id;

  String? contact_number;

  int? cost_type;
  String? date_of_observation;
  int? type_of_observation;
  String? location_of_observation;
  int? source_of_observation;
  String? target_date;
  String? observation_description;
  dynamic uploadfileIds;

  CreateObsModel({
    this.id,
    this.facility_id,
    this.contractor_name,
    this.risk_type_id,
    this.preventive_action,
    this.assigned_to_id,
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
      id: json['id'],
      facility_id: json['facility_id'],
      contractor_name: json['contractor_name'],
      risk_type_id: json['risk_type_id'],
      preventive_action: json['preventive_action'],
      assigned_to_id: json['assigned_to_id'],
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
        "id": id,
        "facility_id": facility_id,
        "contractor_name": contractor_name,
        "risk_type_id": risk_type_id,
        "preventive_action": preventive_action,
        "assigned_to_id": assigned_to_id,
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
