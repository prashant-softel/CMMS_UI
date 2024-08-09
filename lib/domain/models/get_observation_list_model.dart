import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<GetObservationList> getObservationListModelFromJson(String str) =>
    List<GetObservationList>.from(
        json.decode(str).map(GetObservationList.fromJson));

String getObservationListModelToJson(List<GetObservationList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetObservationList {
  int? id;
  int? facility_id;
  String? contractor_name;
  int? risk_type_id;
  String? risk_type_name;
  String? preventive_action;
  String? responsible_person;
  String? contact_number;
  String? cost_type;
  String? date_of_observation;
  int? type_of_observation;
  int? source_of_observation;

  String? target_date;
  String? observation_description;
  String? created_at;
  String? updated_at;
  String? updated_by;

  String? month_of_observation;
  String? short_status;
  String? observation_status;
  int? status_code;
  String? location_of_observation;
  String? type_of_observation_name;
  String? source_of_observation_name;
  String? corrective_action;
  String? days_remaining;

  String? risk_type;
  String? action_taken;
  String? closer_date;
  String? closed_date;

  GetObservationList({
    this.id,
    this.contractor_name,
    this.date_of_observation,
    this.responsible_person,
    this.type_of_observation,
    this.cost_type,
    this.source_of_observation,
    this.observation_description,
    this.target_date,
    this.contact_number,
    this.created_at,
    this.facility_id,
    this.preventive_action,
    this.risk_type_id,
    this.risk_type_name,
    this.updated_at,
    this.updated_by,
    this.corrective_action,
    this.days_remaining,
    this.location_of_observation,
    this.type_of_observation_name,
    this.source_of_observation_name,
    this.month_of_observation,
    this.short_status,
    this.status_code,
    this.observation_status,
    this.risk_type,
    this.action_taken,
    this.closer_date,
    this.closed_date,
  });

  factory GetObservationList.fromJson(Map<String, dynamic> json) {
    return GetObservationList(
      id: json['id'],
      contractor_name: json['contractor_name'],
      date_of_observation:
          Utility.getFormatedyearMonthDay(json['date_of_observation']),
      responsible_person: json['responsible_person'],
      type_of_observation: json['type_of_observation'],
      cost_type: json['cost_type'],
      source_of_observation: json['source_of_observation'],
      observation_description: json['observation_description'],
      target_date: Utility.getFormatedyearMonthDay(json['target_date']),
      contact_number: json['contact_number'],
      created_at: json['created_at'],
      facility_id: json['facility_id'],
      preventive_action: json['preventive_action'],
      risk_type_id: json['risk_type_id'],
      risk_type_name: json['risk_type_name'],
      updated_at: json['updated_at'],
      updated_by: json['updated_by'],
      corrective_action: json['corrective_action'],
      days_remaining: json['days_remaining'],
      location_of_observation: json['location_of_observation'],
      month_of_observation: json['month_of_observation'],
      short_status: json['short_status'],
      observation_status: json['observation_status'],
      type_of_observation_name: json['type_of_observation_name'],
      source_of_observation_name: json['source_of_observation_name'],
      status_code: json['status_code'],
      risk_type: json['risk_type'],
      action_taken: json['action_taken'],
      closer_date: Utility.getFormatedyearMonthDay(json['closer_date']),
      closed_date: Utility.getFormatedyearMonthDay(json['closed_date']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'contractor_name': contractor_name,
        'date_of_observation': date_of_observation,
        'responsible_person': responsible_person,
        'type_of_observation': type_of_observation,
        'cost_type': cost_type,
        'source_of_observation': source_of_observation,
        'observation_description': observation_description,
        'target_date': target_date,
        'contact_number': contact_number,
        'created_at': created_at,
        'facility_id': facility_id,
        'risk_type_name': risk_type_name,
        'updated_by': updated_by,
        'preventive_action': preventive_action,
        'risk_type_id': risk_type_id,
        'corrective_action': corrective_action,
        'days_remaining': days_remaining,
        'location_of_observation': location_of_observation,
        'month_of_observation': month_of_observation,
        'short_status': short_status,
        'observation_status': observation_status,
        'source_of_observation_name': source_of_observation_name,
        'type_of_observation_name': type_of_observation_name,
        'closed_date': closed_date,
        'status_code': status_code,
      };
}
