import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<GetObservationList> getObservationListModelFromJson(String str) =>
    List<GetObservationList>.from(
        json.decode(str).map(GetObservationList.fromJson));

String getObservationListModelToJson(List<GetObservationList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetObservationList {
  int? id;
  String? month_of_observation;
  String? date_of_observation;
  String? contractor_name;
  String? location_of_observation;
  String? type_of_observation;
  String? source_of_observation;
  String? risk_type;
  String? observation_description;
  String? corrective_action;
  String? responsible_person;
  String? target_date;
  String? action_taken;
  String? closer_date;
  String? cost_type;
  int? days_remaining;
  String? timeline;
  String? status;

  GetObservationList({
    this.id,
    this.timeline,
    this.days_remaining,
    this.contractor_name,
    this.date_of_observation,
    this.responsible_person,
    this.corrective_action,
    this.risk_type,
    this.type_of_observation,
    this.month_of_observation,
    this.closer_date,
    this.cost_type,
    this.location_of_observation,
    this.source_of_observation,
    this.observation_description,
    this.action_taken,
    this.target_date,
    this.status,
  });

  factory GetObservationList.fromJson(Map<String, dynamic> json) {
    return GetObservationList(
      id: json['id'],
      month_of_observation: json['month_of_observation'],
      date_of_observation:
          Utility.getFormatedyearMonthDay(json['date_of_observation']),
      contractor_name: json['contractor_name'],
      location_of_observation: json['location_of_observation'],
      timeline: json['timeline'],
      days_remaining: json['days_remaining'],
      responsible_person: json['responsible_person'],
      corrective_action: json['corrective_action'],
      risk_type: json['risk_type'],
      type_of_observation: json['type_of_observation'],
      closer_date: Utility.getFormatedyearMonthDay(json['closer_date']),
      cost_type: json['cost_type'],
      source_of_observation: json['source_of_observation'],
      observation_description: json['observation_description'],
      action_taken: json['action_taken'],
      status: json['status'],
      target_date: Utility.getFormatedyearMonthDay(json['target_date']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'month_of_observation': month_of_observation,
        'date_of_observation': date_of_observation,
        'contractor_name': contractor_name,
        'location_of_observation': location_of_observation,
        'type_of_observation': type_of_observation,
        'source_of_observation': source_of_observation,
        'risk_type': risk_type,
        'observation_description': observation_description,
        'corrective_action': corrective_action,
        'responsible_person': responsible_person,
        'target_date': target_date,
        'action_taken': action_taken,
        'closer_date': closer_date,
        'cost_type': cost_type,
        'days_remaining': days_remaining,
        'timeline': timeline,
        'status': status
      };
}
