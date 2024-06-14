import 'dart:convert';

import 'package:cmms/app/app.dart';

List<VegetationPlanListModel> VegetationPlanListModelFromJson(String str) =>
    List<VegetationPlanListModel>.from(
        json.decode(str).map(VegetationPlanListModel.fromJson));
String vegplanListModelToJson(List<VegetationPlanListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VegetationPlanListModel {
  int? id;
  int? planId;
  int? facilityId;
  String? title;
  dynamic description;
  int? frequencyId;
  String? frequency;
  int? assignedToId;
  dynamic assignedTo;
  String? startDate;
  int? noOfCleaningDays;
  int? createdById;
  String? createdBy;
  String? createdAt;
  int? approvedById;
  String? approvedBy;
  String? approvedAt;
  String? deletedBy;
  int? status;
  String? statusShort;
  dynamic statusLong;
  dynamic schedules;

  VegetationPlanListModel({
    this.id,
    this.planId,
    this.facilityId,
    this.title,
    this.description,
    this.frequencyId,
    this.frequency,
    this.assignedToId,
    this.assignedTo,
    this.startDate,
    this.noOfCleaningDays,
    this.createdById,
    this.createdBy,
    this.createdAt,
    this.approvedById,
    this.approvedBy,
    this.approvedAt,
    this.deletedBy,
    this.status,
    this.statusShort,
    this.statusLong,
    this.schedules,
  });

  factory VegetationPlanListModel.fromJson(Map<String, dynamic> json) {
    return VegetationPlanListModel(
      id: json['id'],
      planId: json['planId'],
      facilityId: json['facilityId'],
      title: json['title'],
      description: json['description'] ?? "",
      frequencyId: json['frequencyId'],
      frequency: json['frequency'],
      assignedToId: json['assignedToId'],
      assignedTo: json['assignedTo'],
      startDate: Utility.getFormatedyearMonthDay(json['startDate']),
      noOfCleaningDays: json['noOfCleaningDays'],
      createdById: json['createdById'],
      createdBy: json['createdBy'],
      createdAt: Utility.getFormatedyearMonthDay(json['createdAt']),
      approvedById: json['approvedById'],
      approvedBy: json['approvedBy'],
      approvedAt: Utility.getFormatedyearMonthDay(json['approvedAt']),
      deletedBy: json['deletedBy'],
      status: json['status'],
      statusShort: json['status_short'],
      statusLong: json['status_long'],
      schedules: json['schedules'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'planId': this.planId,
        'facilityId': this.facilityId,
        'title': this.title,
        'description': this.description,
        'frequencyId': this.frequencyId,
        'frequency': this.frequency,
        'assignedToId': this.assignedToId,
        'assignedTo': this.assignedTo,
        'startDate': this.startDate,
        'noOfCleaningDays': this.noOfCleaningDays,
        'createdById': this.createdById,
        'createdBy': this.createdBy,
        'createdAt': this.createdAt,
        'approvedById': this.approvedById,
        'approvedBy': this.approvedBy,
        'approvedAt': this.approvedAt,
        'deletedBy': this.deletedBy,
        'status': this.status,
        'status_short': this.statusShort,
        'status_long': this.statusLong,
        'schedules': this.schedules,
      };
}
