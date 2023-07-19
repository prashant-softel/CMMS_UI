import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

GetPurchaseDetailsByIDModel getPurchaseDetailsByIDModelFromJson(String str) =>
    GetPurchaseDetailsByIDModel.fromJson(json.decode(str));

String pmtaskViewModelToJson(GetPurchaseDetailsByIDModel data) =>
    json.encode(data.toJson());

class GetPurchaseDetailsByIDModel {
  int? id;
  int? facility_id;
  int? asset_type_ID;
  int? vendorId;
  int? status;
  String? statusShort;
  double? acceptedQty;
  int? currencyID;
  String? currency;
  int? amount;
  String? job_ref;
  String? gir_no;
  String? vehicle_no;
  String? condition_pkg_received;
  String? lr_no;
  String? no_pkg_received;
  dynamic? received_on;
  String? freight;
  String? vendor_name;

  dynamic? po_date;
  String? po_no;
  String? challan_date;
  String? challan_no;
  String? purchaseDate;
  int? location_ID;
  String? facilityName;
  List<GoDetails>? goDetails;

  GetPurchaseDetailsByIDModel({
    this.id,
    this.facility_id,
    this.asset_type_ID,
    this.vendorId,
    this.status,
    this.statusShort,
    this.acceptedQty,
    this.currencyID,
    this.currency,
    this.amount,
    this.job_ref,
    this.gir_no,
    this.vehicle_no,
    this.condition_pkg_received,
    this.lr_no,
    this.no_pkg_received,
    this.received_on,
    this.freight,
    this.po_date,
    this.po_no,
    this.challan_date,
    this.challan_no,
    this.purchaseDate,
    this.location_ID,
    this.goDetails,
    this.vendor_name,
    this.facilityName,
  });

  factory GetPurchaseDetailsByIDModel.fromJson(
          Map<String, dynamic> parsedJson) =>
      GetPurchaseDetailsByIDModel(
        facilityName: parsedJson["facilityName"] ?? "",
        id: parsedJson["id"] ?? "",
        facility_id: parsedJson["facility_id"] ?? "",
        asset_type_ID: parsedJson["asset_type_ID"] ?? "",
        vendorId: parsedJson["vendorID"] ?? "",
        status: parsedJson["status"] ?? "",
        statusShort: parsedJson["status_short"] ?? "",
        acceptedQty: parsedJson["accepted_qty"] ?? "",
        currencyID: parsedJson["currencyID"] ?? "",
        currency: parsedJson["currency"] ?? "",
        amount: parsedJson["amount"] ?? "",
        job_ref: parsedJson["job_ref"] ?? "",
        gir_no: parsedJson["gir_no"] ?? "",
        vehicle_no: parsedJson["vehicle_no"] ?? "",
        condition_pkg_received: parsedJson["condition_pkg_received"] ?? "",
        lr_no: parsedJson["lr_no"] ?? "",
        no_pkg_received: parsedJson["no_pkg_received"] ?? "",
        received_on: Utility.getFormatedyearMonthDay(parsedJson['received_on']),
        freight: parsedJson["freight"] ?? "",
        po_date: Utility.getFormatedyearMonthDay(parsedJson['po_date']),
        po_no: parsedJson["po_no"] ?? "",
        challan_date:
            Utility.getFormatedyearMonthDay(parsedJson['challan_date']),
        challan_no: parsedJson["challan_no"] ?? "",
        purchaseDate:
            Utility.getFormatedyearMonthDay(parsedJson['purchaseDate']),
        location_ID: parsedJson["location_ID"] ?? "",
        vendor_name: parsedJson["vendor_name"] ?? "",
        goDetails: List<GoDetails>.from(
            parsedJson["goDetails"].map((x) => GoDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "facilityName": facilityName,
        "facility_id": facility_id,
        "asset_type_ID": asset_type_ID,
        "vendorId": vendorId,
        "status": status,
        "status_short": statusShort,
        "accepted_qty": acceptedQty,
        "currencyID": currencyID,
        "currency": currency,
        "amount": amount,
        "job_ref": job_ref,
        "gir_no": gir_no,
        "vehicle_no": vehicle_no,
        "condition_pkg_received": condition_pkg_received,
        "lr_no": lr_no,
        "no_pkg_received": no_pkg_received,
        "received_on": received_on,
        "freight": freight,
        "po_date": po_date,
        "po_no": po_no,
        "challan_date": challan_date,
        "challan_no": challan_no,
        "purchaseDate": purchaseDate,
        "location_ID": location_ID,
        "vendor_name": vendor_name,
        "goDetail": List<dynamic>.from(goDetails?.map((x) => x) ?? []),
      };
}

class GoDetails {
  int? id;
  int? assetItemID;
  String? assetItem_Name;
  int? locationID;
  double? cost;
  int? ordered_qty;
  int? received_qty;
  int? lost_qty;
  int? requested_qty;
  int? damaged_qty;
  double? accepted_qty;
  int? spare_status;
  int? remarks;
  int? receive_later;
  int? asset_type_ID;

  GoDetails({
    this.id,
    this.assetItemID,
    this.assetItem_Name,
    this.locationID,
    this.cost,
    this.ordered_qty,
    this.received_qty,
    this.lost_qty,
    this.requested_qty,
    this.damaged_qty,
    this.accepted_qty,
    this.spare_status,
    this.remarks,
    this.receive_later,
    this.asset_type_ID,
  });

  GoDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assetItemID = json['assetItemID'];
    assetItem_Name = json['assetItem_Name'];
    locationID = json['location_ID'];
    cost = json['cost'];
    ordered_qty = json['ordered_qty'];
    received_qty = json['received_qty'];
    lost_qty = json['lost_qty'];
    requested_qty = json['requested_qty'];
    damaged_qty = json['damaged_qty'];
    accepted_qty = json['accepted_qty'];
    spare_status = json['spare_status'];
    remarks = json['remarks'];
    receive_later = json['receive_later'];
    asset_type_ID = json['asset_type_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['assetItemID'] = this.assetItemID;
    data['assetItem_Name'] = this.assetItem_Name;
    data['ordered_qty'] = this.ordered_qty;
    data['lost_qty'] = this.lost_qty;
    data['received_qty'] = this.received_qty;
    data['requested_qty'] = this.requested_qty;
    data['damaged_qty'] = this.damaged_qty;
    data['location_ID'] = this.locationID;
    data['cost'] = this.cost;
    data['accepted_qty'] = this.accepted_qty;
    data['spare_status'] = this.spare_status;
    data['remarks'] = this.remarks;
    data['receive_later'] = this.receive_later;
    data['asset_type_ID'] = this.asset_type_ID;

    return data;
  }
}
