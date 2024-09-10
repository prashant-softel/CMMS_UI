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
  String? scheduledDate;
  int? noOfDays;
  int? planId;
  String? plannedBy;
  String? plannedAt;
  String? startedBy;
  String? startedAt;
  String? abandonedBy;
  String? abandonedAt;
  int? status;
  String? status_short;
  String? statusLong;
  int? permit_id;
  String? permit_code;
  int? ptw_status;
  int? ptw_tbt_done;
  String? status_short_ptw;
  List<VegSchedules>? schedules;

  VegExecutionDetailsModel({
    this.id,
    this.executionId,
    this.planId,
    this.title,
    this.description,
    this.frequency,
    this.assignedTo,
    this.scheduledDate,
    this.noOfDays,
    this.plannedBy,
    this.plannedAt,
    this.startedBy,
    this.startedAt,
    this.abandonedBy,
    this.abandonedAt,
    this.status,
    this.status_short,
    this.statusLong,
    this.schedules,
    this.permit_id,
    this.permit_code,
    this.ptw_status,
    this.ptw_tbt_done,
    this.status_short_ptw,
  });

  factory VegExecutionDetailsModel.fromJson(Map<String, dynamic> json) =>
      VegExecutionDetailsModel(
        id: json['id'],
        planId: json['planId'],
        executionId: json['executionId'],
        title: json['title'],
        description: json['description'],
        frequency: json['frequency'],
        assignedTo: json['assignedTo'],
        scheduledDate: json['scheduledDate'],
        noOfDays: json['noOfDays'],
        plannedBy: json['plannedBy'],
        plannedAt: json['plannedAt'],
        startedBy: json['startedBy'],
        startedAt: json['startedAt'],
        abandonedBy: json['abandonedBy'],
        abandonedAt: json['abandonedAt'],
        status: json['status'],
        status_short: json['status_short'],
        statusLong: json['status_long'],
        permit_id: json['permit_id'],
        permit_code: json['permit_code'] ?? '',
        ptw_status: json['ptw_status'],
        ptw_tbt_done: json['ptw_tbt_done'],
        schedules: json["schedules"] != null
            ? List<VegSchedules>.from(
                json["schedules"].map((x) => VegSchedules.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'planId': planId,
        'executionId': executionId,
        'title': title,
        'description': description,
        'frequency': frequency,
        'assignedTo': assignedTo,
        'scheduledDate': scheduledDate,
        'noOfDays': noOfDays,
        'plannedBy': plannedBy,
        'plannedAt': plannedAt,
        'startedBy': startedBy,
        'startedAt': startedAt,
        'abandonedBy': abandonedBy,
        'abandonedAt': abandonedAt,
        'status': status,
        'status_short': status_short,
        'status_long': statusLong,
        "permit_id": permit_id,
        "permit_code": permit_code ?? '',
        "ptw_status": ptw_status,
        "ptw_tbt_done": ptw_tbt_done,
        'schedules': List<dynamic>.from(schedules!.map((x) => x))
      };
}

class VegSchedules {
  int? id;
  int? scheduleId;
  int? executionId;
  int? cleaningDay;
  String? cleaningTypeName;
  int? scheduled;
  int? cleaned;
  int? abandoned;
  int? pending;
  int? waterUsed;
  String? start_date;
  String? end_date;
  String? remark;
  String? remark_of_schedule;

  int? status;
  String? status_short;
  int? permit_id;
  String? permit_code;
  int? ptw_status;
  int? ptw_tbt_done;
  String? status_short_ptw;
  List<Equipments>? equipments;

  VegSchedules({
    this.id,
    this.scheduleId,
    this.executionId,
    this.cleaningDay,
    this.cleaningTypeName,
    this.scheduled,
    this.cleaned,
    this.abandoned,
    this.start_date,
    this.end_date,
    this.pending,
    this.waterUsed,
    this.remark,
    this.remark_of_schedule,
    this.status,
    this.status_short,
    this.equipments,
    this.permit_id,
    this.permit_code,
    this.ptw_status,
    this.ptw_tbt_done,
    this.status_short_ptw,
  });

  factory VegSchedules.fromJson(Map<String, dynamic> json) => VegSchedules(
      id: json['id'],
      scheduleId: json['scheduleId'],
      executionId: json['executionId'],
      cleaningDay: json['cleaningDay'],
      cleaningTypeName: json['cleaningTypeName'],
      scheduled: json['scheduled'],
      cleaned: json['cleaned'],
      abandoned: json['abandoned'],
      pending: json['pending'],
      start_date: json['start_date'],
      waterUsed: json['waterUsed'],
      remark: json['remark'] ?? "",
      remark_of_schedule: json['remark_of_schedule'] ?? "",
      status: json['status'],
      status_short: json['status_short'],
      permit_id: json['permit_id'],
      permit_code: json['permit_code'] ?? '',
      ptw_status: json['ptw_status'],
      ptw_tbt_done: json['ptw_tbt_done'],
      status_short_ptw:
          json['status_short_ptw'] == 'Invalid' ? '' : json['status_short_ptw'],
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
        'scheduled': scheduled,
        'cleaned': cleaned,
        'abandoned': abandoned,
        'pending': pending,
        'waterUsed': waterUsed,
        'remark_of_schedule': remark_of_schedule,
        'remark': remark,
        'status': status,
        'status_short': status_short,
        "permit_id": permit_id,
        "permit_code": permit_code ?? '',
        "ptw_status": ptw_status,
        "ptw_tbt_done": ptw_tbt_done,
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

String vegExecutionModelToJson(VegSchedules data) => json.encode(data.toJson());
String vegExecutionDetailsModelToJson(Equipments data) =>
    json.encode(data.toJson());
