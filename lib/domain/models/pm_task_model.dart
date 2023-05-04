import 'dart:convert';

import '../../app/utils/utility.dart';

List<PmTaskListModel> pmTaskListModelFromJson(String str) =>
    List<PmTaskListModel>.from(
        json.decode(str).map((x) => PmTaskListModel.fromJson(x)));

String mTaskListModelToJson(List<PmTaskListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PmTaskListModel {
  int? id;
  String? maintenance_order_number;
  String? schedule_date;
  String? completed_date;
  int? equipment_id;
  String? equipment_name;
  int? category_id;
  String? category_name;
  int? frequency_id;
  String? frequency_name;
  String? permit_code;
  int? permit_id;
  int? status;
  String? status_name;

  PmTaskListModel(
      {this.id,
      this.category_id,
      this.completed_date,
      this.equipment_id,
      this.category_name,
      this.equipment_name,
      this.frequency_id,
      this.frequency_name,
      this.maintenance_order_number,
      this.permit_code,
      this.permit_id,
      this.schedule_date,
      this.status,
      this.status_name});

  factory PmTaskListModel.fromJson(Map<String, dynamic> json) =>
      PmTaskListModel(
        id: json['id'] ?? 0,
        category_id: json['category_id'] ?? 0,
        completed_date: json['completed_date'] != null
            ? Utility.getFormatedyearMonthDay(json["completed_date"])
            : json['completed_date'] ?? "-",
        equipment_id: json['equipment_id'] ?? 0,
        category_name: json['category_name'] ?? '',
        equipment_name: json['equipment_name'] ?? '',
        frequency_id: json['frequency_id'] ?? 0,
        frequency_name: json['frequency_name'] ?? '',
        maintenance_order_number: json['maintenance_order_number'] ?? '',
        permit_code: json['permit_code'] ?? '-',
        permit_id: json['permit_id'] ?? 0,
        schedule_date: Utility.getFormatedyearMonthDay(json["schedule_date"]),
        status: json['status'] ?? 0,
        status_name: json['status_name'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": category_id,
        "completed_date": completed_date,
        "equipment_id": equipment_id,
        "category_name": category_name,
        "equipment_name": equipment_name,
        "frequency_id": frequency_id,
        "frequency_name": frequency_name,
        "maintenance_order_number": maintenance_order_number,
        "permit_code": permit_code,
        "permit_id": permit_id,
        "schedule_date": schedule_date,
        "status": status,
        "status_name": status_name,
      };
}
