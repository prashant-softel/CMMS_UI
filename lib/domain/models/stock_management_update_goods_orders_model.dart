import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<GoodsOrdersListModel> goodOrderListModelFromJson(String str) =>
    List<GoodsOrdersListModel>.from(
        json.decode(str).map(GoodsOrdersListModel.fromJson));

String goodorderListModelToJson(List<GoodsOrdersListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GoodsOrdersListModel {
  int? id;
  String? challan_no;
  int? spare_status;
  dynamic remarks;
  String? currency;
  int? orderflag;
  String? asset_name;
  int? asset_type_ID;
  int? purchaseID;
  int? assetItemID;
  dynamic serial_number;
  int? location_ID;
  dynamic cost;
  dynamic amount;
  dynamic ordered_qty;
  String? rejectedRemark;
  int? facility_id;
  String? facility_name;
  String? purchaseDate;
  String? challandate;
  int? vendorID;
  int? status;
  String? asset_code;
  String? asset_type;
  String? cat_name;
  dynamic received_qty;
  dynamic damaged_qty;
  dynamic accepted_qty;
  String? received_on;
  String? approvedOn;
  String? generatedBy;
  String? receivedBy;
  String? approvedBy;
  dynamic vendor_name;
  String? status_short;
  String? status_long;

  GoodsOrdersListModel({
    this.id,
    this.challan_no,
    this.spare_status,
    this.remarks,
    this.orderflag,
    this.asset_name,
    this.currency,
    this.asset_type_ID,
    this.purchaseID,
    this.assetItemID,
    this.serial_number,
    this.location_ID,
    this.cost,
    this.amount,
    this.ordered_qty,
    this.rejectedRemark,
    this.facility_id,
    this.facility_name,
    this.purchaseDate,
    this.challandate,
    this.vendorID,
    this.status,
    this.asset_code,
    this.asset_type,
    this.cat_name,
    this.received_qty,
    this.damaged_qty,
    this.accepted_qty,
    this.received_on,
    this.approvedOn,
    this.generatedBy,
    this.receivedBy,
    this.approvedBy,
    this.vendor_name,
    this.status_short,
    this.status_long,
  });

  // Factory method to create a GoodsOrdersListModel instance from JSON
  factory GoodsOrdersListModel.fromJson(Map<String, dynamic> json) {
    return GoodsOrdersListModel(
      id: json['id'],
      challan_no: json['challan_no'],
      spare_status: json['spare_status'],
      remarks: json['remarks'],
      orderflag: json['orderflag'],
      asset_name: json['asset_name'],
      asset_type_ID: json['asset_type_ID'],
      purchaseID: json['purchaseID'],
      currency: json['currency'],
      assetItemID: json['assetItemID'],
      serial_number: json['serial_number'],
      location_ID: json['location_ID'],
      cost: json['cost'],
      amount: json['amount'],
      ordered_qty: json['ordered_qty'],
      rejectedRemark: json['rejectedRemark'],
      facility_id: json['facility_id'],
      facility_name: json['facilityName'],
      purchaseDate: Utility.getFormatedyearMonthDay(json['purchaseDate']),
      vendorID: json['vendorID'],
      status: json['status'],
      asset_code: json['asset_code'],
      asset_type: json['asset_type'],
      cat_name: json['cat_name'],
      received_qty: json['received_qty'],
      damaged_qty: json['damaged_qty'],
      accepted_qty: json['accepted_qty'],
      received_on: json['receivedAt'],
      approvedOn: json['approvedOn'],
      generatedBy: json['generatedBy'],
      receivedBy: json['receivedBy'],
      approvedBy: json['approvedBy'],
      vendor_name: json['vendor_name'],
      status_short: json['status_short'],
      status_long: json['status_long'],
      challandate: json['challan_date'],
    );
  }

  Map<String, dynamic> toJson() => {
        // final Map<String, dynamic> data = new Map<String, dynamic>();
        'id': id,
        'challan_no': challan_no,
        'spare_status': spare_status,
        'remarks': remarks,
        'orderflag': orderflag,
        'asset_name': asset_name,
        'asset_type_ID': asset_type_ID,
        'purchaseID': purchaseID,
        'assetItemID': assetItemID,
        'serial_number': serial_number,
        'location_ID': location_ID,
        'cost': cost,
        'currency': currency,
        'amount': amount,
        'ordered_qty': ordered_qty,
        'rejectedRemark': rejectedRemark,
        'facility_id': facility_id,
        'facilityName': facility_name,
        'purchaseDate': purchaseDate,
        'vendorID': vendorID,
        'status': status,
        'asset_code': asset_code,
        'asset_type': asset_type,
        'cat_name': cat_name,
        'received_qty': received_qty,
        'damaged_qty': damaged_qty,
        'accepted_qty': accepted_qty,
        'receivedAt': received_on,
        'approvedOn': approvedOn,
        'generatedBy': generatedBy,
        'receivedBy': receivedBy,
        'approvedBy': approvedBy,
        'vendor_name': vendor_name,
        'status_short': status_short,
        'status_long': status_long,
        'challan_date': challandate,
      };
}
