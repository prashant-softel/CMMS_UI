import 'dart:convert';

CreateStatutoryModel createSRModelFromJson(String str) =>
    CreateStatutoryModel.fromJson(json.decode(str));

class CreateStatutoryModel {
  int? compliance_id;
  int? facility_id;
  String? expires_on;
  String? issue_date;
  String? Comment;
  int? renewFlag;
  int? status_of_aplication_id;
  String? renew_date;

  CreateStatutoryModel({
    this.facility_id,
    this.expires_on,
    this.issue_date,
    this.compliance_id,
    this.Comment,
    this.renewFlag,
    this.renew_date,
    this.status_of_aplication_id,
  });

  factory CreateStatutoryModel.fromJson(Map<String, dynamic> json) {
    return CreateStatutoryModel(
      facility_id: json['facility_id'],
      expires_on: json['expires_on'],
      issue_date: json['issue_date'],
      compliance_id: json['compliance_id'],
      Comment: json['Comment'],
      renewFlag: json['renewFlag'],
      renew_date: json['renew_date'],
      status_of_aplication_id: json['status_of_aplication_id'],
    );
  }
  Map<String, dynamic> toJson() => {
        "facility_id": facility_id,
        "expires_on": expires_on,
        "issue_date": issue_date,
        "compliance_id": compliance_id,
        "Comment": Comment,
        "renewFlag": renewFlag,
        "renew_date": renew_date,
        "status_of_aplication_id": status_of_aplication_id,
      };
}
