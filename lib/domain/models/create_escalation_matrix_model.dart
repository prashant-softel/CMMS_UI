import 'dart:convert';


CreateEscalationMatrixModel createEscalationMatrixModelFromJson(String str) =>
    CreateEscalationMatrixModel.fromJson(json.decode(str));

String createEscalationMatrixModelToJson(CreateEscalationMatrixModel data) =>
    json.encode(data.toJson());

class CreateEscalationMatrixModel {
  int? module_id;
  List<Status_escalation?>? status_escalation;

  CreateEscalationMatrixModel({
    
    this.module_id,
    this.status_escalation,
    
  });

  factory CreateEscalationMatrixModel.fromJson(Map<String, dynamic> json) =>
      CreateEscalationMatrixModel(
        
        module_id: json["module_id"],

        status_escalation: json["status_escalation"]!=null? List<Status_escalation>.from(
            json["status_escalation"]?.map((x) => Status_escalation.fromJson(x))):[],
        
       

      );

  Map<String, dynamic> toJson() => {
              "module_id": module_id,
              "status_escalation": List<dynamic>.from(status_escalation!.map((x) => x)),
        
      };
}


class Status_escalation {
  Status_escalation({
    this.status_id,
    this.escalation,
  });

  int? status_id;
  List<Escalation?>? escalation;

  

  factory Status_escalation.fromJson(Map<String, dynamic> json) => Status_escalation(
        status_id: json["status_id"],
        
         escalation: json["escalation"]!=null? List<Escalation>.from(
            json["escalation"]?.map((x) => Escalation.fromJson(x))):[],
       
      );

  Map<String, dynamic> toJson() => {
        "status_id": status_id,
        "escalation": List<dynamic>.from(escalation!.map((x) => x)),
      };
}

class Escalation {
  Escalation({
    this.days,
    this.role_id,
  });

  int? days;
  int? role_id;
  

  factory Escalation.fromJson(Map<String, dynamic> json) => Escalation(
        days: json["days"],
        role_id: json["role_id"],
       
      );

  Map<String, dynamic> toJson() => {
        "days": days,
        "role_id": role_id,
        
      };
}



String addStatus_escalationToJson(Status_escalation data) => json.encode(data.toJson());
String addEscalationToJson(Escalation data) => json.encode(data.toJson());



