import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

GetObservationById getObservationByIdModelFromJson(String str) =>
    GetObservationById.fromJson(json.decode(str));

class GetObservationById {
  int? id;
  int? facility_id;
  String? operator_name;
  int? risk_type_id;
  int? status_code;
  String? risk_type;
  String? preventive_action;
  String? action_taken;
  int? assigned_to_id;
  String? assigned_to_name;
  String? contact_number;
  String? short_status;
  int? cost_type;
  int? createdid;
  int? updateid;
  String? cost_name;
  String? date_of_observation;
  int? type_of_observation;
  String? type_of_observation_name;
  String? location_of_observation;
  int? source_of_observation;
  String? source_of_observation_name;
  String? target_date;
  String? observation_description;
  String? created_at;
  String? created_by;
  String? updated_at;
  String? updated_by;
  List<FileList>? file_list;

  GetObservationById({
    this.id,
    this.facility_id,
    this.operator_name,
    this.risk_type_id,
    this.status_code,
    this.risk_type,
    this.preventive_action,
    this.action_taken,
    this.assigned_to_id,
    this.assigned_to_name,
    this.contact_number,
    this.cost_type,
    this.createdid,
    this.updateid,
    this.cost_name,
    this.short_status,
    this.date_of_observation,
    this.type_of_observation,
    this.type_of_observation_name,
    this.location_of_observation,
    this.source_of_observation,
    this.source_of_observation_name,
    this.target_date,
    this.observation_description,
    this.created_at,
    this.file_list,
    this.created_by,
    this.updated_at,
    this.updated_by,
  });

 factory GetObservationById.fromJson(Map<String, dynamic> json) {
  return GetObservationById(
    id: json['id'],
    status_code: json['status_code'],
    facility_id: json['facility_id'],
    short_status: json['short_status'],
    contact_number: json['contact_number'],
    action_taken: json['action_taken'],
    operator_name: json['operator_name'],
    cost_type: json['cost_type'],
    cost_name: json['cost_name'],
    location_of_observation: json['location_of_observation'],
    date_of_observation: json['date_of_observation'] != null && json['date_of_observation'].isNotEmpty 
        ? Utility.getFormatedyearMonthDay(json['date_of_observation']) 
        : null,
    observation_description: json['observation_description'],
    preventive_action: json['preventive_action'] ?? '',
    assigned_to_id: json['assigned_to_id'],
    assigned_to_name: json['assigned_to_name'] ?? '',
    created_by: json['created_by'],
    updateid: json['updateid'],
    createdid: json['createdid'],
    created_at: json['created_at'] != null && json['created_at'].isNotEmpty 
        ? Utility.getFormatedyearMonthDay(json['created_at']) 
        : null,
    updated_by: json['updated_by'] ?? '',
    updated_at: json['updated_at'] != null && json['updated_at'].isNotEmpty 
        ? Utility.getFormatedyearMonthDay(json['updated_at']) 
        : null,
    risk_type_id: json['risk_type_id'],
    risk_type: json['risk_type'],
    source_of_observation: json['source_of_observation'],
    source_of_observation_name: json['source_of_observation_name'],
    target_date: json['target_date'] != null && json['target_date'].isNotEmpty 
        ? Utility.getFormatedyearMonthDay(json['target_date']) 
        : null,
    file_list: json["fileDetails"] != null
        ? List<FileList>.from(
            json["fileDetails"].map((x) => FileList.fromJson(x)))
        : [],
    type_of_observation: json['type_of_observation'],
    type_of_observation_name: json['type_of_observation_name'],
  );
}

}

class FileList {
  FileList({
    this.id,
    this.fileName,
    this.fileCategory,
    this.fileSize,
    this.status,
    this.description,
  });

  int? id;
  String? fileName;
  String? fileCategory;
  int? fileSize;
  int? status;
  String? description;

  factory FileList.fromJson(Map<String, dynamic> json) => FileList(
        id: json["id"],
        fileName: json["fileName"],
        fileCategory: json['fileCategory'],
        fileSize: json['fileSize'],
        status: json['status'],
        description: json['description'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fileName": fileName,
        "fileCategory": fileCategory,
        "fileSize": fileSize,
        "status": status,
        "description": description,
      };
}