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

  CheckPointModel({
    this.id,
    this.check_point,
    this.checklist_id,
    this.checklist_name,
    this.created_by_id,
    this.created_by_name,
    this.requirement,
    this.updated_by_id,
    this.is_document_required,
    this.status,
   
  });

  factory CheckPointModel.fromJson(Map<String, dynamic> json) =>
      CheckPointModel(
        id: json['id'],
        check_point: json['check_point'],
        checklist_id: json['checklist_id'],
        checklist_name: json['checklist_name'],
        created_by_id: json['created_by_id'],
        created_by_name: json['created_by_name'],
        is_document_required: json['is_document_required'],
        requirement: json['requirement'],
        updated_by_id: json['updated_by_id'],
        status: json['status'],
       
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "check_point": check_point,
        "checklist_id": checklist_id,
        "checklist_name": checklist_name,
        "created_by_id": created_by_id,
        "created_by_name": created_by_name,
        "is_document_required": is_document_required,
        "requirement": requirement,
        "updated_by_id": updated_by_id,
        "status": status,
       
      };
}
