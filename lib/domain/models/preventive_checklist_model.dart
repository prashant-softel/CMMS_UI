import 'dart:convert';

List<PreventiveCheckListModel> preventiveCheckListModelFromJson(String str) =>
    List<PreventiveCheckListModel>.from(
        json.decode(str).map((x) => PreventiveCheckListModel.fromJson(x)));

String preventiveCheckListModelToJson(List<PreventiveCheckListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PreventiveCheckListModel {
  int id;
  String checklist_number;
  int type;
  int facility_id;
  String facility_name;
  int category_id;
  String category_name;
  int frequency_id;
  String frequency_name;
  int manPower;
  int duration;
  int status;
  int createdById;
  String createdByName;
  String createdAt;
  String updatedAt;
  int updatedById;

  PreventiveCheckListModel({
    required this.id,
    required this.category_id,
    required this.category_name,
    required this.checklist_number,
    required this.createdAt,
    required this.createdById,
    required this.createdByName,
    required this.duration,
    required this.facility_id,
    required this.facility_name,
    required this.frequency_id,
    required this.frequency_name,
    required this.manPower,
    required this.status,
    required this.type,
    required this.updatedAt,
    required this.updatedById,
  });

  factory PreventiveCheckListModel.fromJson(Map<String, dynamic> json) =>
      PreventiveCheckListModel(
        id: json['id'],
        category_id: json['category_id'],
        category_name: json['category_name'],
        type: json['type'],
        facility_id: json['facility_id'],
        frequency_id: json['frequency_id'],
        facility_name: json['facility_name'],
        frequency_name: json['frequency_name'],
        manPower: json['manPower'],
        duration: json['duration'],
        status: json['status'],
        checklist_number: json['checklist_number'],
        createdAt: json['createdAt'],
        createdById: json['createdById'],
        createdByName: json['createdByName'],
        updatedAt: json['updatedAt'],
        updatedById: json['updatedById'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": category_id,
        "category_name": category_name,
        "updatedAt": updatedAt,
        "updatedById": updatedById,
        "type": type,
        "frequency_id": frequency_id,
        "checklist_number": checklist_number,
        "frequency_name": frequency_name,
        "createdByName": createdByName,
        "createdById": createdById,
        "facility_id": facility_id,
        "facility_name": facility_name,
        "status": status,
        "manPower": manPower,
        "duration": duration,
        "createdAt": createdAt,
      };
}
