import 'package:cmms/app/utils/utility.dart';
import 'dart:convert';

VegPlanDetailModel vegPlanDetailModelFromJson(String str) =>
    VegPlanDetailModel.fromJson(json.decode(str));

class VegPlanDetailModel {
  int? id;
  int? planId;
  int? facilityId;
  String? title;
  String? siteName;
  String? description;
  int? frequencyId;
  String? frequency;
  int? assignedToId;
  String? assignedTo;
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
  String? statusLong;
  List<Schedules>? schedules;

  VegPlanDetailModel({
    this.id,
    this.planId,
    this.facilityId,
    this.title,
    this.siteName,
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

  factory VegPlanDetailModel.fromJson(Map<String, dynamic> json) {
    return VegPlanDetailModel(
      id: json['id'],
      planId: json['planId'],
      facilityId: json['facilityId'],
      title: json['title'],
      siteName: json['siteName'],
      description: json['description'],
      frequencyId: json['frequencyId'],
      frequency: json['frequency'],
      assignedToId: json['assignedToId'],
      assignedTo: json['assignedTo'],
      startDate: json['startDate'],
      noOfCleaningDays: json['noOfCleaningDays'],
      createdById: json['createdById'],
      createdBy: json['createdBy'],
      createdAt: json['createdAt'],
      approvedById: json['approvedById'],
      approvedBy: json['approvedBy'],
      approvedAt: json['approvedAt'],
      deletedBy: json['deletedBy'],
      status: json['status'],
      statusShort: json['status_short'],
      statusLong: json['status_long'],
      schedules: (json['schedules'] != null)
          ? List<Schedules>.from(
              json['schedules'].map((x) => Schedules.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'planId': planId,
        'facilityId': facilityId,
        'title': title,
        'siteName': siteName,
        'description': description,
        'frequencyId': frequencyId,
        'frequency': frequency,
        'assignedToId': assignedToId,
        'assignedTo': assignedTo,
        'startDate': startDate,
        'noOfCleaningDays': noOfCleaningDays,
        'createdById': createdById,
        'createdBy': createdBy,
        'createdAt': createdAt,
        'approvedById': approvedById,
        'approvedBy': approvedBy,
        'approvedAt': approvedAt,
        'deletedBy': deletedBy,
        'status': status,
        'status_short': statusShort,
        'status_long': statusLong,
        'schedules': List<dynamic>.from(schedules!.map((x) => x)),
      };
}

class Schedules {
  int? id;
  int? scheduleId;
  int? executionId;
  int? cleaningDay;
  int? cleaningType;
  String? cleaningTypeName;
  int? blocks;
  int? invs;
  int? smbs;
  int? scheduledModules;
  double? scheduledArea;
  String? plannedDate;
  int? status;
  String? statusShort;
  List<EquipmentList?>? equipments;

  Schedules({
    this.id,
    this.scheduleId,
    this.executionId,
    this.cleaningDay,
    this.cleaningType,
    this.cleaningTypeName,
    this.blocks,
    this.invs,
    this.smbs,
    this.scheduledModules,
    this.scheduledArea,
    this.plannedDate,
    this.status,
    this.statusShort,
    this.equipments,
  });

  factory Schedules.fromJson(Map<String, dynamic> json) => Schedules(
        id: json['id'],
        scheduleId: json['scheduleId'],
        executionId: json['executionId'],
        cleaningDay: json['cleaningDay'],
        cleaningType: json['cleaningType'],
        cleaningTypeName: json['cleaningTypeName'],
        blocks: json['blocks'],
        invs: json['invs'],
        smbs: json['smbs'],
        scheduledModules: json['scheduledModules'],
        scheduledArea: json['area'],
        plannedDate: json['plannedDate'],
        status: json['status'],
        statusShort: json['statusShort'],
        equipments: json["equipments"] != null
            ? List<EquipmentList>.from(
                json["equipments"].map((x) => EquipmentList.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'scheduleId': scheduleId,
        'executionId': executionId,
        'cleaningDay': cleaningDay,
        'cleaningType': cleaningType,
        'cleaningTypeName': cleaningTypeName,
        'blocks': blocks,
        'invs': invs,
        'smbs': smbs,
        'scheduledModules': scheduledModules,
        'area': scheduledArea,
        'plannedDate': plannedDate,
        'status': status,
        'status_short': statusShort,
        'equipments': List<dynamic>.from(equipments!.map((x) => x)),
      };
}

class EquipmentList {
  int? id;
  String? equipmentName;
  int? parentId;
  String? parentName;
  int? moduleQuantity;
  int? noOfPlanDay;
  String? scheduledCleaningDate;
  String? actualCleaningDate;
  String? shortStatus;
  int? updatedById;
  int? grassCuttingArea;
  int? cleaningDay;

  EquipmentList({
    this.id,
    this.equipmentName,
    this.parentId,
    this.parentName,
    this.moduleQuantity,
    this.noOfPlanDay,
    this.scheduledCleaningDate,
    this.actualCleaningDate,
    this.shortStatus,
    this.updatedById,
    this.grassCuttingArea,
    this.cleaningDay,
  });

  factory EquipmentList.fromJson(Map<String, dynamic> json) => EquipmentList(
        id: json["id"],
        equipmentName: json['equipmentName'],
        parentId: json['parentId'],
        parentName: json['parentName'],
        moduleQuantity: json['moduleQuantity'],
        noOfPlanDay: json['noOfPlanDay'],
        scheduledCleaningDate: json['scheduledCleaningDate'],
        actualCleaningDate:
            Utility.getFormatedyearMonthDay(json['actualCleaningDate']),
        shortStatus: json['shortStatus'],
        updatedById: json['updatedById'],
        grassCuttingArea: json['grassCuttingArea'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'equipmentName': equipmentName,
        'parentId': parentId,
        'parentName': parentName,
        'moduleQuantity': moduleQuantity,
        'noOfPlanDay': noOfPlanDay,
        'scheduledCleaningDate': scheduledCleaningDate,
        'actualCleaningDate': actualCleaningDate,
        'short_status': shortStatus,
        'updatedById': updatedById,
        'grassCuttingArea': grassCuttingArea,
      };
}

String vegPlanModelToJson(Schedules data) => json.encode(data.toJson());
String vegPlangDetailModelToJson(EquipmentList data) =>
    json.encode(data.toJson());
