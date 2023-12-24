import 'dart:convert';

List<GrievanceListModel> facilityListFromJson(String str) =>
    List<GrievanceListModel>.from(
        json.decode(str).map(GrievanceListModel.fromJson));

String facilityListToJson(List<GrievanceListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GrievanceListModel {
  factory GrievanceListModel.fromJson(Map<String, dynamic> json) =>
      GrievanceListModel(
        facilityId: json['facilityId'],
        grievanceType: json['grievanceType'],
        concern: json['concern'] ?? '',
        actionTaken: json['actionTaken'] ?? '',
        resolutionLevel: json['resolutionLevel'] ?? '',
        statusId: json['statusId'] ?? '',
        createdBy: json['createdBy'],
      );
  GrievanceListModel({
    required this.facilityId,
    required this.grievanceType,
    required this.concern,
    required this.actionTaken,
    required this.resolutionLevel,
    required this.statusId,
    required this.createdBy,
  });

  int facilityId;
  String grievanceType;
  String? concern;
  String actionTaken;
  String resolutionLevel;
  String statusId;
  String createdBy;

  Map<String, dynamic> toJson() => {
        'facilityId': facilityId,
        'grievanceType': grievanceType,
        'actionTaken': actionTaken,
        'resoltionLevel': resolutionLevel,
        'statusId': statusId,
        'createdBy': createdBy,
      };
}
