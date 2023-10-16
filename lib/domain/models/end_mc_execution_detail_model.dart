import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

EndMCExecutionDetailsModel endMCExecutionDetailsModelFromJson(String str) =>
    EndMCExecutionDetailsModel.fromJson(json.decode(str));

// String endMCExecutionDetailsModelToJson(EndMCExecutionDetailsModel data) =>
//     json.encode(data.toJson());

class EndMCExecutionDetailsModel {
  int? id;
  int? executionId;
  String? title;
  String? description;
  String? frequency;
  int? noOfDays;
  String? plannedBy;
  String? plannedAt;
  String? startedBy;
  String? startedAt;
  String? abandonedBy;
  String? abandonedAt;
  int? status;
  String? status_short;
  String? status_long;
  List<Schedules> schedules;

  EndMCExecutionDetailsModel({
    this.id,
    this.executionId,
    this.title,
    this.description,
    this.frequency,
    this.noOfDays,
    this.plannedBy,
    this.plannedAt,
    this.startedBy,
    this.startedAt,
    this.abandonedBy,
    this.abandonedAt,
    this.status,
    this.status_short,
    this.status_long,
    this.schedules = const [],
  });

  factory EndMCExecutionDetailsModel.fromJson(Map<String, dynamic> json) =>
      EndMCExecutionDetailsModel(
        id: json['id'],
        executionId: json["executionId"],
        title: json['title'],
        description: json['description'] ?? '',
        frequency: json['frequency'],
        noOfDays: json["noOfDays"],
        plannedBy: json['plannedBy'],
        plannedAt: json['plannedAt'],
        startedBy: json['startedBy'],
        startedAt: json['startedAt'],
        abandonedBy: json["abandonedBy"] ?? '',
        abandonedAt: json["abandonedAt"],
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
        "executionId": executionId,
        "title": title,
        "description": description,
        "frequency": frequency,
        "noOfDays": noOfDays,
        "plannedBy": plannedBy,
        "plannedAt": plannedAt,
        "startedBy": startedBy,
        "startedAt": startedAt,
        "abandonedBy": abandonedBy,
        "abandonedAt": abandonedAt,
        "status": status,
        "status_short": status_short,
        "status_long": status_long,
        "schedules": List<dynamic>.from(schedules!.map((x) => x)),
      };
}

class Schedules {
  Schedules({
    this.id,
    this.scheduleId,
    this.executionId,
    this.cleaningDay,
    this.cleaningTypeName,
    this.scheduledModules,
    this.cleanedModules,
    this.abandonedModules,
    this.pendingModules,
    this.waterUsed,
    this.execution_date,
    this.remark,
    this.status,
    this.status_short,
    this.equipments,
  });

  int? id;
  int? scheduleId;
  int? executionId;
  int? cleaningDay;
  String? cleaningTypeName;
  int? scheduledModules;
  int? cleanedModules;
  int? abandonedModules;
  int? pendingModules;
  int? waterUsed;
  String? execution_date;
  String? remark;
  int? status;
  String? status_short;
  List<EquipmentsList?>? equipments;

  factory Schedules.fromJson(Map<String, dynamic> json) => Schedules(
        id: json["id"],
        scheduleId: json['scheduleId'],
        executionId: json['executionId'],
        cleaningDay: json['cleaningDay'],
        cleaningTypeName: json['cleaningTypeName'],
        scheduledModules: json['scheduledModules'],
        cleanedModules: json['cleanedModules'],
        abandonedModules: json['abandonedModules'],
        pendingModules: json['pendingModules'],
        waterUsed: json['waterUsed'],
        execution_date: Utility.getFormatedyearMonthDay(json['execution_date']),
        remark: json['remark'] ?? '',
        status_short: json['status_short'],
        status: json['status'],
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
        "cleanedModules": cleanedModules,
        "abandonedModules": abandonedModules,
        "pendingModules": pendingModules,
        "waterUsed": waterUsed,
        "execution_date": execution_date,
        "remark": remark,
        "status": status,
        "status_short": status_short,
        "equipments": List<dynamic>.from(equipments!.map((x) => x)),
      };
}

///Equipments List Detail Model
class EquipmentsList {
  EquipmentsList({
    this.id,
    this.equipmentName,
    this.parentId,
    this.cleaningDay,
    this.moduleQuantity,
    this.status,
    this.short_status,
  });

  int? id;
  String? equipmentName;
  int? parentId;
  int? cleaningDay;
  int? moduleQuantity;
  int? status;
  String? short_status;

  factory EquipmentsList.fromJson(Map<String, dynamic> json) => EquipmentsList(
        id: json["id"],
        equipmentName: json['equipmentName'],
        parentId: json['parentId'],
        cleaningDay: json['cleaningDay'],
        moduleQuantity: json['moduleQuantity'],
        status: json['status'],
        short_status: json['short_status'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "equipmentName": equipmentName,
        "parentId": parentId,
        "cleaningDay": cleaningDay,
        "moduleQuantity": moduleQuantity,
        "status": status,
        "short_status": short_status,
      };
}

String endExecutionModelToJson(Schedules data) => json.encode(data.toJson());
String endExecutionDetailModelToJson(EquipmentsList data) =>
    json.encode(data.toJson());
