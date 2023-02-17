import 'dart:convert';

List<JobModel> jobListFromJson(String str) =>
    List<JobModel>.from(json.decode(str).map(JobModel.fromJson));

String jobListToJson(List<JobModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobModel {
  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
      id: json['id'],
      userId: json['userId'],
      plantName: json['plantName'],
      jobDate: DateTime.parse(json['jobDate']),
      equipmentCat: json['equipmentCat'],
      workingArea: json['workingArea'],
      description: json['description'],
      jobDetails: json['jobDetails'],
      workType: json['workType'],
      raisedBy: json['raisedBy'],
      raisedByName: json['raisedByName'],
      breakdownTime: json['breakdownTime'] == null
          ? null
          : DateTime.parse(json['breakdownTime'] as String),
      breakdownType: json['breakdownType'],
      permitId: json['permitId'] == null ? null : json['permitId'],
      assignedToName: json['assignedToName'],
      assignedToId: json['assignedToId'],
      facilityId: json['facility_id'],
      status: JobStatus.values.firstWhere((x) => x.index == json['status'])
      //status: statusValues.map[json['status']]!,
      );
  JobModel({
    this.id,
    this.userId,
    this.plantName,
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
    this.facilityId,
    this.status,
  });

  int? id;
  int? userId;
  String? plantName;
  DateTime? jobDate;
  String? equipmentCat;
  String? workingArea;
  dynamic description;
  String? jobDetails;
  String? workType;
  int? raisedBy;
  String? raisedByName;
  DateTime? breakdownTime;
  String? breakdownType;
  int? permitId;
  String? assignedToName;
  int? assignedToId;
  int? facilityId;
  JobStatus? status;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'plantName': plantName,
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
        'facility_id': facilityId,
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
