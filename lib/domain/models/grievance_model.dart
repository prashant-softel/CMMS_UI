import 'dart:convert';

CreateGrievanceModel CreateGrievanceModelFromJson(String str) =>
    CreateGrievanceModel.fromJson(json.decode(str));

class CreateGrievanceModel {
  int? facilityId;
  int? grievanceType;
  String? concern;
  String? description;
  CreateGrievanceModel({
    this.facilityId,
    this.grievanceType,
    this.concern,
    this.description,
  });

  factory CreateGrievanceModel.fromJson(Map<String, dynamic> json) {
    return CreateGrievanceModel(
      facilityId: json["facilityId"],
      grievanceType: json["grievanceType"],
      concern: json["concern"],
      description: json["description"],
    );
  }
  Map<String, dynamic> toJson() => {
        "facilityId": facilityId,
        "grievanceType": grievanceType,
        "concern": concern,
        "description": description,
      };
}
