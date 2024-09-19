import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<GetObservationList> getObservationListModelFromJson(String str) =>
    List<GetObservationList>.from(
        json.decode(str).map(GetObservationList.fromJson));

String getObservationListModelToJson(List<GetObservationList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetObservationList {
  int? id;
  int? observation_type;
  int? facility_id;
  String? contractor_name;
  int? risk_type_id;
  String? risk_type;
  String? preventive_action;
  int? assigned_to_id;
  String? assigned_to_name;
  String? contact_number;
  int? cost_type;
  String? cost_name;
  String? closed_date;
  String? observation_status;
  String? date_of_observation;
  int? type_of_observation;
  String? closer_date;
  String? location_of_observation;
  String? remaining_days; // Update this to String? to match the error
  int? source_of_observation;
  String? target_date;
  String? corrective_action;
  String? observation_description;
  String? type_of_observation_name;
  String? source_of_observation_name;
  String? created_at;
  String? created_by;
  String? updated_at;
  String? updated_by;
  String? action_taken;
  String? month_of_observation;
  int? status_code;
  int? createdid;
  int? updateid;
  String? short_status;
  String? uploadfileIds;
  String? comment;

  GetObservationList({
    this.id,
    this.observation_type,
    this.facility_id,
    this.contractor_name,
    this.risk_type_id,
    this.risk_type,
    this.preventive_action,
    this.assigned_to_id,
    this.assigned_to_name,
    this.contact_number,
    this.cost_type,
    this.cost_name,
    this.closed_date,
    this.observation_status,
    this.date_of_observation,
    this.type_of_observation,
    this.closer_date,
    this.location_of_observation,
    this.remaining_days, // Corrected to String?
    this.source_of_observation,
    this.target_date,
    this.corrective_action,
    this.observation_description,
    this.type_of_observation_name,
    this.source_of_observation_name,
    this.created_at,
    this.created_by,
    this.updated_at,
    this.updated_by,
    this.action_taken,
    this.month_of_observation,
    this.status_code,
    this.createdid,
    this.updateid,
    this.short_status,
    this.uploadfileIds,
    this.comment,
  });

  factory GetObservationList.fromJson(Map<String, dynamic> json) {
    return GetObservationList(
      
      id: json['id'],
      observation_type: json['observation_type'],
      facility_id: json['facility_id'],
      contractor_name: json['contractor_name'] ?? '',
      risk_type_id: json['risk_type_id'],
      risk_type: json['risk_type'] ?? '',
      preventive_action: json['preventive_action'] ?? '',
      assigned_to_id: json['assigned_to_id'],
      assigned_to_name: json['assigned_to_name'] ?? '',
      contact_number: json['contact_number'] ?? '',
      cost_type: json['cost_type'],
      cost_name: json['cost_name'] ?? '',
      // closed_date: json['closed_date'] ?? '',
      closed_date: Utility.getFormatedyearMonthDay(json['closed_date']),
      observation_status: json['observation_status'] ?? '',
      date_of_observation: json['date_of_observation'] ?? '',
      type_of_observation: json['type_of_observation'],
      closer_date: json['closer_date'] ?? '',
       
      location_of_observation: json['location_of_observation'] ?? '',
      remaining_days: json['remaining_days'] != null
          ? json['remaining_days'].toString() // Convert int to String
          : null, // Handle null case
      source_of_observation: json['source_of_observation'],
      // target_date: json['target_date'] ?? '',
      target_date: Utility.getFormatedyearMonthDay(json['target_date']),
      corrective_action: json['corrective_action'] ?? '',
      observation_description: json['observation_description'] ?? '',
      type_of_observation_name: json['type_of_observation_name'] ?? '',
      source_of_observation_name: json['source_of_observation_name'] ?? '',
      created_at: json['created_at'] ?? '',
      created_by: json['created_by'] ?? '',
      updated_at: json['updated_at'],
      updated_by: json['updated_by'],
      action_taken: json['action_taken'] ?? '',
      month_of_observation: json['month_of_observation'] ?? '',
      status_code: json['status_code'],
      createdid: json['createdid'],
      updateid: json['updateid'],
      short_status: json['short_status'] ?? '',
      uploadfileIds: json['uploadfileIds'],
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'observation_type': observation_type,
        'facility_id': facility_id,
        'contractor_name': contractor_name,
        'risk_type_id': risk_type_id,
        'risk_type': risk_type,
        'preventive_action': preventive_action,
        'assigned_to_id': assigned_to_id,
        'assigned_to_name': assigned_to_name,
        'contact_number': contact_number,
        'cost_type': cost_type,
        'cost_name': cost_name,
        'closed_date': closed_date,
        'observation_status': observation_status,
        'date_of_observation': date_of_observation,
        'type_of_observation': type_of_observation,
        'closer_date': closer_date,
        'location_of_observation': location_of_observation,
        'remaining_days': remaining_days, // Now String
        'source_of_observation': source_of_observation,
        'target_date': target_date,
        'corrective_action': corrective_action,
        'observation_description': observation_description,
        'type_of_observation_name': type_of_observation_name,
        'source_of_observation_name': source_of_observation_name,
        'created_at': created_at,
        'created_by': created_by,
        'updated_at': updated_at,
        'updated_by': updated_by,
        'action_taken': action_taken,
        'month_of_observation': month_of_observation,
        'status_code': status_code,
        'createdid': createdid,
        'updateid': updateid,
        'short_status': short_status,
        'uploadfileIds': uploadfileIds,
        'comment': comment,
      };
}
