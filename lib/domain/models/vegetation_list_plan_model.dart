import 'dart:convert';

import 'package:cmms/app/app.dart';

List<VegetationPlanListModel> VegetationPlanListModelFromJson(
        String str) =>
    List<VegetationPlanListModel>.from(
        json.decode(str).map(VegetationPlanListModel.fromJson));

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

  VegetationPlanListModel(
      {this.id,
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
      this.schedules});

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
        schedules: json['schedules']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['planId'] = this.planId;
    data['facilityId'] = this.facilityId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['frequencyId'] = this.frequencyId;
    data['frequency'] = this.frequency;
    data['assignedToId'] = this.assignedToId;
    data['assignedTo'] = this.assignedTo;
    data['startDate'] = this.startDate;
    data['noOfCleaningDays'] = this.noOfCleaningDays;
    data['createdById'] = this.createdById;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['approvedById'] = this.approvedById;
    data['approvedBy'] = this.approvedBy;
    data['approvedAt'] = this.approvedAt;
    data['deletedBy'] = this.deletedBy;
    data['status'] = this.status;
    data['status_short'] = this.statusShort;
    data['status_long'] = this.statusLong;
    data['schedules'] = this.schedules;
    return data;
  }
}
