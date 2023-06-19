import 'dart:convert';

List<GoodsOrdersListModel> goodOrderListModelFromJson(String str) =>
    List<GoodsOrdersListModel>.from(
        json.decode(str).map(GoodsOrdersListModel.fromJson));

class GoodsOrdersListModel {
  int? id;
  int? facility_id;

  dynamic? title;
  int? order_by_type;
  dynamic? remarks;
  String? rejectedRemark;
  int? plantID;
  String? purchaseDate;
  int? vendorID;
  int? status;
  dynamic? status_short;
  String? generatedBy;
  int? receiverID;
  dynamic? vendor_name;
  int? generate_flag;
  int? location_ID;
  String? received_on;
  String? receivedBy;
  String? approvedBy;
  String? approvedOn;
  dynamic? go_items;

  GoodsOrdersListModel({
    this.id,
    this.facility_id,
    this.title,
    this.order_by_type,
    this.remarks,
    this.rejectedRemark,
    this.plantID,
    this.purchaseDate,
    this.vendorID,
    this.status,
    this.status_short,
    this.generatedBy,
    this.receiverID,
    this.vendor_name,
    this.generate_flag,
    this.location_ID,
    this.received_on,
    this.receivedBy,
    this.approvedBy,
    this.approvedOn,
    this.go_items,
  });

  // Factory method to create a GoodsOrdersListModel instance from JSON
  factory GoodsOrdersListModel.fromJson(Map<String, dynamic> json) {
    return GoodsOrdersListModel(
      id: json['id'],
      facility_id: json['facility_id'],
      title: json['title'],
      order_by_type: json["order_by_type"],
      remarks: json['remarks'],
      rejectedRemark: json['rejectedRemark'],
      plantID: json['plantID'],
      purchaseDate: json['purchaseDate'],
      vendorID: json['vendorID'],
      status: json['status'],
      status_short: json['status_short'],
      generatedBy: json['generatedBy'],
      receiverID: json['receiverID'],
      vendor_name: json['vendor_name'],
      generate_flag: json['generate_flag'],
      location_ID: json['location_ID'],
      received_on: json['received_on'],
      receivedBy: json['receivedBy'],
      approvedBy: json['approvedBy'],
      approvedOn: json['approvedOn'],
      go_items: json['go_items'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['facility_id'] = this.facility_id;
    data['title'] = this.title;
    data['order_by_type'] = this.order_by_type;
    data['remarks'] = this.remarks;
    data['rejectedRemark'] = this.rejectedRemark;
    data['plantID'] = this.plantID;
    data['purchaseDate'] = this.purchaseDate;
    data['vendorID'] = this.vendorID;
    data['status'] = this.status;
    data['status_short'] = this.status_short;
    data['generatedBy'] = this.generatedBy;
    data['receiverID'] = this.receiverID;
    data['vendor_name'] = this.vendor_name;
    data['generate_flag'] = this.generate_flag;
    data['location_ID'] = this.location_ID;
    data['received_on'] = this.received_on;
    data['receivedBy'] = this.receivedBy;
    data['approvedBy'] = this.approvedBy;
    data['approvedOn'] = this.approvedOn;
    data['go_items'] = this.go_items;
    return data;
  }
}
