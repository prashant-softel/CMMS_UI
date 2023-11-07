import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<GetRequestOrderListModel> getRequestOrderListModelFromJson(String str) =>
    List<GetRequestOrderListModel>.from(
        json.decode(str).map(GetRequestOrderListModel.fromJson));

class GetRequestOrderListModel {
  String? name;

  int? facilityID;
  String? facilityName;
  int? status;
  String? status_short;
  String? status_long;
  dynamic rejectedRemark;
  dynamic generatedBy;
  dynamic approvedBy;
  String? approvedAt;
  dynamic generatedAt;
  double? cost;
  dynamic go_items;

  GetRequestOrderListModel({
    this.name,
    this.facilityID,
    this.facilityName,
    this.rejectedRemark,
    this.status,
    this.status_short,
    this.generatedBy,
    this.approvedBy,
    this.approvedAt,
    this.generatedAt,
    this.status_long,
    this.go_items,
    this.cost,
  });

  // Factory method to create a GetRequestOrderListModel instance from JSON
  factory GetRequestOrderListModel.fromJson(Map<String, dynamic> json) {
    return GetRequestOrderListModel(
      name: json['request_order_id'].toString(),
      facilityID: json['facilityID'],
      facilityName: json['facilityName'],
      rejectedRemark: json['rejectedRemark'],
      status: json['status'],
      status_short: json['status_short'],
      generatedBy: json['generatedBy'],
      approvedBy: json['approvedBy'],
      approvedAt: json['approvedAt'],
      generatedAt: Utility.getFormatedyearMonthDay(json['generatedAt']),
      status_long: json['status_long'],
      cost: json['cost'],
      go_items: json['go_items'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_order_id'] = this.name;

    data['facilityID'] = this.facilityID;
    data['facilityName'] = this.facilityName;

    data['rejectedRemark'] = this.rejectedRemark;

    data['status'] = this.status;
    data['status_short'] = this.status_short;
    data['generatedBy'] = this.generatedBy;

    data['approvedBy'] = this.approvedBy;
    data['approvedAt'] = this.approvedAt;

    data['generatedAt'] = this.generatedAt;

    data['status_long'] = this.status_long;
    data['cost'] = this.cost;
    data['go_items'] = this.go_items;

    return data;
  }
}
