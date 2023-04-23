import 'dart:convert';

List<CalibrationListModel> calibrationListModelFromJson(String str) =>
    List<CalibrationListModel>.from(
        json.decode(str).map((x) => CalibrationListModel.fromJson(x)));

String calibrationListModelToJson(List<CalibrationListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CalibrationListModel {
  int? asset_id;
  String? asset_name;
  String? category_name;
  String? calibration_status;
  String? last_calibration_date;
  String? vendor_name;
  String? responsible_person;
  String? received_date;
  String? asset_health_status;

  CalibrationListModel(
      {this.asset_health_status,
      this.asset_id,
      this.asset_name,
      this.calibration_status,
      this.category_name,
      this.vendor_name,
      this.received_date,
      this.responsible_person,
      this.last_calibration_date});

  factory CalibrationListModel.fromJson(Map<String, dynamic> json) =>
      CalibrationListModel(
          asset_health_status: json['asset_health_status'] ?? '',
          asset_id: json['asset_id'] ?? 0,
          asset_name: json['asset_name'] ?? '',
          calibration_status: json['calibration_status'] ?? '',
          category_name: json['category_name'] ?? '',
          vendor_name: json['vendor_name'] ?? '',
          received_date: json['received_date'] ?? '',
          responsible_person: json['responsible_person'] ?? '',
          last_calibration_date: json['last_calibration_date'] ?? '');

  Map<String, dynamic> toJson() => {
        "asset_health_status": asset_health_status,
        "asset_id": asset_id,
        "asset_name": asset_name,
        "calibration_status": calibration_status,
        "category_name": category_name,
        "vendor_name": vendor_name,
        "received_date": received_date,
        "responsible_person": responsible_person,
        "last_calibration_date": last_calibration_date
      };
}
