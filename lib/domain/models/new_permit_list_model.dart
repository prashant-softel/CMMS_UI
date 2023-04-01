import 'dart:convert';

List<NewPermitListModel> newPermitListFromJson(String str) =>
    List<NewPermitListModel>.from(json.decode(str).map(NewPermitListModel.fromJson));

String newPermitListToJson(List<NewPermitListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewPermitListModel {
  factory NewPermitListModel.fromJson(Map<String, dynamic> json) => NewPermitListModel(
      permitId: json['permitId'] == null ? 0 : json['permitId'],
      ptwStatus: json['ptwStatus'] == null ? 0 : json['ptwStatus'],
      permit_site_no: json['permit_site_no'] == null ? 0 : json['permit_site_no'],
      permit_type: json['permit_type'] == null ? null : json['permit_type'],
      permitTypeName: json['permitTypeName'] == null ? null : json['permitTypeName'],
      equipment_category: json['equipment_category'] == null ? null : json['equipment_category'],
      equipment: json['equipment'] == null ? null : json['equipment'],
      workingAreaId: json['workingAreaId'] == null ? null : json['workingAreaId'],
      workingAreaName: json['workingAreaName'] == null ? null : json['workingAreaName'],
      description: json['description'] == null ? null : json['description'],
      request_by_name: json['request_by_name'] == null ? null : json['request_by_name'],
      request_datetime: json['request_datetime'] == null
          ? null
          : DateTime.parse(json['request_datetime'] as String),
      approved_by_name: json['approved_by_name'] == null ? null : json['approved_by_name'],
      approved_datetime: json['approved_datetime'] == null
          ? null
          : DateTime.parse(json['approved_datetime'] as String),
      current_status: json['current_status'] == null
          ? null
          : CurrentStatus.values.firstWhere((x) => x.index == json['current_status']));



      // jobDate: json['jobDate'] == null ? null : DateTime.parse(json['jobDate']),
      // equipmentCat: json['equipmentCat'] == null ? null : json['equipmentCat'],
      // workingArea: json['workingArea'] == null ? null : json['workingArea'],
      // // description: json['description'] == null ? null : json['description'],
      // jobDetails: json['jobDetails'] == null ? null : json['jobDetails'],
      // workType: json['workType'] == null ? null : json['workType'],
      // raisedBy: json['raisedBy'] == null ? null : json['raisedBy'],
      // raisedByName: json['raisedByName'] == null ? null : json['raisedByName'],
      // breakdownTime: json['breakdownTime'] == null
      //     ? null
      //     : DateTime.parse(json['breakdownTime'] as String),
      // breakdownType:
      //     json['breakdownType'] == null ? null : json['breakdownType'],
      // // permitId: json['permitId'] == null ? null : json['permitId'],
      // assignedToName:
      //     json['assignedToName'] == null ? null : json['assignedToName'],
      // assignedToId: json['assignedToId'] == null ? null : json['assignedToId'],
      // status: json['status'] == null
      //     ? null
      //     : CurrentStatus.values.firstWhere((x) => x.index == json['status']));

  ///
  NewPermitListModel({
    this.permitId,
    this.ptwStatus,
    this.permit_site_no,
    this.permit_type,
    this.permitTypeName,
    this.equipment_category,
    this.equipment,
    this.workingAreaId,
    this.workingAreaName,
    this.description,
    this.request_by_name,
    this.request_datetime,
    this.approved_by_name,
    this.approved_datetime,
    this.current_status,


    // this.jobDate,
    // this.equipmentCat,
    // this.workingArea,
    // // this.description,
    // this.jobDetails,
    // this.workType,
    // this.raisedBy,
    // this.raisedByName,
    // this.breakdownTime,
    // this.breakdownType,
    // // this.permitId,
    // this.assignedToName,
    // this.assignedToId,
    // this.status,
  });

  int? permitId;
  int? ptwStatus;
  int? permit_site_no;
  int? permit_type;
  String? permitTypeName;
  int? equipment_category;
  String? equipment;
  int? workingAreaId;
  String? workingAreaName;
  String? description;
  String? request_by_name;
  DateTime? request_datetime;
  String? approved_by_name;
  DateTime? approved_datetime;
  CurrentStatus? current_status;



  // DateTime? jobDate;
  // String? equipmentCat;
  // String? workingArea;
  // // String? description;
  // String? jobDetails;
  // String? workType;
  // int? raisedBy;
  // String? raisedByName;
  // DateTime? breakdownTime;
  // String? breakdownType;
  // // String? permitId;
  // String? assignedToName;
  // int? assignedToId;

  // CurrentStatus? status;

  Map<String, dynamic> toJson() => {
        'permitId': permitId,
        'ptwStatus': ptwStatus,
        'permit_site_no': permit_site_no,
        'permit_type': permit_type,
        'permitTypeName': permitTypeName,
        'equipment_category': equipment_category,
        'equipment': equipment,
        'workingAreaId': workingAreaId,
        'workingAreaName': workingAreaName,
        'description': description,
        'request_by_name': request_by_name,
        'request_datetime': request_datetime,
        'approved_by_name': approved_by_name,
        'approved_datetime': approved_datetime,
        'current_status': statusValues.reverse[current_status],


        // 'jobDate': jobDate?.toIso8601String(),
        // 'equipmentCat': equipmentCat,
        // 'workingArea': workingArea,
        // // 'description': description,
        // 'jobDetails': jobDetails,
        // 'workType': workType,
        // 'raisedBy': raisedBy,
        // 'raisedByName': raisedByName,
        // 'breakdownTime': breakdownTime,
        // 'breakdownType': breakdownType,
        // 'permitId': permitId,
        // 'assignedToName': assignedToName,
        // 'assignedToId': assignedToId,
        // 'status': statusValues.reverse[status],
      };
}

enum CurrentStatus {
  NULL,
  Invalid,
  CREATED,
  UPDATED,
  DELETED,
  CANCELLED,
  ASSIGNED,
  ISSUED,
  APPROVED,
  REJECTED,
}

final statusValues = EnumValues({
  "null":CurrentStatus.NULL,
  "Invalid": CurrentStatus.Invalid,
  "Created": CurrentStatus.CREATED,
  "Updated": CurrentStatus.UPDATED,
  "Deleted": CurrentStatus.DELETED,
  "Cancelled": CurrentStatus.CANCELLED,
  "Assigned": CurrentStatus.ASSIGNED,
  "Issued": CurrentStatus.ISSUED,
  "Approved": CurrentStatus.APPROVED,
  "Rejected": CurrentStatus.REJECTED,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
