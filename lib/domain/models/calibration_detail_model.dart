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
  dynamic approvedBy;
  dynamic rejectedBy;
  String? startedAt;
  dynamic statusShort;
  dynamic statusLong;
  dynamic requestedAt;
  dynamic requestedBy;
  dynamic completedAt;
  dynamic completedBy;
  dynamic closedAt;
  dynamic closedBy;
  int? assetId;
  dynamic assetName;
  dynamic assetSerial;
  dynamic categoryName;
  int? statusId;
  dynamic calibrationStatus;
  dynamic lastCalibrationDate;
  dynamic nextCalibrationDueDate;
  int? frequencyId;
  dynamic frequencyName;
  dynamic vendorName;
  dynamic responsiblePerson;
  dynamic receivedDate;
  dynamic assetHealthStatus;
  int? is_damaged;
  CalibrationDetailModel(
      {this.calibrationId,
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
      this.is_damaged});

  factory CalibrationDetailModel.fromJson(Map<String, dynamic> json) {
    return CalibrationDetailModel(
      calibrationId: json['calibration_id'],
      is_damaged: json['is_damaged'] ?? 0,
      requestApprovedBy: json['request_approved_by'],
      requestRejectedBy: json['request_rejected_by'],
      requestApprovedAt: json['request_approved_at'] == null
          ? ""
          : Utility.getFormatedyearMonthDay(json['request_approved_at']),
      requestRejectedAt: json['request_rejected_at'],
      //     ? ""
      //     : Utility.getFormatedyearMonthDay(json['request_rejected_at']),
      approvedBy: json['approved_by'],
      rejectedBy: json['rejected_by'],
      startedAt: json['started_at'],
      //     ? ""
      //     : Utility.getFormatedyearMonthDay(json['started_at']),
      statusShort: json['status_short'],
      statusLong: json['status_long'],
      requestedAt: json['requested_at'],
      // ? ""
      // : Utility.getFormatedyearMonthDay(json['requested_at']),
      requestedBy: json['requested_by'],
      completedAt: json['completed_at'],
      //     ? ""
      //     : Utility.getFormatedyearMonthDay(json['completed_at']),
      completedBy: json['completed_by'],
      closedAt: json['closed_at'],
      //     ? ""
      //     : Utility.getFormatedyearMonthDay(json['closed_at']),
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
