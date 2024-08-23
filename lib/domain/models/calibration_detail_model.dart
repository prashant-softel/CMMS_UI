import 'dart:convert';
import 'package:cmms/app/utils/utility.dart';

// Converts JSON string to CalibrationDetailModel
CalibrationDetailModel calibrationDetailModelFromJson(String str) =>
    CalibrationDetailModel.fromJson(json.decode(str));

// The CalibrationDetailModel class
class CalibrationDetailModel {
  int? calibrationId;
  String? requestApprovedBy;
  String? requestRejectedBy;
  String? requestApprovedAt;
  String? requestRejectedAt;
  dynamic approvedBy;
  dynamic rejectedBy;
  String? startedAt;
  String? statusShort;
  String? statusLong;
  String? requestedAt;
  dynamic requestedBy;
  String? completedAt;
  dynamic completedBy;
  String? closedAt;
  dynamic closedBy;
  int? assetId;
  String? assetName;
  String? assetSerial;
  String? categoryName;
  int? statusId;
  String? calibrationStatus;
  String? lastCalibrationDate;
  String? nextCalibrationDueDate;
  String? scheduleStartDate;
  String? lastCalibrationDueDate;
  String? calibrationDate;
  int? frequencyId;
  String? frequencyName;
  String? vendorName;
  String? responsiblePerson;
  String? receivedDate;
  String? assetHealthStatus;
  int? isDamaged;
  List<FileList>? fileList;
  List<FileList>? file_list_calibration;

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
      this.scheduleStartDate,
      this.lastCalibrationDueDate,
      this.calibrationDate,
      this.frequencyId,
      this.frequencyName,
      this.vendorName,
      this.responsiblePerson,
      this.receivedDate,
      this.assetHealthStatus,
      this.isDamaged,
      this.fileList,
      this.file_list_calibration});

  factory CalibrationDetailModel.fromJson(Map<String, dynamic> json) {
    return CalibrationDetailModel(
      calibrationId: json['calibration_id'],
      requestApprovedBy: json['request_approved_by'],
      requestRejectedBy: json['request_rejected_by'],
      requestApprovedAt: json['request_approved_at'] == null
          ? null
          : Utility.getFormatedyearMonthDay(json['request_approved_at']),
      requestRejectedAt: json['request_rejected_at'] == null
          ? null
          : Utility.getFormatedyearMonthDay(json['request_rejected_at']),
      approvedBy: json['approved_by'],
      rejectedBy: json['rejected_by'],
      startedAt: json['started_at'] == null
          ? null
          : Utility.getFormatedyearMonthDay(json['started_at']),
      statusShort: json['status_short'],
      statusLong: json['status_long'],
      requestedAt: json['requested_at'] == null
          ? null
          : Utility.getFormatedyearMonthDay(json['requested_at']),
      requestedBy: json['requested_by'],
      completedAt: json['completed_at'] == null
          ? null
          : Utility.getFormatedyearMonthDay(json['completed_at']),
      completedBy: json['completed_by'],
      closedAt: json['closed_at'] == null
          ? null
          : Utility.getFormatedyearMonthDay(json['closed_at']),
      closedBy: json['closed_by'],
      assetId: json['asset_id'],
      assetName: json['asset_name'],
      assetSerial: json['asset_serial'],
      categoryName: json['category_name'],
      statusId: json['statusID'],
      calibrationStatus: json['calibration_status'],
      lastCalibrationDate: json['last_calibration_date'] == null
          ? null
          : Utility.getFormatedyearMonthDay(json['last_calibration_date']),
      nextCalibrationDueDate: json['next_calibration_due_date'] == null
          ? null
          : Utility.getFormatedyearMonthDay(json['next_calibration_due_date']),
      frequencyId: json['frequency_id'],
      frequencyName: json['frequency_name'],
      vendorName: json['vendor_name'],
      scheduleStartDate: json['schedule_start_date'] == null
          ? null
          : Utility.getFormatedyearMonthDay(json['schedule_start_date']),
      calibrationDate: json['calibration_due_date'] == null
          ? null
          : Utility.getFormatedyearMonthDay(json['calibration_due_date']),
      lastCalibrationDueDate: json['last_calibration_due_date'] == null
          ? null
          : Utility.getFormatedyearMonthDay(json['last_calibration_due_date']),
      responsiblePerson: json['responsible_person'],
      receivedDate: json['received_date'] == null
          ? null
          : Utility.getFormatedyearMonthDay(json['received_date']),
      assetHealthStatus: json['asset_health_status'],
      isDamaged: json['is_damaged'] ?? 0,
      fileList: json['file_list'] != null
          ? List<FileList>.from(
              json['file_list'].map((x) => FileList.fromJson(x)))
          : [],
      file_list_calibration: json['file_list_calibration'] != null
          ? List<FileList>.from(
              json['file_list_calibration'].map((x) => FileList.fromJson(x)))
          : [],
    );
  }
}

// The FileList class
class FileList {
  int? id;
  String? fileName;
  String? fileCategory;
  int? fileSize;
  int? status;
  String? description;
  String? created_at;
  String? created_by;

  FileList(
      {this.id,
      this.fileName,
      this.fileCategory,
      this.fileSize,
      this.status,
      this.description,
      this.created_by,
      this.created_at});

  factory FileList.fromJson(Map<String, dynamic> json) => FileList(
        id: json['id'],
        fileName: json['fileName'],
        fileCategory: json['fileCategory'],
        fileSize: json['fileSize'],
        status: json['status'],
        description: json['description'] ?? '',
        created_by: json['created_by'] ?? '',
        created_at: json['created_at'] == null
            ? null
            : Utility.getFormatedyearMonthDay(json['created_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': created_at,
        'created_by': created_by,
        'fileName': fileName,
        'fileCategory': fileCategory,
        'fileSize': fileSize,
        'status': status,
        'description': description,
      };
}
