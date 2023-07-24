import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<ModuleCleaningListPlanModel> ModuleCleaningListPlanModelFromJson(
        String str) =>
    List<ModuleCleaningListPlanModel>.from(
        json.decode(str).map(ModuleCleaningListPlanModel.fromJson));

class ModuleCleaningListPlanModel {
  int? id;
  int? planId;
  int? facilityId;
  String? title;
  dynamic? description;
  String? frequency;
  int? frequencyId;
  int? noOfCleaningDays;
  int? createdById;
  String? createdBy;
  String? createdAt;
  int? approvedById;
  dynamic approvedBy;
  String? approvedAt;
  dynamic? deletedBy;
  int? status;
  String? status_short;
  dynamic? status_long;
  dynamic? schedules;

  ModuleCleaningListPlanModel({
    this.id,
    this.planId,
    this.facilityId,
    this.title,
    this.description,
    this.frequency,
    this.frequencyId,
    this.noOfCleaningDays,
    this.createdById,
    this.createdBy,
    this.createdAt,
    this.approvedById,
    this.approvedBy,
    this.approvedAt,
    this.deletedBy,
    this.status,
    this.status_short,
    this.status_long,
    this.schedules,
  });

  // Factory method to create a ModuleCleaningListPlanModel instance from JSON
  factory ModuleCleaningListPlanModel.fromJson(Map<String, dynamic> json) {
    return ModuleCleaningListPlanModel(
      id: json['id'],
      planId: json['planId'],
      facilityId: json['facilityId'],
      title: json['title'],
      description: json['description'] ?? "",
      frequency: json['frequency'],
      frequencyId: json['frequencyId'],
      noOfCleaningDays: json['noOfCleaningDays'],
      createdById: json['createdById'],
      createdBy: json['createdBy'],
      createdAt: Utility.getFormatedyearMonthDay(json['createdAt']),
      approvedById: json['approvedById'],
      approvedBy: json['approvedBy'] ?? "",
      approvedAt: Utility.getFormatedyearMonthDay(json['approvedAt']),
      deletedBy: json['deletedBy'] ?? "",
      status: json['status'],
      status_short: json['status_short'],
      status_long: json['status_long'] ?? "",
      schedules: json['schedules'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['planId'] = this.planId;
    data['facilityId'] = this.facilityId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['frequency'] = this.frequency;
    data['frequencyId'] = this.frequencyId;
    data['noOfCleaningDays'] = this.noOfCleaningDays;
    data['createdById'] = this.createdById;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['approvedById'] = this.approvedById;
    data['approvedBy'] = this.approvedBy;
    data['approvedAt'] = this.approvedAt;
    data['deletedBy'] = this.deletedBy;
    data['status'] = this.status;
    data['status_short'] = this.status_short;
    data['status'] = this.status;
    data['status_long'] = this.status_long;
    data['schedules'] = this.schedules;

    return data;
  }
}
