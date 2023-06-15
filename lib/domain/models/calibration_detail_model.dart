import 'dart:convert';

CalibrationDetailModel calibrationDetailModelFromJson(String str) =>
    CalibrationDetailModel.fromJson(json.decode(str));

class CalibrationDetailModel {
  final int calibrationId;
  final DateTime requestApprovedBy;
  final DateTime requestRejectedBy;
  final DateTime requestApprovedAt;
  final DateTime requestRejectedAt;
  final dynamic approvedBy;
  final dynamic rejectedBy;
  final DateTime startedAt;
  final String statusShort;
  final String statusLong;
  final DateTime requestedAt;
  final int requestedBy;
  final DateTime completedAt;
  final dynamic completedBy;
  final DateTime closedAt;
  final dynamic closedBy;
  final int assetId;
  final String assetName;
  final dynamic assetSerial;
  final String categoryName;
  final int statusId;
  final dynamic calibrationStatus;
  final DateTime lastCalibrationDate;
  final DateTime nextCalibrationDueDate;
  final int frequencyId;
  final String frequencyName;
  final dynamic vendorName;
  final dynamic responsiblePerson;
  final DateTime receivedDate;
  final dynamic assetHealthStatus;

  CalibrationDetailModel({
    required this.calibrationId,
    required this.requestApprovedBy,
    required this.requestRejectedBy,
    required this.requestApprovedAt,
    required this.requestRejectedAt,
    required this.approvedBy,
    required this.rejectedBy,
    required this.startedAt,
    required this.statusShort,
    required this.statusLong,
    required this.requestedAt,
    required this.requestedBy,
    required this.completedAt,
    required this.completedBy,
    required this.closedAt,
    required this.closedBy,
    required this.assetId,
    required this.assetName,
    required this.assetSerial,
    required this.categoryName,
    required this.statusId,
    required this.calibrationStatus,
    required this.lastCalibrationDate,
    required this.nextCalibrationDueDate,
    required this.frequencyId,
    required this.frequencyName,
    required this.vendorName,
    required this.responsiblePerson,
    required this.receivedDate,
    required this.assetHealthStatus,
  });

  factory CalibrationDetailModel.fromJson(Map<String, dynamic> json) {
    return CalibrationDetailModel(
      calibrationId: json['calibration_id'],
      requestApprovedBy: DateTime.parse(json['request_approved_by']),
      requestRejectedBy: DateTime.parse(json['request_rejected_by']),
      requestApprovedAt: DateTime.parse(json['request_approved_at']),
      requestRejectedAt: DateTime.parse(json['request_rejected_at']),
      approvedBy: json['approved_by'],
      rejectedBy: json['rejected_by'],
      startedAt: DateTime.parse(json['started_at']),
      statusShort: json['status_short'],
      statusLong: json['status_long'],
      requestedAt: DateTime.parse(json['requested_at']),
      requestedBy: json['requested_by'],
      completedAt: DateTime.parse(json['completed_at']),
      completedBy: json['completed_by'],
      closedAt: DateTime.parse(json['closed_at']),
      closedBy: json['closed_by'],
      assetId: json['asset_id'],
      assetName: json['asset_name'],
      assetSerial: json['asset_serial'],
      categoryName: json['category_name'],
      statusId: json['statusID'],
      calibrationStatus: json['calibration_status'],
      lastCalibrationDate: DateTime.parse(json['last_calibration_date']),
      nextCalibrationDueDate: DateTime.parse(json['next_calibration_due_date']),
      frequencyId: json['frequency_id'],
      frequencyName: json['frequency_name'],
      vendorName: json['vendor_name'],
      responsiblePerson: json['responsible_person'],
      receivedDate: DateTime.parse(json['received_date']),
      assetHealthStatus: json['asset_health_status'],
    );
  }
}
