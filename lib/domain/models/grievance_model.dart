import 'dart:convert';

List<GrievanceModel> grievanceListFromJson(String str) =>
    List<GrievanceModel>.from(json.decode(str).map(GrievanceModel.fromJson));

String grievanceListToJson(List<GrievanceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GrievanceModel {
  factory GrievanceModel.fromJson(Map<String, dynamic> json) => GrievanceModel(
        id: json['id'] == null ? 0 : json['id'],
        facilityId: json['facilityId'] == null ? 0 : json['facilityId'],
        grievanceTypeId:
            json['grievanceTypeId'] == null ? 0 : json['grievanceType'],
        grievanceType:
            json['grievanceType'] == null ? null : json['grievanceType'],
        description: json['description'] == null ? null : json['description'],
        concern: json['concern'] == null ? null : json['concern'],
        actionTaken: json['actionTaken'] == null ? null : json['actionTaken'],
        resolutionLevel:
            json['resolutionLevel'] == null ? 0 : json['resolutionLevel'],
        closeDate: json['closeDate'] == null
            ? null
            : DateTime.parse(json['closeDate']),
        statusId: json['statusId'] == null ? 0 : json['statusId'],

        statusShort: json['statusShort'] == null ? null : json['statusShort'],
        createdBy: json['createdBy'] == null ? 0 : json['createdBy'] ?? '',
        createdByName:
            json['createdByName'] == null ? null : json['createdByName'] ?? '',
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedBy: json['updatedBy'] == null ? 0 : json['updatedBy'] ?? '',
        updatedByName:
            json['updatedByName'] == null ? null : json['updatedByName'] ?? '',
        updatedAt: json['updatedAt'] == null ? 0 : json['updatedAt'] ?? '',
        status_short:
            json['status_short'] == null ? 0 : json['status_short'] ?? '',
        deletedBy: json['deletedBy'] == null ? null : json['deletedBy'] ?? '',
        deletedAt: json['deletedAt'] == null
            ? null
            : DateTime.parse(json['deletedAt'] as String),
        deletedByName:
            json['deletedByName'] == null ? null : json['deletedByName'],
        addedBy: json['addedBy'] == null ? 0 : json['addedBy'] ?? '',
        addedAt: json['addedAt'] == null
            ? null
            : DateTime.parse(json['addedAt'] as String),

        // : JobStatusData.statusValues.entries
        //     .firstWhere(
        //       (x) => x.value.index == json['status'] - 101,
        //       orElse: () => MapEntry("CREATED", JobStatus.JOB_CREATED),
        //     )
        //     .value,
      );

  ///
  GrievanceModel(
      {this.id,
      this.facilityId,
      this.grievanceTypeId,
      this.grievanceType,
      this.description,
      this.concern,
      this.actionTaken,
      this.resolutionLevel,
      this.closeDate,
      this.statusId,
      this.statusShort,
      this.statusLong,
      this.createdBy,
      this.createdByName,
      this.createdAt,
      this.updatedBy,
      this.updatedByName,
      this.updatedAt,
      this.status_short,
      this.deletedAt,
      this.deletedBy,
      this.deletedByName,
      this.addedBy,
      this.addedAt});

  int? id;
  int? facilityId;
  int? grievanceTypeId;
  int? grievanceType;
  String? description;
  String? concern;
  String? actionTaken;
  int? resolutionLevel;
  DateTime? closeDate;
  int? statusId;
  String? statusShort;
  String? statusLong;
  int? createdBy;
  String? createdByName;
  DateTime? createdAt;
  int? updatedBy;
  String? updatedByName;
  DateTime? updatedAt;
  String? status_short;
  DateTime? deletedAt;
  int? deletedBy;
  String? deletedByName;
  int? addedBy;
  DateTime? addedAt;
  int? status;

  Map<String, dynamic> toJson() => {
        'id': id,
        'facilityId': facilityId,
        'grievanceTypeId': grievanceTypeId,
        'grievanceType': grievanceType,
        'description': description,
        'concern': concern,
        'actionTaken': actionTaken,
        'resolutionLevel': resolutionLevel,
        'closeDate': closeDate,
        'statusId': statusId,
        'statusShort': statusShort,
        'statusLong': statusLong,
        'createdBy': createdBy,
        'createdByName': createdByName,
        'createdAt': createdAt,
        'updatedBy': updatedBy,
        'updatedByName': updatedByName,
        'updatedAt': updatedAt,
        'status_short': status_short,
        'deletedAt': deletedAt,
        'deletedBy': deletedBy,
        'deletedByName': deletedByName,
        'addedBy': addedBy,
        'addedAt': addedAt,
      };
}
