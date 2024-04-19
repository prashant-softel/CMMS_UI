import 'dart:convert';

CreateGrievanceModel CreateGrievanceModelFromJson(String str) =>
    CreateGrievanceModel.fromJson(json.decode(str));

class CreateGrievanceModel {
  int? facilityId;
  int? grievanceType;
  String? concern;
  String? description;
  int? id;
  CreateGrievanceModel({
    this.facilityId,
    this.grievanceType,
    this.concern,
    this.description,
    this.id,
  });

  factory CreateGrievanceModel.fromJson(Map<String, dynamic> json) =>
      CreateGrievanceModel(
        facilityId: json["facilityId"],
        grievanceType: json["grievanceType"],
        concern: json["concern"],
        description: json["description"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "facilityId": facilityId,
        "id": id,
        "grievanceType": grievanceType,
        "concern": concern,
        "description": description,
      };
}
