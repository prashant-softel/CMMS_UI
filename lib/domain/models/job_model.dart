import 'dart:convert';

List<JobModel> jobListFromJson(String str) =>
    List<JobModel>.from(json.decode(str).map(JobModel.fromJson));

String jobListToJson(List<JobModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobModel {
  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
      id: json['id'] == null ? null : json['id'],
      userId: json['userId'] == null ? null : json['userId'],
      facilityId: json['facility_id'] == null ? null : json['facility_id'],
      facilityName: json['facilityName'] == null ? null : json['facilityName'],
      jobDate: json['jobDate'] == null ? null : DateTime.parse(json['jobDate']),
      equipmentCat: json['equipmentCat'] == null ? null : json['equipmentCat'],
      workingArea: json['workingArea'] == null ? null : json['workingArea'],
      description: json['description'] == null ? null : json['description'],
      jobDetails: json['jobDetails'] == null ? null : json['jobDetails'],
      workType: json['workType'] == null ? null : json['workType'],
      raisedBy: json['raisedBy'] == null ? null : json['raisedBy'],
      raisedByName: json['raisedByName'] == null ? null : json['raisedByName'],
      breakdownTime: json['breakdownTime'] == null
          ? null
          : DateTime.parse(json['breakdownTime'] as String),
      breakdownType:
          json['breakdownType'] == null ? null : json['breakdownType'],
      permitId: json['permitId'] == null ? null : json['permitId'],
      assignedToName:
          json['assignedToName'] == null ? null : json['assignedToName'],
      assignedToId: json['assignedToId'] == null ? null : json['assignedToId'],
      status: json['status'] == null
          ? null
          : JobStatus.values.firstWhere((x) => x.index == json['status']));

  ///
  JobModel({
    this.id,
    this.userId,
    this.facilityId,
    this.facilityName,
    this.jobDate,
    this.equipmentCat,
    this.workingArea,
    this.description,
    this.jobDetails,
    this.workType,
    this.raisedBy,
    this.raisedByName,
    this.breakdownTime,
    this.breakdownType,
    this.permitId,
    this.assignedToName,
    this.assignedToId,
    this.status,
  });

  int? id;
  int? userId;
  int? facilityId;
  String? facilityName;
  DateTime? jobDate;
  String? equipmentCat;
  String? workingArea;
  String? description;
  String? jobDetails;
  String? workType;
  int? raisedBy;
  String? raisedByName;
  DateTime? breakdownTime;
  String? breakdownType;
  String? permitId;
  String? assignedToName;
  int? assignedToId;

  JobStatus? status;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'facility_id': facilityId,
        'facilityName': facilityName,
        'jobDate': jobDate?.toIso8601String(),
        'equipmentCat': equipmentCat,
        'workingArea': workingArea,
        'description': description,
        'jobDetails': jobDetails,
        'workType': workType,
        'raisedBy': raisedBy,
        'raisedByName': raisedByName,
        'breakdownTime': breakdownTime,
        'breakdownType': breakdownType,
        'permitId': permitId,
        'assignedToName': assignedToName,
        'assignedToId': assignedToId,
        'status': statusValues.reverse[status],
      };
}

enum JobStatus {
  Invalid,
  CREATED,
  UPDATED,
  DELETED,
  CANCELLED,
  ASSIGNED,
  ISSUED,
  APPROVED,
  REJECTED,
}

final statusValues = EnumValues({
  "Invalid": JobStatus.Invalid,
  "Created": JobStatus.CREATED,
  "Updated": JobStatus.UPDATED,
  "Deleted": JobStatus.DELETED,
  "Cancelled": JobStatus.CANCELLED,
  "Assigned": JobStatus.ASSIGNED,
  "Issued": JobStatus.ISSUED,
  "Approved": JobStatus.APPROVED,
  "Rejected": JobStatus.REJECTED,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
