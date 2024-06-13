import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<GetStatutoryList> getStatutoryListModelFromJson(String str) =>
    List<GetStatutoryList>.from(
        json.decode(str).map(GetStatutoryList.fromJson));

String getStatutoryListModelToJson(List<GetStatutoryList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetStatutoryList {
  int? id;
  int? facility_id;
  int? compliance_id;
  String? compilanceName;
  String? start_date;
  String? end_date;
  int? status_id;
  String? current_status;
  String? status_short;
  int? created_by;
  String? created_at;
  int? updated_by;
  String? updated_at;
  String? renew_from;
  int? renew_from_id;
  int? approved_by;
  String? approved_at;
  String? createdByName;
  String? updatedByName;
  String? approvedByName;
  int? validity_month;
  int? expiry_year;
  int? daysLeft;
  String? activation_status;

  GetStatutoryList({
    this.id,
    this.activation_status,
    this.approvedByName,
    this.approved_at,
    this.approved_by,
    this.compilanceName,
    this.compliance_id,
    this.createdByName,
    this.created_at,
    this.created_by,
    this.current_status,
    this.daysLeft,
    this.end_date,
    this.expiry_year,
    this.facility_id,
    this.renew_from,
    this.renew_from_id,
    this.start_date,
    this.status_id,
    this.status_short,
    this.updatedByName,
    this.updated_at,
    this.updated_by,
    this.validity_month,
  });

  // Factory method to create a GetStatutoryList instance from JSON
  factory GetStatutoryList.fromJson(Map<String, dynamic> json) {
    return GetStatutoryList(
      id: json['id'],
      facility_id: json['facility_id'],
      compliance_id: json['compliance_id'],
      compilanceName: json['compilanceName'],
      start_date: json['start_date'],
      activation_status: json['activation_status'],
      approvedByName: json['approvedByName'],
      approved_at: json['approved_at'],
      approved_by: json['approved_by'],
      createdByName: json['createdByName'],
      created_at: Utility.getFormatedyearMonthDay(json['created_at']),
      created_by: json['created_by'],
      current_status: json['current_status'],
      daysLeft: json['daysLeft'],
      end_date: Utility.getFormatedyearMonthDay(json['end_date']),
      expiry_year: json['expiry_year'],
      renew_from: json['renew_from'],
      renew_from_id: json['renew_from_id'],
      status_id: json['status_id'],
      status_short: json['status_short'],
      updatedByName: json['updatedByName'],
      updated_at: json['updated_at'],
      updated_by: json['updated_by'],
      validity_month: json['validity_month'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'facility_id': facility_id,
        'compliance_id': compliance_id,
        'compilanceName': compilanceName,
        'start_date': start_date,
        'end_date': end_date,
        'status_id': status_id,
        'current_status': current_status,
        'status_short': status_short,
        'created_by': created_by,
        'created_at': created_at,
        'updated_by': updated_by,
        'updated_at': updated_at,
        'renew_from': renew_from,
        'renew_from_id': renew_from_id,
        'approved_by': approved_by,
        'approved_at': approved_at,
        'createdByName': createdByName,
        'updatedByName': updatedByName,
        'approvedByName': approvedByName,
        'validity_month': validity_month,
        'expiry_year': expiry_year,
        'daysLeft': daysLeft,
        'activation_status': activation_status,
      };
}
