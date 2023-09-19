import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<GoodsOrdersListModel> goodOrderListModelFromJson(String str) =>
    List<GoodsOrdersListModel>.from(
        json.decode(str).map(GoodsOrdersListModel.fromJson));

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
  dynamic ordered_qty;
  String? rejectedRemark;
  int? facility_id;
  String? purchaseDate;
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
    this.ordered_qty,
    this.rejectedRemark,
    this.facility_id,
    this.purchaseDate,
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
      ordered_qty: json['ordered_qty'],
      rejectedRemark: json['rejectedRemark'],
      facility_id: json['facility_id'],
      purchaseDate: Utility.getFormatedyearMonthDay(json['purchaseDate']),
      vendorID: json['vendorID'],
      status: json['status'],
      asset_code: json['asset_code'],
      asset_type: json['asset_type'],
      cat_name: json['cat_name'],
      received_qty: json['received_qty'],
      damaged_qty: json['damaged_qty'],
      accepted_qty: json['accepted_qty'],
      received_on: json['received_on'],
      approvedOn: json['approvedOn'],
      generatedBy: json['generatedBy'],
      receivedBy: json['receivedBy'],
      approvedBy: json['approvedBy'],
      vendor_name: json['vendor_name'],
      status_short: json['status_short'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['challan_no'] = this.challan_no;
    data['spare_status'] = this.spare_status;
    data['remarks'] = this.remarks;
    data['orderflag'] = this.orderflag;
    data['asset_name'] = this.asset_name;
    data['asset_type_ID'] = this.asset_type_ID;
    data['purchaseID'] = this.purchaseID;
    data['assetItemID'] = this.assetItemID;
    data['serial_number'] = this.serial_number;
    data['location_ID'] = this.location_ID;
    data['cost'] = this.cost;
    data['currency'] = this.currency;

    data['ordered_qty'] = this.ordered_qty;
    data['rejectedRemark'] = this.rejectedRemark;
    data['facility_id'] = this.facility_id;
    data['purchaseDate'] = this.purchaseDate;
    data['vendorID'] = this.vendorID;
    data['status'] = this.status;
    data['asset_code'] = this.asset_code;
    data['asset_type'] = this.asset_type;
    data['cat_name'] = this.cat_name;
    data['received_qty'] = this.received_qty;
    data['damaged_qty'] = this.damaged_qty;
    data['accepted_qty'] = this.accepted_qty;
    data['received_on'] = this.received_on;
    data['approvedOn'] = this.approvedOn;
    data['generatedBy'] = this.generatedBy;
    data['receivedBy'] = this.receivedBy;
    data['approvedBy'] = this.approvedBy;
    data['vendor_name'] = this.vendor_name;
    data['status_short'] = this.status_short;

    return data;
  }
}
