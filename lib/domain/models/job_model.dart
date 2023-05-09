import 'dart:convert';

import 'package:flutter/material.dart';

import '../../app/utils/app_constants.dart';

List<JobModel> jobListFromJson(String str) =>
    List<JobModel>.from(json.decode(str).map(JobModel.fromJson));

String jobListToJson(List<JobModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobModel {
  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        id: json['id'] == null ? 0 : json['id'],
        userId: json['userId'] == null ? 0 : json['userId'],
        facilityId: json['facility_id'] == null ? 0 : json['facility_id'],
        facilityName:
            json['facilityName'] == null ? null : json['facilityName'],
        jobDate:
            json['jobDate'] == null ? null : DateTime.parse(json['jobDate']),
        equipmentCat:
            json['equipmentCat'] == null ? null : json['equipmentCat'],
        workingArea: json['workingArea'] == null ? null : json['workingArea'],
        description: json['description'] == null ? null : json['description'],
        jobDetails: json['jobDetails'] == null ? null : json['jobDetails'],
        workType: json['workType'] == null ? null : json['workType'] ?? '',
        raisedBy: json['raisedBy'] == null ? null : json['raisedBy'] ?? '',
        raisedByName:
            json['raisedByName'] == null ? null : json['raisedByName'] ?? '',
        breakdownTime: json['breakdownTime'] == null
            ? null
            : DateTime.parse(json['breakdownTime'] as String),
        breakdownType:
            json['breakdownType'] == null ? null : json['breakdownType'] ?? '',
        permitId: json['permitId'] == null ? null : json['permitId'] ?? '',
        assignedToName: json['assignedToName'] == null
            ? null
            : json['assignedToName'] ?? '',
        assignedToId:
            json['assignedToId'] == null ? null : json['assignedToId'] ?? '',
        status: json['status'] == null
            ? null
            : JobStatusData.statusValues.entries
                .firstWhere(
                  (x) => x.value.index == json['status'] - 101,
                  orElse: () => MapEntry("CREATED", JobStatus.JOB_CREATED),
                )
                .value,
      );

  ///
  JobModel({
    this.id,
    this.userId,
    this.facilityId,
    this.facilityName,
    this.jobDate,
    this.equipmentCat,
    this.workingArea,
    this.description,
    this.jobDetails,
    this.workType,
    this.raisedBy,
    this.raisedByName,
    this.breakdownTime,
    this.breakdownType,
    this.permitId,
    this.assignedToName,
    this.assignedToId,
    this.status,
  });

  int? id;
  int? userId;
  int? facilityId;
  String? facilityName;
  DateTime? jobDate;
  String? equipmentCat;
  String? workingArea;
  String? description;
  String? jobDetails;
  String? workType;
  int? raisedBy;
  String? raisedByName;
  DateTime? breakdownTime;
  String? breakdownType;
  String? permitId;
  String? assignedToName;
  int? assignedToId;

  JobStatus? status;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'facility_id': facilityId,
        'facilityName': facilityName,
        'jobDate': jobDate?.toIso8601String(),
        'equipmentCat': equipmentCat,
        'workingArea': workingArea,
        'description': description,
        'jobDetails': jobDetails,
        'workType': workType,
        'raisedBy': raisedBy,
        'raisedByName': raisedByName,
        'breakdownTime': breakdownTime,
        'breakdownType': breakdownType,
        'permitId': permitId,
        'assignedToName': assignedToName,
        'assignedToId': assignedToId,
        'status': JobStatusData.statusValues.entries
            .firstWhere((x) => x.value == status,
                orElse: () => MapEntry("CREATED", JobStatus.JOB_CREATED))
            .key,
      };

  ///
}

class JobStatusData {
  static Map<String, JobStatus> statusValues = {
    AppConstants.kJobStatusCreated: JobStatus.JOB_CREATED,
    AppConstants.kJobStatusAssigned: JobStatus.JOB_ASSIGNED,
    AppConstants.kJobStatusLinkedToPermit: JobStatus.JOB_LINKED,
    AppConstants.kJobStatusInProgress: JobStatus.JOB_IN_PROGRESS,
    AppConstants.kJobStatusCaryForward: JobStatus.JOB_CARRY_FORWARD,
    AppConstants.kJobStatusClosed: JobStatus.JOB_CLOSED,
    AppConstants.kJobStatusCancelled: JobStatus.JOB_CANCELLED,
    AppConstants.kJobStatusDeleted: JobStatus.JOB_DELETED,
  };

  static const Map<JobStatus, Color> statusColors = {
    JobStatus.JOB_CREATED: Color(0xff58c3ca),
    JobStatus.JOB_ASSIGNED: Color(0xff58c352),
    JobStatus.JOB_LINKED: Color.fromARGB(255, 175, 170, 195),
    JobStatus.JOB_IN_PROGRESS: Color(0xffbf8c4b),
    JobStatus.JOB_CARRY_FORWARD: Colors.orange,
    JobStatus.JOB_CLOSED: Color(0xff3438cd),
    JobStatus.JOB_CANCELLED: Color(0xffbf4844),
    JobStatus.JOB_DELETED: Colors.red,
  };
  static Color getStatusColor(String strJobStatus) {
    if (strJobStatus == null) {
      return Colors.grey;
    }

    JobStatus? status = JobStatusData.statusValues[strJobStatus];
    return status != null
        ? JobStatusData.statusColors[status] ?? Colors.grey
        : Colors.grey;
  }

  static String getStatusStringFromInt(int? intStatus) {
    if (intStatus == null) {
      return 'UNKNOWN';
    }

    final jobStatus = JobStatus.values.firstWhere(
        (x) => x.index == (intStatus - 101),
        orElse: () => JobStatus.JOB_CREATED);
    final statusString = JobStatusData.statusValues.entries
        .firstWhere((x) => x.value == jobStatus,
            orElse: () => MapEntry("CREATED", JobStatus.JOB_CREATED))
        .key;
    return statusString;
  }

  static String getStatusStringFromStatusEnumValue(JobStatus? statusEnum) {
    if (statusEnum == null) {
      return 'UNKNOWN';
    }

    final statusString = JobStatusData.statusValues.entries
        .firstWhere((x) => x.value == statusEnum,
            orElse: () => MapEntry("CREATED", JobStatus.JOB_CREATED))
        .key;
    return statusString;
  }

  ///
}

enum JobStatus {
  JOB_CREATED,
  JOB_ASSIGNED,
  JOB_LINKED,
  JOB_IN_PROGRESS,
  JOB_CARRY_FORWARD,
  JOB_CLOSED,
  JOB_CANCELLED,
  JOB_DELETED,
}
