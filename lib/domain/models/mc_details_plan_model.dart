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
  String? description;
  int? frequencyId;
  String? frequency;
  int? noOfCleaningDays;
  int? createdById;
  String? createdBy;
  String? createdAt;
  int? approvedById;
  String? approvedBy;
  String? approvedAt;
  String? deletedBy;
  int? status;
  String? status_short;
  String? status_long;
  List<Schedule> schedules;

  McPalningDetailsModel({
    this.id,
    this.approvedAt,
    this.title,
    this.description,
    this.frequency,
    this.approvedBy,
    this.approvedById,
    this.createdAt,
    this.createdBy,
    this.createdById,
    this.deletedBy,
    this.facilityId,
    this.frequencyId,
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
        title: json['title'] ?? '',
        description: json['description'],
        frequencyId: json["frequencyId"],
        frequency: json['frequency'],
        noOfCleaningDays: json['crnoOfCleaningDayseatedAt'],
        createdById: json['createdById'],
        createdBy: json['createdBy'],
        createdAt: json['createdAt'],
        approvedById: json['approvedById'],
        approvedBy: json['approvedBy'],
        approvedAt: json['approvedAt'],
        deletedBy: json['deletedBy'],
        status: json['status'],
        status_short: json['status_short'],
        status_long: json['status_long'],
        schedules: json["schedules"] != null
            ? List<Schedule>.from(
                json["schedules"].map((x) => Schedule.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "planId": planId,
        "facilityId": facilityId,
        "title": title,
        "description": description,
        "frequency": frequency,
        "noOfCleaningDays": noOfCleaningDays,
        "createdById": createdById,
        "createdBy": createdBy,
        "createdAt": createdAt,
        "approvedById": approvedById,
        "approvedBy": approvedBy,
        "approvedAt": approvedAt,
        "deletedBy": deletedBy,
        "status": status,
        "status_short": status_short,
        "status_long": status_long,
        "schedules": List<dynamic>.from(schedules!.map((x) => x)),
      };
}

class Schedule {
  Schedule({
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

  List<Equipments?>? equipments;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
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
            ? List<Equipments>.from(
                json["equipments"].map((x) => Equipments.fromJson(x)))
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
class Equipments {
  Equipments({
    this.id,
    this.equipmentName,
    this.parentId,
    this.actualCleaningDate,
    this.moduleQuantity,
    this.short_status,
    this.grassCuttingArea,
    this.scheduledCleaningDate,
    this.updatedById,
  });

  int? id;
  String? equipmentName;
  int? parentId;
  String? scheduledCleaningDate;
  String? actualCleaningDate;
  String? short_status;
  int? updatedById;
  int? moduleQuantity;
  int? grassCuttingArea;

  factory Equipments.fromJson(Map<String, dynamic> json) => Equipments(
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

String mcPlainigModelToJson(Schedule data) => json.encode(data.toJson());
String mcPlaningDetailModelToJson(Equipments data) =>
    json.encode(data.toJson());
