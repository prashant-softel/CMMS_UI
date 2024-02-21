import 'dart:convert';

VegExecutionDetailsModel vegExecutionDetailsModelFromJson(String str) =>
    VegExecutionDetailsModel.fromJson(json.decode(str));

class VegExecutionDetailsModel {
  int? id;
  int? executionId;
  String? title;
  String? description;
  String? frequency;
  String? assignedTo;
  String? startDate;
  int? noOfDays;
  String? plannedBy;
  String? plannedAt;
  String? startedBy;
  String? startedAt;
  String? abandonedBy;
  String? abandonedAt;
  int? status;
  String? statusShort;
  String? statusLong;
  List<Schedules>? schedules;

  VegExecutionDetailsModel(
      {this.id,
      this.executionId,
      this.title,
      this.description,
      this.frequency,
      this.assignedTo,
      this.startDate,
      this.noOfDays,
      this.plannedBy,
      this.plannedAt,
      this.startedBy,
      this.startedAt,
      this.abandonedBy,
      this.abandonedAt,
      this.status,
      this.statusShort,
      this.statusLong,
      this.schedules});

  factory VegExecutionDetailsModel.fromJson(Map<String, dynamic> json) =>
      VegExecutionDetailsModel(
          id: json['id'],
          executionId: json['executionId'],
          title: json['title'],
          description: json['description'],
          frequency: json['frequency'],
          assignedTo: json['assignedTo'],
          startDate: json['startDate'],
          noOfDays: json['noOfDays'],
          plannedBy: json['plannedBy'],
          plannedAt: json['plannedAt'],
          startedBy: json['startedBy'],
          startedAt: json['startedAt'],
          abandonedBy: json['abandonedBy'],
          abandonedAt: json['abandonedAt'],
          status: json['status'],
          statusShort: json['status_short'],
          statusLong: json['status_long'],
          schedules: json["schedules"] != null
              ? List<Schedules>.from(
                  json["schedules"].map((x) => Schedules.fromJson(x)))
              : []);

  Map<String, dynamic> toJson() => {
        'id': id,
        'executionId': executionId,
        'title': title,
        'description': description,
        'frequency': frequency,
        'assignedTo': assignedTo,
        'startDate': startDate,
        'noOfDays': noOfDays,
        'plannedBy': plannedBy,
        'plannedAt': plannedAt,
        'startedBy': startedBy,
        'startedAt': startedAt,
        'abandonedBy': abandonedBy,
        'abandonedAt': abandonedAt,
        'status': status,
        'status_short': statusShort,
        'status_long': statusLong,
        'schedules': List<dynamic>.from(schedules!.map((x) => x))
      };
}

class Schedules {
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
  String? executionDate;
  String? remark;
  int? status;
  String? statusShort;
  List<Equipments>? equipments;

  Schedules(
      {this.id,
      this.scheduleId,
      this.executionId,
      this.cleaningDay,
      this.cleaningTypeName,
      this.scheduledModules,
      this.cleanedModules,
      this.abandonedModules,
      this.pendingModules,
      this.waterUsed,
      this.executionDate,
      this.remark,
      this.status,
      this.statusShort,
      this.equipments});

  factory Schedules.fromJson(Map<String, dynamic> json) => Schedules(
      id: json['id'],
      scheduleId: json['scheduleId'],
      executionId: json['executionId'],
      cleaningDay: json['cleaningDay'],
      cleaningTypeName: json['cleaningTypeName'],
      scheduledModules: json['scheduledModules'],
      cleanedModules: json['cleanedModules'],
      abandonedModules: json['abandonedModules'],
      pendingModules: json['pendingModules'],
      waterUsed: json['waterUsed'],
      executionDate: json['execution_date'],
      remark: json['remark'],
      status: json['status'],
      statusShort: json['status_short'],
      equipments: json["equipments"] != null
          ? List<Equipments>.from(
              json["equipments"].map((x) => Equipments.fromJson(x)))
          : []);

  Map<String, dynamic> toJson() => {
        'id': id,
        'scheduleId': scheduleId,
        'executionId': executionId,
        'cleaningDay': cleaningDay,
        'cleaningTypeName': cleaningTypeName,
        'scheduledModules': scheduledModules,
        'cleanedModules': cleanedModules,
        'abandonedModules': abandonedModules,
        'pendingModules': pendingModules,
        'waterUsed': waterUsed,
        'execution_date': executionDate,
        'remark': remark,
        'status': status,
        'status_short': statusShort,
        'equipment': List<dynamic>.from(equipments!.map((x) => x)),
      };
}

class Equipments {
  int? id;
  String? equipmentName;
  int? parentId;
  String? parentName;
  int? moduleQuantity;
  int? cleaningDay;
  String? scheduledAt;
  String? cleanedAt;
  String? abandonedAt;
  int? status;
  String? shortStatus;

  Equipments(
      {this.id,
      this.equipmentName,
      this.parentId,
      this.parentName,
      this.moduleQuantity,
      this.cleaningDay,
      this.scheduledAt,
      this.cleanedAt,
      this.abandonedAt,
      this.status,
      this.shortStatus});

  factory Equipments.fromJson(Map<String, dynamic> json) => Equipments(
        id: json['id'],
        equipmentName: json['equipmentName'],
        parentId: json['parentId'],
        parentName: json['parentName'],
        moduleQuantity: json['moduleQuantity'],
        cleaningDay: json['cleaningDay'],
        scheduledAt: json['scheduledAt'],
        cleanedAt: json['cleanedAt'],
        abandonedAt: json['abandonedAt'],
        status: json['status'],
        shortStatus: json['short_status'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'equipmentName': equipmentName,
        'parentId': parentId,
        'parentName': parentName,
        'moduleQuantity': moduleQuantity,
        'cleaningDay': cleaningDay,
        'scheduledAt': scheduledAt,
        'cleanedAt': cleanedAt,
        'abandonedAt': abandonedAt,
        'status': status,
        'short_status': shortStatus,
      };
}

String vegExecutionModelToJson(Schedules data) =>
    json.encode(data.toJson());
String vegExecutionDetailsModelToJson(Equipments data) =>
    json.encode(data.toJson());
