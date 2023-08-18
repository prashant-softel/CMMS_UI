import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<GetRequestOrderListModel> getRequestOrderListModelFromJson(String str) =>
    List<GetRequestOrderListModel>.from(
        json.decode(str).map(GetRequestOrderListModel.fromJson));

class GetRequestOrderListModel {
  int? id;
  int? requestID;
  int? facilityID;
  String? facilityName;
  int? order_by_type;
  dynamic? remarks;
  dynamic? rejectedRemark;
  String? request_date;
  int? vendorID;
  int? status;
  String? status_short;
  dynamic generatedBy;
  int? receiverID;
  dynamic? vendor_name;
  int? generate_flag;
  int? location_ID;
  dynamic receivedAt;
  dynamic receivedBy;
  dynamic approvedBy;
  String? approvedAt;
  int? added_to_store;
  int? assetItemID;
  int? accepted_qty;
  int? spare_status;
  dynamic challan_date;
  dynamic requestdate;
  dynamic challan_no;
  dynamic freight;
  dynamic no_pkg_received;
  dynamic lr_no;
  dynamic condition_pkg_received;
  dynamic vehicle_no;
  dynamic gir_no;
  dynamic job_ref;
  int? amount;
  int? currencyID;
  dynamic? currency;
  double? cost;
  String? status_long;
  dynamic? go_items;

  GetRequestOrderListModel({
    this.id,
    this.requestID,
    this.facilityID,
    this.facilityName,
    this.order_by_type,
    this.remarks,
    this.rejectedRemark,
    this.request_date,
    this.vendorID,
    this.status,
    this.status_short,
    this.generatedBy,
    this.receiverID,
    this.vendor_name,
    this.generate_flag,
    this.location_ID,
    this.receivedAt,
    this.receivedBy,
    this.approvedBy,
    this.approvedAt,
    this.added_to_store,
    this.assetItemID,
    this.accepted_qty,
    this.spare_status,
    this.challan_date,
    this.requestdate,
    this.challan_no,
    this.freight,
    this.no_pkg_received,
    this.lr_no,
    this.condition_pkg_received,
    this.vehicle_no,
    this.gir_no,
    this.job_ref,
    this.amount,
    this.currencyID,
    this.currency,
    this.cost,
    this.status_long,
    this.go_items,
  });

  // Factory method to create a GetRequestOrderListModel instance from JSON
  factory GetRequestOrderListModel.fromJson(Map<String, dynamic> json) {
    return GetRequestOrderListModel(
      id: json['id'],
      requestID: json['requestID'],
      facilityID: json['facilityID'],
      facilityName: json['facilityName'],
      order_by_type: json['order_by_type'],
      remarks: json['remarks'],
      rejectedRemark: json['rejectedRemark'],
      request_date: json['request_date'],
      vendorID: json['vendorID'],
      status: json['status'],
      status_short: json['status_short'],
      generatedBy: json['generatedBy'],
      receiverID: json['receiverID'],
      vendor_name: json['vendor_name'],
      generate_flag: json['generate_flag'],
      location_ID: json['location_ID'],
      receivedAt: json['receivedAt'],
      receivedBy: json['receivedBy'],
      approvedBy: json['approvedBy'],
      approvedAt: json['approvedAt'],
      added_to_store: json['added_to_store'],
      assetItemID: json['assetItemID'],
      accepted_qty: json['accepted_qty'],
      spare_status: json['spare_status'],
      challan_date: json['challan_date'],
      requestdate: json['requestdate'],
      challan_no: json['challan_no'],
      freight: json['freight'],
      no_pkg_received: json['no_pkg_received'],
      lr_no: json['lr_no'],
      condition_pkg_received: json['condition_pkg_received'],
      vehicle_no: json['vehicle_no'],
      gir_no: json['gir_no'],
      job_ref: json['job_ref'],
      amount: json['amount'],
      currencyID: json['currencyID'],
      currency: json['currency'],
      cost: json['cost'],
      status_long: json['status_long'],
      go_items: json['go_items'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['requestID'] = this.requestID;
    data['facilityID'] = this.facilityID;
    data['facilityName'] = this.facilityName;
    data['order_by_type'] = this.order_by_type;
    data['remarks'] = this.remarks;
    data['rejectedRemark'] = this.rejectedRemark;
    data['request_date'] = this.request_date;
    data['vendorID'] = this.vendorID;
    data['status'] = this.status;
    data['status_short'] = this.status_short;
    data['generatedBy'] = this.generatedBy;
    data['receiverID'] = this.receiverID;
    data['vendor_name'] = this.vendor_name;
    data['generate_flag'] = this.generate_flag;
    data['location_ID'] = this.location_ID;
    data['receivedAt'] = this.receivedAt;
    data['receivedBy'] = this.receivedBy;
    data['approvedBy'] = this.approvedBy;
    data['approvedAt'] = this.approvedAt;
    data['added_to_store'] = this.added_to_store;
    data['assetItemID'] = this.assetItemID;
    data['accepted_qty'] = this.accepted_qty;
    data['spare_status'] = this.spare_status;
    data['challan_date'] = this.challan_date;
    data['requestdate'] = this.requestdate;
    data['challan_no'] = this.challan_no;
    data['freight'] = this.freight;
    data['no_pkg_received'] = this.no_pkg_received;
    data['lr_no'] = this.lr_no;
    data['condition_pkg_received'] = this.condition_pkg_received;
    data['vehicle_no'] = this.vehicle_no;
    data['gir_no'] = this.gir_no;
    data['job_ref'] = this.job_ref;
    data['amount'] = this.amount;
    data['currencyID'] = this.currencyID;
    data['currency'] = this.currency;
    data['cost'] = this.cost;
    data['status_long'] = this.status_long;
    data['go_items'] = this.go_items;

    return data;
  }
}
