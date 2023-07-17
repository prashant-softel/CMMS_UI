import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

GetPurchaseDetailsByIDModel getPurchaseDetailsByIDModelFromJson(String str) =>
    GetPurchaseDetailsByIDModel.fromJson(json.decode(str));

String pmtaskViewModelToJson(GetPurchaseDetailsByIDModel data) =>
    json.encode(data.toJson());

class GetPurchaseDetailsByIDModel {
  int? id;
  int? facilityId;
  int? assetTypeId;
  // int? vendorId;
  int? status;
  String? statusShort;
  double? acceptedQty;
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
  List<GoDetails>? goDetails;

  GetPurchaseDetailsByIDModel({
    this.id,
    this.facilityId,
    this.assetTypeId,
    // this.vendorId,
    this.status,
    this.statusShort,
    this.acceptedQty,
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
  });

  factory GetPurchaseDetailsByIDModel.fromJson(
          Map<String, dynamic> parsedJson) =>
      GetPurchaseDetailsByIDModel(
        id: parsedJson["id"] ?? "",
        facilityId: parsedJson["facility_id"] ?? "",
        assetTypeId: parsedJson["asset_type_ID"] ?? "",
        // vendorId: parsedJson["vendorID"] ?? "",
        status: parsedJson["status"] ?? "",
        statusShort: parsedJson["status_short"] ?? "",
        acceptedQty: parsedJson["accepted_qty"] ?? "",
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
        "facility_id": facilityId,
        "asset_type_ID": assetTypeId,
        // "vendorId": vendorId,
        "status": status,
        "status_short": statusShort,
        "accepted_qty": acceptedQty,
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
  int? locationID;
  double? cost;
  double? acceptedQty;
  int? spareStatus;
  int? remarks;
  int? receiveLater;
  int? asset_type_ID;

  GoDetails({
    this.id,
    this.assetItemID,
    this.locationID,
    this.cost,
    this.acceptedQty,
    this.spareStatus,
    this.remarks,
    this.receiveLater,
    this.asset_type_ID,
  });

  GoDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assetItemID = json['assetItemID'];
    locationID = json['location_ID'];
    cost = json['cost'];
    acceptedQty = json['accepted_qty'];
    spareStatus = json['spare_status'];
    remarks = json['remarks'];
    receiveLater = json['receive_later'];
    asset_type_ID = json['asset_type_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['assetItemID'] = this.assetItemID;
    data['location_ID'] = this.locationID;
    data['cost'] = this.cost;
    data['accepted_qty'] = this.acceptedQty;
    data['spare_status'] = this.spareStatus;
    data['remarks'] = this.remarks;
    data['receive_later'] = this.receiveLater;
    data['asset_type_ID'] = this.asset_type_ID;

    return data;
  }
}
