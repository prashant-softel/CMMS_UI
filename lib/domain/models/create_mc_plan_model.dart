import 'dart:convert';

CreateMcPalningsModel createMcPlaningModelFromJson(String str) =>
    CreateMcPalningsModel.fromJson(json.decode(str));

// String endMCExecutionDetailsModelToJson(CreateMcPalningsModel data) =>
//     json.encode(data.toJson());

class CreateMcPalningsModel {
  int? facilityId;
  String? title;
  int? noOfCleaningDays;
  int? frequencyId;

  List<Schedule> schedules;

  CreateMcPalningsModel({
    this.title,
    this.facilityId,
    this.frequencyId,
    this.noOfCleaningDays,
    this.schedules = const [],
  });

  factory CreateMcPalningsModel.fromJson(Map<String, dynamic> json) =>
      CreateMcPalningsModel(
        facilityId: json['facilityId'],
        title: json['title'] ?? '',
        frequencyId: json["frequencyId"],
        noOfCleaningDays: json['crnoOfCleaningDayseatedAt'],
        schedules: json["schedules"] != null
            ? List<Schedule>.from(
                json["schedules"].map((x) => Schedule.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "facilityId": facilityId,
        "frequencyId": frequencyId,
        "noOfCleaningDays": noOfCleaningDays,
        "schedules": List<dynamic>.from(schedules!.map((x) => x)),
      };
}

class Schedule {
  Schedule({
    this.cleaningDay,
    this.cleaningType,
    this.equipments,
  });

  int? cleaningDay;
  int? cleaningType;
  List<Equipments?>? equipments;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        cleaningDay: json['cleaningDay'],
        cleaningType: json['cleaningType'],
        equipments: json["equipments"] != null
            ? List<Equipments>.from(
                json["equipments"].map((x) => Equipments.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "cleaningDay": cleaningDay,
        "cleaningType": cleaningType,
        "equipments": List<dynamic>.from(equipments!.map((x) => x)),
      };
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
