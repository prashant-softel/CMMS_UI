import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

CalibrationDetailModel calibrationDetailModelFromJson(String str) =>
    CalibrationDetailModel.fromJson(json.decode(str));

class CalibrationDetailModel {
  int? calibrationId;
  String? requestApprovedBy;
  String? requestRejectedBy;
  String? requestApprovedAt;
  String? requestRejectedAt;
  dynamic? approvedBy;
  dynamic? rejectedBy;
  String? startedAt;
  String? statusShort;
  String? statusLong;
  String? requestedAt;
  int? requestedBy;
  String? completedAt;
  dynamic? completedBy;
  String? closedAt;
  dynamic? closedBy;
  int? assetId;
  String? assetName;
  dynamic? assetSerial;
  String? categoryName;
  int? statusId;
  dynamic? calibrationStatus;
  String? lastCalibrationDate;
  String? nextCalibrationDueDate;
  int? frequencyId;
  String? frequencyName;
  dynamic? vendorName;
  dynamic? responsiblePerson;
  String? receivedDate;
  dynamic? assetHealthStatus;

  CalibrationDetailModel({
    this.calibrationId,
    this.requestApprovedBy,
    this.requestRejectedBy,
    this.requestApprovedAt,
    this.requestRejectedAt,
    this.approvedBy,
    this.rejectedBy,
    this.startedAt,
    this.statusShort,
    this.statusLong,
    this.requestedAt,
    this.requestedBy,
    this.completedAt,
    this.completedBy,
    this.closedAt,
    this.closedBy,
    this.assetId,
    this.assetName,
    this.assetSerial,
    this.categoryName,
    this.statusId,
    this.calibrationStatus,
    this.lastCalibrationDate,
    this.nextCalibrationDueDate,
    this.frequencyId,
    this.frequencyName,
    this.vendorName,
    this.responsiblePerson,
    this.receivedDate,
    this.assetHealthStatus,
  });

  factory CalibrationDetailModel.fromJson(Map<String, dynamic> json) {
    return CalibrationDetailModel(
      calibrationId: json['calibration_id'],
      requestApprovedBy: json['request_approved_by'],
      requestRejectedBy: json['request_rejected_by'],
      requestApprovedAt:
          Utility.getFormatedyearMonthDay(json['request_approved_at']),
      requestRejectedAt:
          Utility.getFormatedyearMonthDay(json['request_rejected_at']),
      approvedBy: json['approved_by'],
      rejectedBy: json['rejected_by'],
      startedAt: Utility.getFormatedyearMonthDay(json['started_at']),
      statusShort: json['status_short'],
      statusLong: json['status_long'],
      requestedAt: Utility.getFormatedyearMonthDay(json['requested_at']),
      requestedBy: json['requested_by'],
      completedAt: Utility.getFormatedyearMonthDay(json['completed_at']),
      completedBy: json['completed_by'],
      closedAt: Utility.getFormatedyearMonthDay(json['closed_at']),
      closedBy: json['closed_by'],
      assetId: json['asset_id'],
      assetName: json['asset_name'],
      assetSerial: json['asset_serial'],
      categoryName: json['category_name'],
      statusId: json['statusID'],
      calibrationStatus: json['calibration_status'],
      lastCalibrationDate: json['last_calibration_date'],
      nextCalibrationDueDate: json['next_calibration_due_date'],
      frequencyId: json['frequency_id'],
      frequencyName: json['frequency_name'],
      vendorName: json['vendor_name'],
      responsiblePerson: json['responsible_person'],
      receivedDate: json['received_date'],
      assetHealthStatus: json['asset_health_status'],
    );
  }
}
