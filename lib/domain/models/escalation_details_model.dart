import 'dart:convert';

List<EscalationDetails> EscalationDetailsFromJson(String str) =>
    List<EscalationDetails>.from(
      json.decode(str).map(
            (x) => EscalationDetails.fromJson(x),
          ),
    );

String EscalationDetailsToJson(List<EscalationDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EscalationDetails {
  int? module_id;
  String? module_name;
  List<StatusEscalation>? status_escalation;

  EscalationDetails({
    this.module_id,
    this.module_name,
    this.status_escalation,
  });

  factory EscalationDetails.fromJson(Map<String, dynamic> json) =>
      EscalationDetails(
        module_id: json['module_id'],
        module_name: json['module_name'],
        status_escalation: json['status_escalation'] == null
            ? null
            : List<StatusEscalation>.from(json['status_escalation'].map(
                (x) => StatusEscalation.fromJson(x),
              )),
      );

  Map<String, dynamic> toJson() => {
        'module_id': module_id,
        'module_name': module_name,
        'status_escalation': status_escalation == null
            ? null
            : List<dynamic>.from(
                status_escalation!.map((x) => x.toJson()),
              ),
      };
}

class StatusEscalation {
  int? status_id;
  String? status_name;
  List<EscalationDetail>? escalation;

  StatusEscalation({
    this.status_id,
    this.status_name,
    this.escalation,
  });

  factory StatusEscalation.fromJson(Map<String, dynamic> json) =>
      StatusEscalation(
        status_id: json['status_id'],
        status_name: json['status_name'],
        escalation: json['escalation'] == null
            ? null
            : List<EscalationDetail>.from(json['escalation'].map(
                (x) => EscalationDetail.fromJson(x),
              )),
      );

  Map<String, dynamic> toJson() => {
        'status_id': status_id,
        'status_name': status_name,
        'escalation': escalation == null
            ? null
            : List<dynamic>.from(escalation!.map((x) => x.toJson())),
      };
}

class EscalationDetail {
  int? days;
  int? role_id;
  String? role_name;

  EscalationDetail({
    this.days,
    this.role_id,
    this.role_name,
  });

  factory EscalationDetail.fromJson(Map<String, dynamic> json) => EscalationDetail(
        days: json['days'],
        role_id: json['role_id'],
        role_name: json['role_name'],
      );

  Map<String, dynamic> toJson() => {
        'days': days,
        'role_id': role_id,
        'role_name': role_name,
      };
}
