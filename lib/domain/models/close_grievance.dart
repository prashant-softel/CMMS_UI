import 'dart:convert';

CloseGrievanceModel CloseGrievanceModelFromJson(String str) =>
    CloseGrievanceModel.fromJson(json.decode(str));

class CloseGrievanceModel {

  int? resolutionLevel;
  String? actionTaken;
  int? id;
  CloseGrievanceModel({
    this.resolutionLevel,
    this.id,
    this.actionTaken,
  });

  factory CloseGrievanceModel.fromJson(Map<String, dynamic> json) =>
      CloseGrievanceModel(
        
        resolutionLevel: json["resolutionLevel"],
        actionTaken: json["actionTaken"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "resolutionLevel": resolutionLevel,
        "actionTaken": actionTaken,
        "id": id,

      };
}
