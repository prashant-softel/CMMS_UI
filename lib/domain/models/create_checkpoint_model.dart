class CreateCheckpoint {
  String check_point;
  int checklist_id;
  String requirement;
  int is_document_required;
  int status;
  int? type;
  int id;
  CheckpointType? checkpoint_type;
  int failure_weightage;
  int?type_of_observation;
  int? risk_type;
  int? cost_type;
  CreateCheckpoint(
      {required this.check_point,
      required this.checklist_id,
      required this.status,
      required this.requirement,
      required this.id,
      required this.failure_weightage,
      required this.is_document_required,
      this.checkpoint_type,
      this.type,
      this.type_of_observation,
      this.risk_type,
      this.cost_type
      });

  factory CreateCheckpoint.fromJson(Map<String, dynamic> json) =>
      CreateCheckpoint(
        check_point: json['check_point'],
        checklist_id: json['checklist_id'],
        status: json['status'],
        requirement: json['requirement'],
        checkpoint_type: CheckpointType.fromJson(json['checkpoint_type']),
        failure_weightage: json['failure_weightage'],
        id: json['id'],
        type: json['type'],
        is_document_required: json['is_document_required'],
        type_of_observation: json['type_of_observation'],
        risk_type: json['risk_type'],
        cost_type: json['cost_type'],
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
        'type': type,
        'type_of_observation': type_of_observation,
        'risk_type': risk_type,
        'cost_type': cost_type,

      };
}

class CheckpointType {
  int? id;
  dynamic min;
  dynamic max;

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
