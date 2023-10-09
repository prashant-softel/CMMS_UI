class CreateCheckpoint {
  String check_point;
  int checklist_id;
  String requirement;
  int is_document_required;
  int status;
  int id;
  CheckpointType? checkpoint_type;
  int failure_weightage;
  CreateCheckpoint(
      {required this.check_point,
      required this.checklist_id,
      required this.status,
      required this.requirement,
      required this.id,
      required this.failure_weightage,
      required this.is_document_required,
      this.checkpoint_type});

  factory CreateCheckpoint.fromJson(Map<String, dynamic> json) =>
      CreateCheckpoint(
        check_point: json['check_point'],
        checklist_id: json['checklist_id'],
        status: json['status'],
        requirement: json['requirement'],
        checkpoint_type: CheckpointType.fromJson(json['checkpoint_type']),
        failure_weightage: json['failure_weightage'],
        id: json['id'],
        is_document_required: json['is_document_required'],
      );

  Map<String, dynamic> toJson() => {
        'check_point': check_point,
        'checklist_id': checklist_id,
        'status': status,
        'requirement': requirement,
        "failure_weightage": failure_weightage,
        'is_document_required': is_document_required,
        "checkpoint_type": checkpoint_type!.toJson(),
        'id': id,
      };
}

class CheckpointType {
  int? id;
  int? min;
  int? max;

  CheckpointType({this.id, this.max, this.min});

  factory CheckpointType.fromJson(Map<String, dynamic> json) {
    return CheckpointType(id: json['id'], min: json['min'], max: json['max']);
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "max": max,
        "min": min,
      };
}
