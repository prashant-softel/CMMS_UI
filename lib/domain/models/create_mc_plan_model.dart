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

  List<Schedules> schedules;

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
            ? List<Schedules>.from(
                json["schedules"].map((x) => Schedules.fromJson(x)))
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

class Schedules {
  Schedules({
    this.cleaningDay,
    this.cleaningType,
    this.equipments,
  });

  int? cleaningDay;
  int? cleaningType;
  List<EquipmentsList?>? equipments;

  factory Schedules.fromJson(Map<String, dynamic> json) => Schedules(
        cleaningDay: json['cleaningDay'],
        cleaningType: json['cleaningType'],
        equipments: json["equipments"] != null
            ? List<EquipmentsList>.from(
                json["equipments"].map((x) => EquipmentsList.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "cleaningDay": cleaningDay,
        "cleaningType": cleaningType,
        "equipments": List<dynamic>.from(equipments!.map((x) => x)),
      };
}

///Equipments List Detail Model
class EquipmentsList {
  EquipmentsList({
    this.id,
  });

  int? id;

  factory EquipmentsList.fromJson(Map<String, dynamic> json) => EquipmentsList(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

String createMcModelToJson(Schedules data) => json.encode(data.toJson());
String createMcDetailModelToJson(EquipmentsList data) =>
    json.encode(data.toJson());
