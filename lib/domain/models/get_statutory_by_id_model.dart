import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

GetStatutoryById getStatutoryByIdModelFromJson(String str) =>
    GetStatutoryById.fromJson(json.decode(str));

class GetStatutoryById {
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

  GetStatutoryById(
      {this.id,
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
      this.validity_month});

  // Factory method to create a GetStatutoryById instance from JSON
  factory GetStatutoryById.fromJson(Map<String, dynamic> json) {
    return GetStatutoryById(
      id: json['id'],
      facility_id: json['facility_id'],
      compliance_id: json['compliance_id'],
      compilanceName: json['compilanceName'],
      start_date: json['start_date'],
      end_date: Utility.getFormatedyearMonthDay(json['end_date']),
      status_id: json['status_id'],
      current_status: json['current_status'],
      status_short: json['status_short'],
      created_by: json['created_by'],
      created_at: Utility.getFormatedyearMonthDay(json['created_at']),
      updated_by: json['updated_by'],
      updated_at: json['updated_at'],
      renew_from: json['renew_from'],
      renew_from_id: json['renew_from_id'],
      approved_by: json['approved_by'],
      approved_at: json['approved_at'],
      createdByName: json['createdByName'],
      updatedByName: json['updatedByName'],
      approvedByName: json['approvedByName'],
      validity_month: json['validity_month'],
      expiry_year: json['expiry_year'],
      daysLeft: json['daysLeft'],
      activation_status: json['activation_status'],
    );
  }
}
