import 'dart:convert';

CreateMcPalningsModel createMcPlaningModelFromJson(String str) =>
    CreateMcPalningsModel.fromJson(json.decode(str));

// String endMCExecutionDetailsModelToJson(CreateMcPalningsModel data) =>
//     json.encode(data.toJson());

class CreateMcPalningsModel {
  int? resubmit;
  int? facilityId;
  int? planId;
  String? title;
  String? startDate;
  int? noOfCleaningDays;
  // int? assignedToId;
  int? frequencyId;
  int? cleaningType;
  int? assignedToId;

  List<Schedule> schedules;

  CreateMcPalningsModel({
    this.title,
    this.resubmit,
    this.facilityId,
    this.startDate,
    // this.assignedToId,
    this.planId,
    this.frequencyId,
    this.cleaningType,
    this.noOfCleaningDays,
    this.assignedToId,
    this.schedules = const [],
  });

  factory CreateMcPalningsModel.fromJson(Map<String, dynamic> json) =>
      CreateMcPalningsModel(
        facilityId: json['facilityId'],
        resubmit: json['resubmit'],
        title: json['title'] ?? '',
        startDate: json['startDate'],
        assignedToId: json['assignedToId'],

        // assignedToId: json['assignedToId'],
        planId: json['planId'],
        frequencyId: json["frequencyId"],
        cleaningType: json["cleaningType"],
        noOfCleaningDays: json['crnoOfCleaningDayseatedAt'],
        schedules: json["schedules"] != null
            ? List<Schedule>.from(
                json["schedules"].map((x) => Schedule.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "resubmit": resubmit,
        "title": title,
        "facilityId": facilityId,
        "startDate": startDate,
        "assignedToId": assignedToId,
        "planId": planId,
        "frequencyId": frequencyId,
        "cleaningType": cleaningType,
        "noOfCleaningDays": noOfCleaningDays,
        "schedules": List<dynamic>.from(schedules.map((x) => x.toJson())),
      };
}

class Schedule {
  Schedule({
    this.cleaningDay,
    this.cleaningType,
    this.equipments,
    this.scheduleId,
  });

  int? cleaningDay;
  int? cleaningType;
  List<Equipments?>? equipments;
  int? scheduleId;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        cleaningDay: json['cleaningDay'],
        scheduleId: json['scheduleId'],
        cleaningType: json['cleaningType'],
        equipments: json["equipments"] != null
            ? List<Equipments>.from(
                json["equipments"].map((x) => Equipments.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() {
    var initialData = {
      "cleaningDay": cleaningDay,
      "scheduleId": scheduleId,
      "equipments": List<dynamic>.from(equipments!.map((x) => x)),
    };
    if (cleaningType != null) {
      initialData["cleaningType"] = cleaningType;
    }
    return initialData;
  }
}

///Equipments List Detail Model
class Equipments {
  Equipments({
    this.id,
  });

  int? id;

  factory Equipments.fromJson(Map<String, dynamic> json) => Equipments(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

String createMcModelToJson(Schedule data) => json.encode(data.toJson());
String createMcDetailModelToJson(Equipments data) => json.encode(data.toJson());
