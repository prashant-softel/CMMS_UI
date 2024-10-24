import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<GetObservationList> getObservationListModelFromJson(String str) =>
    List<GetObservationList>.from(
        json.decode(str).map(GetObservationList.fromJson));

String getObservationListModelToJson(List<GetObservationList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetObservationList {
  int? id;
  int? check_point_type_id;
  int? facility_id;
  String? operator_name;
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
  int? remaining_days; 
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
    this.check_point_type_id,
    this.facility_id,
    this.operator_name,
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
    check_point_type_id: json['check_point_type_id'],
    facility_id: json['facility_id'],
    operator_name: json['operator_name'] != null ? json['operator_name'] as String : '', // Explicit null check
    risk_type_id: json['risk_type_id'],
    risk_type: json['risk_type'] != null ? json['risk_type'] as String : '',
    preventive_action: json['preventive_action'] != null ? json['preventive_action'] as String : '',
    assigned_to_id: json['assigned_to_id'],
    assigned_to_name: json['assigned_to_name'] != null ? json['assigned_to_name'] as String : '',
    contact_number: json['contact_number'] != null ? json['contact_number'] as String : '',
    cost_type: json['cost_type'],
    cost_name: json['cost_name'] != null ? json['cost_name'] as String : '',
    closed_date: json['closed_date'] != null
        ? Utility.getFormatedyearMonthDay(json['closed_date']) ?? ''
        : '', // Handle null case in Utility method
    observation_status: json['observation_status'] != null ? json['observation_status'] as String : '',
    date_of_observation: json['date_of_observation'] != null ? json['date_of_observation'] as String : '',
    type_of_observation: json['type_of_observation'],
    closer_date: json['closer_date'] != null
        ? Utility.getFormatedyearMonthDay(json['closer_date']) ?? ''
        : '',
    location_of_observation: json['location_of_observation'] != null ? json['location_of_observation'] as String : '',
    remaining_days: json['remaining_days'] ?? 0, // Default to 0 if null
    source_of_observation: json['source_of_observation'],
    target_date: json['target_date'] != null
        ? Utility.getFormatedyearMonthDay(json['target_date']) ?? ''
        : '',
    corrective_action: json['corrective_action'] != null ? json['corrective_action'] as String : '',
    observation_description: json['observation_description'] != null ? json['observation_description'] as String : '',
    type_of_observation_name: json['type_of_observation_name'] != null ? json['type_of_observation_name'] as String : '',
    source_of_observation_name: json['source_of_observation_name'] != null ? json['source_of_observation_name'] as String : '',
    created_at: json['created_at'] != null ? json['created_at'] as String : '',
    created_by: json['created_by'] != null ? json['created_by'] as String : '',
    updated_at: json['updated_at'] != null ? json['updated_at'] as String : '',
    updated_by: json['updated_by'] != null ? json['updated_by'] as String : '',
    action_taken: json['action_taken'] != null ? json['action_taken'] as String : '',
    month_of_observation: json['month_of_observation'] != null ? json['month_of_observation'] as String : '',
    status_code: json['status_code'],
    createdid: json['createdid'],
    updateid: json['updateid'],
    short_status: json['short_status'] != null ? json['short_status'] as String : '',
    uploadfileIds: json['uploadfileIds'] != null ? json['uploadfileIds'] as String : '',
    comment: json['comment'] != null ? json['comment'] as String : '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'check_point_type_id': check_point_type_id,
        'facility_id': facility_id,
        'operator_name': operator_name,
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
