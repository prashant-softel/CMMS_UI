import 'dart:convert';

List<GrievanceListModel> facilityListFromJson(String str) =>
    List<GrievanceListModel>.from(
        json.decode(str).map(GrievanceListModel.fromJson));

        GrievanceListModel grievanceListModelFromJson(String str) =>
    GrievanceListModel.fromJson(json.decode(str));

String facilityListToJson(List<GrievanceListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GrievanceListModel {
  int? id;
  int? facilityId;
  int? grievanceTypeId;
  String? grievanceType;
  String? concern;
  String? description;
  String? actionTaken;
  int? resolutionLevel;
  String? closedDate;
  String? closedBy;
  String? closedByName;
  int? createdBy;
  String? createdByName;
  String? createdAt;
  int? updatedBy;
  String? updatedByName;
  String? updatedAt;
  String? deletedAt;
  String? deletedBy;
  String? deletedByName;
  String? closedAt;
  int? statusId;
  String? statusShort;
  String? statusLong;
  int? status;

  GrievanceListModel(
      {this.id,
      this.facilityId,
      this.grievanceTypeId,
      this.grievanceType,
      this.concern,
      this.description,
      this.actionTaken,
      this.resolutionLevel,
      this.closedDate,
      this.closedBy,
      this.closedByName,
      this.createdBy,
      this.createdByName,
      this.createdAt,
      this.updatedBy,
      this.updatedByName,
      this.updatedAt,
      this.deletedAt,
      this.deletedBy,
      this.deletedByName,
      this.closedAt,
      this.statusId,
      this.statusShort,
      this.statusLong,
      this.status});

  factory GrievanceListModel.fromJson(Map<String, dynamic> json) =>
      GrievanceListModel(
        id: json["id"],
        facilityId: json["facility_id"],
        grievanceTypeId: json["type_id"],
        grievanceType: json["grievanceType"],
        concern: json['concern'],
        description: json['description'],
        actionTaken: json['actionTaken'],
        resolutionLevel: json['resolutionLevel'],
        closedDate: json['closedDate'],
        closedBy: json['closedBy'],
        closedByName: json['closedByName'],
        createdBy: json['createdBy'],
        createdByName: json['createdByName'],
        createdAt: json['createdAt'],
        updatedBy: json['updatedBy'],
        updatedByName: json['updatedByName'],
        updatedAt: json['updatedAt'],
        deletedAt: json['deletedAt'],
        deletedBy: json['deletedBy'],
        deletedByName: json['deletedByName'],
        closedAt: json['closedAt'],
        statusId: json['statusId'],
        statusShort: json['statusShort'],
        statusLong: json['statusLong'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['facilityId'] = this.facilityId;
    data['grievanceTypeId'] = this.grievanceTypeId;
    data['grievanceType'] = this.grievanceType;
    data['concern'] = this.concern;
    data['description'] = this.description;
    data['actionTaken'] = this.actionTaken;
    data['resolutionLevel'] = this.resolutionLevel;
    data['closedDate'] = this.closedDate;
    data['closedBy'] = this.closedBy;
    data['closedByName'] = this.closedByName;
    data['createdBy'] = this.createdBy;
    data['createdByName'] = this.createdByName;
    data['createdAt'] = this.createdAt;
    data['updatedBy'] = this.updatedBy;
    data['updatedByName'] = this.updatedByName;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['deletedBy'] = this.deletedBy;
    data['deletedByName'] = this.deletedByName;
    data['closedAt'] = this.closedAt;
    data['statusId'] = this.statusId;
    data['statusShort'] = this.statusShort;
    data['statusLong'] = this.statusLong;
    data['status'] = this.status;
    return data;
  }
}
