import 'dart:convert';

List<JobModel> jobListFromJson(String str) =>
    List<JobModel>.from(json.decode(str).map(JobModel.fromJson));

String jobListToJson(List<JobModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobModel {
  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        id: json['id'] == null ? 0 : json['id'],
        latestJCPTWStatus:
            json['latestJCPTWStatus'] == null ? 0 : json['latestJCPTWStatus'],
        ptw_id: json['ptw_id'] == null ? 0 : json['ptw_id'],
        userId: json['userId'] == null ? 0 : json['userId'],
        isolation: json['isolation'] == null ? 0 : json['isolation'],

        facilityId: json['facilityId'] == null ? 0 : json['facilityId'],
        facilityName:
            json['facilityName'] == null ? null : json['facilityName'],
        jobDate:
            json['jobDate'] == null ? null : DateTime.parse(json['jobDate']),
        equipmentCat:
            json['equipmentCat'] == null ? null : json['equipmentCat'],
        workingArea: json['workingArea'] == null ? null : json['workingArea'],
        description: json['description'] == null ? null : json['description'],
        name: json['jobDetails'] == null ? null : json['jobDetails'],
        workType: json['workType'] == null ? null : json['workType'] ?? '',
        raisedBy: json['raisedBy'] == null ? null : json['raisedBy'] ?? '',
        raisedByName:
            json['raisedByName'] == null ? null : json['raisedByName'] ?? '',
        breakdownTime: json['breakdownTime'] == null
            ? null
            : DateTime.parse(json['breakdownTime'] as String),
        breakdownType:
            json['breakdownType'] == null ? null : json['breakdownType'] ?? '',
        permitId: json['permitId'] == null ? "" : json['permitId'] ?? '',
        assignedToName:
            json['assignedToName'] == null ? "" : json['assignedToName'] ?? '',
        permitType: json['permitType'] == null ? "" : json['permitType'] ?? '',
        assignedToId:
            json['assignedToId'] == null ? null : json['assignedToId'] ?? '',
        latestJCStatusShort: json['latestJCStatusShort'] == null
            ? null
            : json['latestJCStatusShort'] ?? '',
        status: json['status'] == null ? null : json['status'] ?? '',
        latestJCStatus: json['latestJCStatus'] == null
            ? null
            : json['latestJCStatus'] ?? '',
        status_short:
            json['status_short'] == null ? null : json['status_short'] ?? '',

        // : JobStatusData.statusValues.entries
        //     .firstWhere(
        //       (x) => x.value.index == json['status'] - 101,
        //       orElse: () => MapEntry("CREATED", JobStatus.JOB_CREATED),
        //     )
        //     .value,
      );

  ///
  JobModel(
      {this.id,
      this.ptw_id,
      this.userId,
      this.facilityId,
      this.facilityName,
      this.jobDate,
      this.equipmentCat,
      this.workingArea,
      this.description,
      this.name,
      this.workType,
      this.raisedBy,
      this.raisedByName,
      this.breakdownTime,
      this.breakdownType,
      this.permitId,
      this.assignedToName,
      this.assignedToId,
      this.status,
      this.status_short,
      this.latestJCStatusShort,
      this.latestJCStatus,
      this.permitType,
      this.latestJCPTWStatus,
      this.isolation});

  int? id;
  int? ptw_id;
  int? userId;
  int? facilityId;
  String? facilityName;
  DateTime? jobDate;
  String? equipmentCat;
  String? workingArea;
  String? description;
  String? name;
  String? workType;
  int? raisedBy;
  String? raisedByName;
  DateTime? breakdownTime;
  String? breakdownType;
  String? permitId;
  String? assignedToName;
  int? assignedToId;
  int? latestJCStatus;
  String? status_short;
  dynamic permitType;
  int? status;
  String? latestJCStatusShort;
  int? isolation;
  int? latestJCPTWStatus;
  Map<String, dynamic> toJson() => {
        'id': id, "permitType": permitType, "isolation": isolation,
        'ptw_id': ptw_id,
        'userId': userId, 'latestJCPTWStatus': latestJCPTWStatus,
        'facilityId': facilityId,
        'facilityName': facilityName,
        'jobDate': jobDate?.toIso8601String(),
        'equipmentCat': equipmentCat,
        'workingArea': workingArea,
        'description': description,
        'jobDetails': name,
        'workType': workType,
        'raisedBy': raisedBy,
        'raisedByName': raisedByName,
        'breakdownTime': breakdownTime?.toIso8601String(),
        'breakdownType': breakdownType,
        'permitId': permitId,
        'assignedToName': assignedToName,
        'assignedToId': assignedToId,
        'latestJCStatusShort': latestJCStatusShort,
        'latestJCStatus': latestJCStatus,
        "status_short": status_short,
        'status': status //JobStatusData.statusValues.entries
        //     .firstWhere((x) => x.value == status,
        //         orElse: () => MapEntry("CREATED", JobStatus.JOB_CREATED))
        //     .key,
      };

  ///
}

