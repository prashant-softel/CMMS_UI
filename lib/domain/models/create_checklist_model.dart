import 'dart:convert';

String createCheckListToJson(List<CreateChecklist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateChecklist {
  String checklist_number;
  int type;
  int facility_id;
  int category_id;
  int frequency_id;
  int manPower;
  int duration;
  int status;
  int id;

  CreateChecklist(
      {required this.category_id,
      required this.checklist_number,
      required this.type,
      required this.duration,
      required this.facility_id,
      required this.frequency_id,
      required this.manPower,
      required this.status,
      required this.id});

  factory CreateChecklist.fromJson(Map<String, dynamic> json) =>
      CreateChecklist(
        category_id: json['category_id'],
        checklist_number: json['checklist_number'],
        duration: json['duration'],
        manPower: json['manPower'],
        facility_id: json['facility_id'],
        frequency_id: json['frequency_id'],
        status: json['status'],
        type: json['type'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'category_id': category_id,
        'checklist_number': checklist_number,
        'duration': duration,
        'manPower': manPower,
        'facility_id': facility_id,
        'frequency_id': frequency_id,
        'status': status,
        'type': type,
        'id': id,
      };
}
