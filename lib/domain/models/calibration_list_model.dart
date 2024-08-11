import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<CalibrationListModel> calibrationListModelFromJson(String str) =>
    List<CalibrationListModel>.from(
        json.decode(str).map((x) => CalibrationListModel.fromJson(x)));

String calibrationListModelToJson(List<CalibrationListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CalibrationListModel {
  int? calibration_id;
  int? asset_id;
  String? asset_name;
  String? asset_serial;
  String? schedule_start_date;
  String? category_name;
  int? statusID;
  String? calibration_status;
  String? last_calibration_date;
  String? next_calibration_due_date;
  String? calibration_due_date;
  String? last_calibration_due_date;
  String? calibration_date;
  int? is_damaged;
  int? frequency_id;
  String? frequency_name;
  int? vendor_id;
  String? vendor_name;
  String? responsible_person;
  String? received_date;
  String? asset_health_status;
  CalibrationListModel(
      {this.asset_health_status,
      this.calibration_id,
      this.asset_id,
      this.asset_name,
      this.schedule_start_date,
      this.calibration_status,
      this.category_name,
      this.vendor_name,
      this.received_date,
      this.responsible_person,
      this.last_calibration_date,
      this.asset_serial,
      this.frequency_id,
      this.frequency_name,
      this.next_calibration_due_date,
      this.vendor_id,
      this.statusID,
      this.calibration_date,
      this.calibration_due_date,
      this.last_calibration_due_date,
      this.is_damaged});

  factory CalibrationListModel.fromJson(Map<String, dynamic> json) =>
      CalibrationListModel(
        asset_health_status: json['asset_health_status'] ?? '',
        calibration_date: json['calibration_date'] == null
            ? json['calibration_date']
            : Utility.getFormatedyearMonthDay(json['calibration_date']),
        calibration_due_date: json['calibration_due_date'] == null
            ? json['calibration_due_date']
            : Utility.getFormatedyearMonthDay(json['calibration_due_date']),
        last_calibration_due_date: json['last_calibration_due_date'] == null
            ? json['last_calibration_due_date']
            : Utility.getFormatedyearMonthDay(
                json['last_calibration_due_date']),
        asset_id: json['asset_id'] ?? 0,
        calibration_id: json['calibration_id'] ?? 0,
        statusID: json['statusID'] ?? 0, is_damaged: json['is_damaged'],
        asset_name: json['asset_name'] ?? '',
        frequency_id: json['frequency_id'] ?? 0,
        frequency_name: json['frequency_name'] ?? '',
        next_calibration_due_date: json['next_calibration_due_date'] == null
            ? json['next_calibration_due_date']
            : Utility.getFormatedyearMonthDay(
                json['next_calibration_due_date']),
        // schedule_start_date: json['schedule_start_date'] == null
        //     ? json['schedule_start_date']
        //     : Utility.getFormatedyearMonthDay(json['schedule_start_date']),

        schedule_start_date: (json['schedule_start_date'] == null ||
                json['schedule_start_date'] == '0001-01-01T00:00:00')
            ? "-"
            : Utility.getFormatedyearMonthDay(json['schedule_start_date']),
        asset_serial: json['asset_serial'] ?? '',
        calibration_status: json['calibration_status'] ?? '',
        category_name: json['category_name'] ?? '',
        vendor_name: json['vendor_name'] ?? '',
        received_date: json['received_date'] == null
            ? json['received_date']
            : Utility.getFormatedyearMonthDay(json['received_date']),
        responsible_person: json['responsible_person'] ?? '',
        last_calibration_date: json['last_calibration_date'] == null
            ? json['last_calibration_date']
            : Utility.getFormatedyearMonthDay(json['last_calibration_date']),
      );
  Map<String, dynamic> toJson() => {
        "asset_health_status": asset_health_status,
        "calibration_date": calibration_date,
        "calibration_due_date": calibration_due_date,
        "last_calibration_due_date": last_calibration_due_date,
        "asset_id": asset_id,
        "calibration_id": calibration_id,
        "is_damaged": is_damaged,
        "frequency_id": frequency_id,
        "frequency_name": frequency_name,
        "schedule_start_date": schedule_start_date,
        "next_calibration_due_date": next_calibration_due_date,
        "statusID": statusID,
        "asset_name": asset_name,
        "asset_serial": asset_serial,
        "calibration_status": calibration_status,
        "category_name": category_name,
        "vendor_name": vendor_name,
        "received_date": received_date,
        "responsible_person": responsible_person,
        "last_calibration_date": last_calibration_date
      };
}