//  class JobStatusData {
//   static Map<String, JobStatus> statusValues = {
//     AppConstants.kJobStatusCreated: JobStatus.JOB_CREATED,
//     AppConstants.kJobStatusAssigned: JobStatus.JOB_ASSIGNED,
//     AppConstants.kJobStatusLinkedToPermit: JobStatus.JOB_LINKED,
//     AppConstants.kJobStatusInProgress: JobStatus.JOB_IN_PROGRESS,
//     AppConstants.kJobStatusCaryForward: JobStatus.JOB_CARRY_FORWARD,
//     AppConstants.kJobStatusClosed: JobStatus.JOB_CLOSED,
//     AppConstants.kJobStatusCancelled: JobStatus.JOB_CANCELLED,
//     AppConstants.kJobStatusDeleted: JobStatus.JOB_DELETED,
//   };

//   static const Map<JobStatus, Color> statusColors = {
//     JobStatus.JOB_CREATED: Color(0xff58c3ca),
//     JobStatus.JOB_ASSIGNED: Color(0xff58c352),
//     JobStatus.JOB_LINKED: ColorValues.linktopermitColor,
//     JobStatus.JOB_IN_PROGRESS: Color(0xffbf8c4b),
//     JobStatus.JOB_CARRY_FORWARD: Colors.orange,
//     JobStatus.JOB_CLOSED: Color(0xff3438cd),
//     JobStatus.JOB_CANCELLED: Color(0xffbf4844),
//     JobStatus.JOB_DELETED: Colors.red,
//   };
//   static Color getStatusColor(String strJobStatus) {
//     if (strJobStatus == null) {
//       return Colors.grey;
//     }

//     JobStatus? status = JobStatusData.statusValues[strJobStatus];
//     return status != null
//         ? JobStatusData.statusColors[status] ?? Colors.grey
//         : Colors.grey;
//   }

//   static String getStatusStringFromInt(int? intStatus) {
//     if (intStatus == null) {
//       return 'UNKNOWN';
//     }

//     final jobStatus = JobStatus.values.firstWhere(
//         (x) => x.index == (intStatus - 101),
//         orElse: () => JobStatus.JOB_CREATED);
//     final statusString = JobStatusData.statusValues.entries
//         .firstWhere((x) => x.value == jobStatus,
//             orElse: () => MapEntry("CREATED", JobStatus.JOB_CREATED))
//         .key;
//     return statusString;
//   }

//   static String getStatusStringFromStatusEnumValue(JobStatus? statusEnum) {
//     if (statusEnum == null) {
//       return 'UNKNOWN';
//     }

//     final statusString = JobStatusData.statusValues.entries
//         .firstWhere((x) => x.value == statusEnum,
//             orElse: () => MapEntry("CREATED", JobStatus.JOB_CREATED))
//         .key;
//     return statusString;
//   }

//   ///
// }

// enum JobStatus {
//   JOB_CREATED,
//   JOB_ASSIGNED,
//   JOB_LINKED,
//   JOB_IN_PROGRESS,
//   JOB_CARRY_FORWARD,
//   JOB_CLOSED,
//   JOB_CANCELLED,
//   JOB_DELETED,
// }
