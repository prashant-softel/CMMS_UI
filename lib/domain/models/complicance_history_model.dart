import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<StatutoryHistory> statutoryHistoryFromJson(String str) =>
    List<StatutoryHistory>.from(
        json.decode(str).map((x) => StatutoryHistory.fromJson(x)));

String statutoryHistoryToJson(List<StatutoryHistory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StatutoryHistory {
  int? id;
  int? facility_id;
  String? facility_name;
  int? compliance_id;
  String? compliance_name;
  String? start_date;
  String? end_date;
  int? status;
  String? current_status_short;
  String? short_status;
  String? created_by;
  String? created_at;
  String? updated_by;
  String? updated_at;
  String? renew_from;
  int? renew_from_id;
  String? approved_by;
  String? approved_at;
  String? createdByName;

  StatutoryHistory({
    this.id,
    this.facility_id,
    this.facility_name,
    this.compliance_id,
    this.compliance_name,
    this.start_date,
    this.end_date,
    this.status,
    this.current_status_short,
    this.short_status,
    this.created_by,
    this.created_at,
    this.updated_by,
    this.updated_at,
    this.renew_from,
    this.renew_from_id,
    this.approved_by,
    this.approved_at,
    this.createdByName,
  });

  factory StatutoryHistory.fromJson(Map<String, dynamic> json) =>
      StatutoryHistory(
        id: json["id"],
        facility_id: json["facility_id"],
        facility_name: json["facility_name"],
        compliance_id: json["compliance_id"],
        compliance_name: json["compliance_name"],
        start_date: Utility.getFormatedyearMonthDay(json['start_date']),
        end_date: Utility.getFormatedyearMonthDay(json['end_date']),
        status: json["status"],
        current_status_short: json["current_status_short"],
        short_status: json["short_status"],
        created_by: json["created_by"],
        created_at: json["created_at"],
        updated_by: json["updated_by"],
        updated_at: json["updated_at"],
        renew_from: json["renew_from"],
        renew_from_id: json["renew_from_id"],
        approved_by: json["approved_by"],
        approved_at: json["approved_at"],
        createdByName: json["createdByName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "facility_id": facility_id,
        "facility_name": facility_name,
        "compliance_id": compliance_id,
        "compliance_name": compliance_name,
        "start_date": start_date,
        "end_date": end_date,
        "status": status,
        "current_status_short": current_status_short,
        "short_status": short_status,
        "created_by": created_by,
        "created_at": created_at,
        "updated_by": updated_by,
        "updated_at": updated_at,
        "renew_from": renew_from,
        "renew_from_id": renew_from_id,
        "approved_by": approved_by,
        "approved_at": approved_at,
        "createdByName": createdByName,
      };
}
