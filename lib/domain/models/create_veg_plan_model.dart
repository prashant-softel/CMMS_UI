import 'dart:convert';

CreateVegPlanModel createMcPlaningModelFromJson(String str) =>
    CreateVegPlanModel.fromJson(json.decode(str));


class CreateVegPlanModel {
  int? facilityId;
  String? title;
  int? noOfCleaningDays;
  int? frequencyId;
  List<Schedule>? schedule;

  CreateVegPlanModel(
      {this.facilityId,
      this.title,
      this.noOfCleaningDays,
      this.frequencyId,
      this.schedule});

  factory CreateVegPlanModel.fromJson(Map<String, dynamic> json) =>
      CreateVegPlanModel(
        facilityId: json['facilityId'],
        title: json['title'],
        noOfCleaningDays: json['noOfCleaningDays'],
        frequencyId: json['frequencyId'],
        schedule: json["schedule"] != null
            ? List<Schedule>.from(
                json["schedule"].map((x) => Schedule.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "facilityId": facilityId,
        "frequencyId": frequencyId,
        "noOfCleaningDays": noOfCleaningDays,
        "schedule": List<dynamic>.from(schedule!.map((x) => x.toJson())),
      };
}

class Schedule {
  int? cleaningDay;
  List<Equipments>? equipments;

  Schedule({this.cleaningDay, this.equipments});

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        cleaningDay: json['cleaningDay'],
        equipments: json['equipments'] != null
            ? List<Equipments>.from(
                json['elements'].map((x) => Equipments.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() {
    return {
      "cleaningDay": cleaningDay,
      "equipments": List<dynamic>.from(equipments!.map((x) => x)),
    };
  }
}

class Equipments {
  int? id;

  Equipments({this.id});

  factory Equipments.fromJson(Map<String, dynamic> json) =>
      Equipments(id: json['id']);

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

String cereateVegPlanModelToJson(Schedule data) => json.encode(data.toJson());
String createVegPlanModelToJson(Equipments data) => json.encode(data.toJson());
