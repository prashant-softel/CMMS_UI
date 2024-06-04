import 'dart:convert';
List<EscalationMatListModel> escalationMatListModelFromJson(String str) =>
    List<EscalationMatListModel>.from(
        json.decode(str).map((x) => EscalationMatListModel.fromJson(x)));

String escalationMatListModelToJson(List<EscalationMatListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EscalationMatListModel {
  int? moduleId;
  String? moduleName;
  int? statusId;
  String? statusName;
  List<Escalation>? escalation;

  EscalationMatListModel(
      {this.moduleId,
      this.moduleName,
      this.statusId,
      this.statusName,
      this.escalation});

  EscalationMatListModel.fromJson(Map<String, dynamic> json) {
    moduleId = json['module_id'];
    moduleName = json['module_name'];
    statusId = json['status_id'];
    statusName = json['status_name'];
    if (json['escalation'] != null) {
      escalation = <Escalation>[];
      json['escalation'].forEach((v) {
        escalation!.add(new Escalation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['module_id'] = this.moduleId;
    data['module_name'] = this.moduleName;
    data['status_id'] = this.statusId;
    data['status_name'] = this.statusName;
    if (this.escalation != null) {
      data['escalation'] = this.escalation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Escalation {
  int? days;
  int? roleId;
  String? roleName;

  Escalation({this.days, this.roleId, this.roleName});

  Escalation.fromJson(Map<String, dynamic> json) {
    days = json['days'];
    roleId = json['role_id'];
    roleName = json['role_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['days'] = this.days;
    data['role_id'] = this.roleId;
    data['role_name'] = this.roleName;
    return data;
  }
}
