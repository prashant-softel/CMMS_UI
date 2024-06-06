import 'dart:convert';

CreateStatutoryModel createSRModelFromJson(String str) =>
    CreateStatutoryModel.fromJson(json.decode(str));

class CreateStatutoryModel {
  int? compliance_id;
  int? facility_id;
  String? expires_on;
  String? issue_date;
  String? Comment;

  CreateStatutoryModel({
    this.facility_id,
    this.expires_on,
    this.issue_date,
    this.compliance_id,
    this.Comment,
  });

  factory CreateStatutoryModel.fromJson(Map<String, dynamic> json) {
    return CreateStatutoryModel(
      facility_id: json['facility_id'],
      expires_on: json['expires_on'],
      issue_date: json['issue_date'],
      compliance_id: json['compliance_id'],
      Comment: json['Comment'],
    );
  }
  Map<String, dynamic> toJson() => {
        "facility_id": facility_id,
        "expires_on": expires_on,
        "issue_date": issue_date,
        "compliance_id": compliance_id,
        "Comment": Comment,
      };
}
