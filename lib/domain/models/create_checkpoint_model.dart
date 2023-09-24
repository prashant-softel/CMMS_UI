import 'dart:convert';

// String createCheckPointToJson(List<CreateCheckpoint> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateCheckpoint {
  String check_point;
  int checklist_id;
  String requirement;
  int is_document_required;
  int status;
  int id;

  // "failure_weightage": 10,//In percent
  // "checkpoint_type": {
  // "id": 2, //1 = bool, 2 = renge;
  // "min": 10, // only required if type is 2
  // "max":70// only required if type is 2
  // },
  // "status": 1
  CreateCheckpoint({
    required this.check_point,
    required this.checklist_id,
    required this.status,
    required this.requirement,
    required this.id,
    required this.is_document_required,
  });

  factory CreateCheckpoint.fromJson(Map<String, dynamic> json) =>
      CreateCheckpoint(
        check_point: json['check_point'],
        checklist_id: json['checklist_id'],
        status: json['status'],
        requirement: json['requirement'],
        id: json['id'],
        is_document_required: json['is_document_required'],
      );

  Map<String, dynamic> toJson() => {
        'check_point': check_point,
        'checklist_id': checklist_id,
        'status': status,
        'requirement': requirement,
        'is_document_required': is_document_required,
        'id': id,
      };
}
