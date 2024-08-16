import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

McPalningDetailsModel mcPlaningDetailsModelFromJson(String str) =>
    McPalningDetailsModel.fromJson(json.decode(str));

// String endMCExecutionDetailsModelToJson(McPalningDetailsModel data) =>
//     json.encode(data.toJson());

class McPalningDetailsModel {
  int? id;
  int? planId;
  int? facilityId;
  String? title;
  String? siteName;
  String? description;
  int? frequencyId;
  String? frequency;
  String? cleaningTypeName;
  int? cleaningType;

  int? assignedToId;
  String? assignedTo;
  int? noOfCleaningDays;
  int? createdById;
  int? scheduledModules;
  String? createdBy;
  String? createdAt;
  int? approvedById;
  String? approvedBy;
  String? approvedAt;
  String? startDate;
  String? deletedBy;
  int? status;
  String? status_short;
  String? status_long;
  List<Schedules> schedules;

  McPalningDetailsModel({
    this.id,
    this.approvedAt,
    this.title,
    this.siteName,
    this.description,
    this.cleaningTypeName,
    this.cleaningType,
    this.scheduledModules,
    this.frequency,
    this.assignedTo,
    this.assignedToId,
    this.approvedBy,
    this.approvedById,
    this.createdAt,
    this.createdBy,
    this.createdById,
    this.deletedBy,
    this.facilityId,
    this.frequencyId,
    this.startDate,
    this.noOfCleaningDays,
    this.planId,
    this.status,
    this.status_long,
    this.status_short,
    this.schedules = const [],
  });

  factory McPalningDetailsModel.fromJson(Map<String, dynamic> json) =>
      McPalningDetailsModel(
        id: json['id'],
        planId: json["planId"],
        facilityId: json['facilityId'],
        assignedTo: json['assignedTo'],
        cleaningType: json['cleaningType'],
        cleaningTypeName: json['cleaningTypeName'],
        assignedToId: json['assignedToId'],
        title: json['title'] ?? '',
        siteName: json['siteName'] ?? '',
        description: json['description'],
        frequencyId: json["frequencyId"],
        scheduledModules: json['scheduledModules'],
        frequency: json['frequency'],
        noOfCleaningDays: json['noOfCleaningDays'],
        createdById: json['createdById'],
        createdBy: json['createdBy'],
        createdAt: json['createdAt'],
        startDate: Utility.getFormatedyearMonthDay(json['startDate']),
        approvedById: json['approvedById'],
        approvedBy: json['approvedBy'],
        approvedAt: json['approvedAt'],
        deletedBy: json['deletedBy'],
        status: json['status'],
        status_short: json['status_short'],
        status_long: json['status_long'],
        schedules: json["schedules"] != null
            ? List<Schedules>.from(
                json["schedules"].map((x) => Schedules.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "planId": planId,
        "facilityId": facilityId,
        "assignedTo": assignedTo,
        "cleaningType": cleaningType,
        "cleaningTypeName": cleaningTypeName,
        "assignedToId": assignedToId,
        "title": title,
        "siteName": siteName,
        "description": description,
        "frequency": frequency,
        "noOfCleaningDays": noOfCleaningDays,
        "scheduledModules": scheduledModules,
        "createdById": createdById,
        "createdBy": createdBy,
        "createdAt": createdAt,
        "startDate": startDate,
        "approvedById": approvedById,
        "approvedBy": approvedBy,
        "approvedAt": approvedAt,
        "deletedBy": deletedBy,
        "status": status,
        "status_short": status_short,
        "status_long": status_long,
        "schedules": List<dynamic>.from(schedules.map((x) => x)),
      };
}

class Schedules {
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
    this.status_short,
    this.equipments,
  });

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
  int? scheduledArea;
  int? pendingModules;
  String? status_short;
  String? plannedDate;
  int? status;

  List<EquipmentsList?>? equipments;

  factory Schedules.fromJson(Map<String, dynamic> json) => Schedules(
        id: json["id"],
        scheduleId: json['scheduleId'],
        executionId: json['executionId'],
        cleaningDay: json['cleaningDay'],
        cleaningTypeName: json['cleaningTypeName'],
        scheduledModules: json['scheduledModules'],
        blocks: json['blocks'],
        cleaningType: json['cleaningType'],
        plannedDate: Utility.getFormatedyearMonthDay(json['plannedDate']),
        invs: json['invs'] ?? '',
        scheduledArea: json['scheduledArea'],
        smbs: json['smbs'],
        status: json['status'],
        status_short: json['status_short'],
        equipments: json["equipments"] != null
            ? List<EquipmentsList>.from(
                json["equipments"].map((x) => EquipmentsList.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "scheduleId": scheduleId,
        "executionId": executionId,
        "cleaningDay": cleaningDay,
        "cleaningTypeName": cleaningTypeName,
        "scheduledModules": scheduledModules,
        "blocks": blocks,
        "cleaningType": cleaningType,
        "plannedDate": plannedDate,
        "invs": invs,
        "scheduledArea": scheduledArea,
        "smbs": smbs,
        "status": status,
        "status_short": status_short,
        "equipments": List<dynamic>.from(equipments!.map((x) => x)),
      };
}

///Equipments List Detail Model
class EquipmentsList {
  EquipmentsList(
      {this.id,
      this.equipmentName,
      this.parentId,
      this.actualCleaningDate,
      this.moduleQuantity,
      this.short_status,
      this.grassCuttingArea,
      this.scheduledCleaningDate,
      this.updatedById,
      this.cleaningDay});

  int? id;
  String? equipmentName;
  int? parentId;
  String? scheduledCleaningDate;
  String? actualCleaningDate;
  String? short_status;
  int? updatedById;
  int? moduleQuantity;
  int? grassCuttingArea;
  int? cleaningDay;

  factory EquipmentsList.fromJson(Map<String, dynamic> json) => EquipmentsList(
        id: json["id"],
        equipmentName: json['equipmentName'],
        parentId: json['parentId'],
        scheduledCleaningDate: json['scheduledCleaningDate'],
        short_status: json['short_status'],
        actualCleaningDate:
            Utility.getFormatedyearMonthDay(json['actualCleaningDate']),
        updatedById: json['updatedById'],
        moduleQuantity: json['moduleQuantity'],
        grassCuttingArea: json['grassCuttingArea'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "equipmentName": equipmentName,
        "parentId": parentId,
        "scheduledCleaningDate": scheduledCleaningDate,
        "short_status": short_status,
        "actualCleaningDate": actualCleaningDate,
        "updatedById": updatedById,
        "moduleQuantity": moduleQuantity,
        "grassCuttingArea": grassCuttingArea,
      };
}

String mcPlainigModelToJson(Schedules data) => json.encode(data.toJson());
String mcPlaningDetailModelToJson(EquipmentsList data) =>
    json.encode(data.toJson());
