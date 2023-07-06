import 'dart:convert';

GetPurchaseDetailsByIDModel getPurchaseDetailsByIDModelFromJson(String str) =>
    GetPurchaseDetailsByIDModel.fromJson(json.decode(str));

String pmtaskViewModelToJson(GetPurchaseDetailsByIDModel data) =>
    json.encode(data.toJson());

class GetPurchaseDetailsByIDModel {
  int? id;
  int? facilityId;
  int? assetTypeId;
  int? vendorId;
  int? status;
  String? statusShort;
  double? acceptedQty;
  List<GoDetails>? goDetail;

  GetPurchaseDetailsByIDModel({
    this.id,
    this.facilityId,
    this.assetTypeId,
    this.vendorId,
    this.status,
    this.statusShort,
    this.acceptedQty,
    this.goDetail,
  });

  factory GetPurchaseDetailsByIDModel.fromJson(Map<String, dynamic> json) =>
      GetPurchaseDetailsByIDModel(
        id: json["id"] ?? "",
        facilityId: json["facility_id"] ?? "",
        assetTypeId: json["asset_type_ID"] ?? "",
        vendorId: json["vendorID"] ?? "",
        status: json["status"] ?? "",
        statusShort: json["status_short"] ?? "",
        acceptedQty: json["accepted_qty"] ?? "",
        goDetail: List<GoDetails>.from(
            json["goDetails"].map((x) => GoDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "facility_id": facilityId,
        "asset_type_ID": assetTypeId,
        "vendorId": vendorId,
        "status": status,
        "status_short": statusShort,
        "accepted_qty": acceptedQty,
        "goDetail": List<dynamic>.from(goDetail?.map((x) => x) ?? []),
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

  GoDetails({
    this.id,
    this.assetItemID,
    this.locationID,
    this.cost,
    this.acceptedQty,
    this.spareStatus,
    this.remarks,
    this.receiveLater,
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

    return data;
  }
}
