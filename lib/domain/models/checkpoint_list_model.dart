import 'dart:convert';

List<CheckPointModel> checkPointModelFromJson(String str) =>
    List<CheckPointModel>.from(
        json.decode(str).map((x) => CheckPointModel.fromJson(x)));

String checkPointModelToJson(List<CheckPointModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CheckPointModel {
  int? id;
  String? check_point;
  int? checklist_id;
  String? checklist_name;
  String? requirement;
  int? is_document_required;
  int? created_by_id;
  String? created_by_name;
  int? status;
  int? updated_by_id;

  String? action_to_be_done;
  int? failure_weightage;
  String? checkpoint_type;
  dynamic min;
  dynamic max;
  String? type_of_observation;
  String? risk_type;
  int? cost_Type;
  String? cost_type_name;

  String? created_at;

  dynamic updated_by_name;
  dynamic updated_at;

  CheckPointModel(
      {this.id,
      this.check_point,
      this.checklist_id,
      this.checklist_name,
      this.created_by_id,
      this.created_by_name,
      this.requirement,
      this.updated_by_id,
      this.is_document_required,
      this.status,
      this.action_to_be_done,
      this.checkpoint_type,
      this.created_at,
      this.failure_weightage,
      this.max,
      this.min,
      this.updated_at,
      this.updated_by_name,
      this.type_of_observation,
      this.risk_type,
      this.cost_Type,
      this.cost_type_name,
      });

  factory CheckPointModel.fromJson(Map<String, dynamic> json) =>
      CheckPointModel(
        id: json['id'],
        action_to_be_done: json['action_to_be_done'],
        checkpoint_type: json['checkpoint_type'],
        created_at: json['created_at'],
        failure_weightage: json['failure_weightage'],
        max: json['max'],
        min: json['min'],
        updated_at: json['updated_at'],
        updated_by_name: json['updated_by_name'],
        check_point: json['check_point'],
        checklist_id: json['checklist_id'],
        checklist_name: json['checklist_name'],
        created_by_id: json['created_by_id'],
        created_by_name: json['created_by_name'],
        is_document_required: json['is_document_required'],
        requirement: json['requirement'],
        updated_by_id: json['updated_by_id'],
        status: json['status'],
        type_of_observation: json['type_of_observation'],
        risk_type: json['risk_type'],
        cost_Type: json['cost_Type'],
        cost_type_name: json['cost_type_name'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "action_to_be_done": action_to_be_done,
        "checkpoint_type": checkpoint_type,
        "created_at": created_at,
        "failure_weightage": failure_weightage,
        "max": max,
        "min": min,
        "updated_at": updated_at,
        "updated_by_name": updated_by_name,
        "check_point": check_point,
        "checklist_id": checklist_id,
        "checklist_name": checklist_name,
        "created_by_id": created_by_id,
        "created_by_name": created_by_name,
        "is_document_required": is_document_required,
        "requirement": requirement,
        "updated_by_id": updated_by_id,
        "status": status,
        "type_of_observation": type_of_observation,
        "risk_type": risk_type,
        "cost_Type": cost_Type,
        "cost_type_name": cost_type_name,
      };
}
