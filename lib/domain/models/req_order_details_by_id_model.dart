import 'dart:convert';

GetRODetailsByIDModel getRODetailsByIDModelFromJson(String str) =>
    GetRODetailsByIDModel.fromJson(json.decode(str));

String getRODetailsByIDModelToJson(GetRODetailsByIDModel data) =>
    json.encode(data.toJson());

class GetRODetailsByIDModel {
  int? id;
  int? requestID;
  int? facilityID;
  String? facilityName;
  dynamic? remarks;
  dynamic? rejectedRemark;
  String? request_date;
  int? vendorID;
  int? status;
  String? status_short;
  dynamic? generatedBy;
  int? receiverID;

  dynamic? vendor_name;
  int? generate_flag;
  int? location_ID;
  dynamic? receivedAt;
  dynamic? receivedBy;
  dynamic? approvedBy;

  dynamic? approvedAt;
  int? receive_later;

  int? added_to_store;
  int? assetItemID;
  int? accepted_qty;
  int? spare_status;
  String? challan_date;

  String? challan_no;
  String? freight;
  String? no_pkg_received;
  String? lr_no;
  String? condition_pkg_received;
  String? vehicle_no;
  String? gir_no;
  String? job_ref;
  int? amount;
  int? currencyID;
  String? currency;
  int? cost;
  String? status_long;

  List<GoDetails>? go_items;

  GetRODetailsByIDModel({
    this.id,
    this.added_to_store,
    this.approvedAt,
    this.approvedBy,
    this.assetItemID,
    this.cost,
    this.facilityID,
    this.generate_flag,
    this.generatedBy,
    this.receive_later,
    this.receivedBy,
    this.receiverID,
    this.rejectedRemark,
    this.remarks,
    this.requestID,
    this.request_date,
    this.spare_status,
    this.status,
    this.vendorID,
    this.status_short,
    this.status_long,
    this.accepted_qty,
    this.receivedAt,
    this.currencyID,
    this.currency,
    this.amount,
    this.job_ref,
    this.gir_no,
    this.vehicle_no,
    this.condition_pkg_received,
    this.lr_no,
    this.no_pkg_received,
    this.freight,
    this.challan_date,
    this.challan_no,
    this.location_ID,
    this.go_items,
    this.vendor_name,
    this.facilityName,
  });

  factory GetRODetailsByIDModel.fromJson(Map<String, dynamic> parsedJson) =>
      GetRODetailsByIDModel(
        id: parsedJson["id"] ?? "",
        requestID: parsedJson["requestID"] ?? "",
        facilityID: parsedJson["facilityID"] ?? "",
        facilityName: parsedJson["facilityName"] ?? "",
        remarks: parsedJson["remarks"] ?? "",
        rejectedRemark: parsedJson["rejectedRemark"] ?? "",
        request_date: parsedJson["request_date"] ?? "",
        vendorID: parsedJson["vendorID"] ?? "",
        status: parsedJson["status"] ?? "",
        status_short: parsedJson["status_short"] ?? "",
        generatedBy: parsedJson["generatedBy"] ?? "",
        receiverID: parsedJson["receiverID"] ?? "",
        vendor_name: parsedJson["vendor_name"] ?? "",
        generate_flag: parsedJson["generate_flag"] ?? "",
        location_ID: parsedJson["location_ID"] ?? "",
        receivedAt: parsedJson["receivedAt"] ?? "",
        receivedBy: parsedJson["receivedBy"] ?? "",
        approvedBy: parsedJson["approvedBy"] ?? "",
        approvedAt: parsedJson["approvedAt"] ?? "",
        receive_later: parsedJson["receive_later"] ?? "",
        added_to_store: parsedJson["added_to_store"] ?? "",
        assetItemID: parsedJson["assetItemID"] ?? "",
        accepted_qty: parsedJson["accepted_qty"] ?? "",
        spare_status: parsedJson["spare_status"] ?? "",
        challan_date: parsedJson["challan_date"] ?? "",
        challan_no: parsedJson["challan_no"] ?? "",
        freight: parsedJson["freight"] ?? "",
        no_pkg_received: parsedJson["no_pkg_received"] ?? "",
        lr_no: parsedJson["lr_no"] ?? "",
        condition_pkg_received: parsedJson["condition_pkg_received"] ?? "",
        vehicle_no: parsedJson["vehicle_no"] ?? "",
        gir_no: parsedJson["gir_no"] ?? "",
        job_ref: parsedJson["job_ref"] ?? "",
        amount: parsedJson["amount"] ?? "",
        currencyID: parsedJson["currencyID"] ?? "",
        currency: parsedJson["currency"] ?? "",
        cost: parsedJson["cost"] ?? "",
        status_long: parsedJson["status_long"] ?? "",
        go_items: List<GoDetails>.from(
            parsedJson["go_items"].map((x) => GoDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "requestID": requestID,
        "facilityID": facilityID,
        "facilityName": facilityName,
        "remarks": remarks,
        "rejectedRemark": rejectedRemark,
        "request_date": request_date,
        "vendorID": vendorID,
        "status": status,
        "status_short": status_short,
        "generatedBy": generatedBy,
        "receiverID": receiverID,
        "vendor_name": vendor_name,
        "generate_flag": generate_flag,
        "location_ID": location_ID,
        "receivedAt": receivedAt,
        "receivedBy": receivedBy,
        "approvedBy": approvedBy,
        "approvedAt": approvedAt,
        "receive_later": receive_later,
        "added_to_store": added_to_store,
        "assetItemID": assetItemID,
        "accepted_qty": accepted_qty,
        "spare_status": spare_status,
        "challan_date": challan_date,
        "challan_no": challan_no,
        "freight": freight,
        "no_pkg_received": no_pkg_received,
        "lr_no": lr_no,
        "condition_pkg_received": condition_pkg_received,
        "vehicle_no": vehicle_no,
        "gir_no": gir_no,
        "job_ref": job_ref,
        "amount": amount,
        "currencyID": currencyID,
        "currency": currency,
        "cost": cost,
        "status_long": status_long,
        "go_items": List<dynamic>.from(go_items?.map((x) => x) ?? []),
      };
}

class GoDetails {
  int? id;
  int? requestID;
  int? assetItemID;
  double? cost;
  double? ordered_qty;
  String? asset_name;
  int? accepted_qty;

  GoDetails({
    this.id,
    this.requestID,
    this.assetItemID,
    this.cost,
    this.ordered_qty,
    this.asset_name,
    this.accepted_qty,
  });

  GoDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    requestID = json['requestID'];
    assetItemID = json['assetItemID'];
    cost = json['cost'];
    ordered_qty = json['ordered_qty'];
    asset_name = json['asset_name'];
    accepted_qty = json['accepted_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['requestID'] = this.requestID;
    data['assetItemID'] = this.assetItemID;
    data['cost'] = this.cost;
    data['ordered_qty'] = this.ordered_qty;
    data['asset_name'] = this.asset_name;
    data['accepted_qty'] = this.accepted_qty;

    return data;
  }
}
