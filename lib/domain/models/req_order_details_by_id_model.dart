import 'dart:convert';

GetRODetailsByIDModel getRODetailsByIDModelFromJson(String str) =>
    GetRODetailsByIDModel.fromJson(json.decode(str));

String getRODetailsByIDModelToJson(GetRODetailsByIDModel data) =>
    json.encode(data.toJson());

class GetRODetailsByIDModel {
  int? request_order_id;
  int? facilityID;
  String? facilityName;
  String? comment;
  int? status;
  String? status_short;
  String? status_long;
  String? rejectedRemark;
  String? generatedBy;
  String? rejectedBy;
  String? rejectedAt;

  String? approvedBy;
  String? approvedAt;
  String? generatedAt;

  List<GoDetails>? request_order_items;

  GetRODetailsByIDModel({
    this.request_order_id,
    this.approvedAt,
    this.approvedBy,
    this.facilityID,
    this.generatedBy,
    this.rejectedRemark,
    this.status,
    this.status_short,
    this.status_long,
    this.facilityName,
    this.comment,
    this.request_order_items,
  });

  factory GetRODetailsByIDModel.fromJson(Map<String, dynamic> parsedJson) =>
      GetRODetailsByIDModel(
        request_order_id: parsedJson["request_order_id"] ?? "",
        facilityID: parsedJson["facilityID"] ?? "",
        facilityName: parsedJson["facilityName"] ?? "",
        rejectedRemark: parsedJson["rejectedRemark"] ?? "",
        status: parsedJson["status"] ?? "",
        comment: parsedJson["comment"] ?? "",
        status_short: parsedJson["status_short"] ?? "",
        generatedBy: parsedJson["generatedBy"] ?? "",
        approvedBy: parsedJson["approvedBy"] ?? "",
        approvedAt: parsedJson["approvedAt"] ?? "",
        status_long: parsedJson["status_long"] ?? "",
        request_order_items: List<GoDetails>.from(
            parsedJson["request_order_items"]
                .map((x) => GoDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "request_order_id": request_order_id,
        "facilityID": facilityID,
        "facilityName": facilityName,
        "rejectedRemark": rejectedRemark,
        "status": status,
        "comment": comment,
        "status_short": status_short,
        "generatedBy": generatedBy,
        "approvedBy": approvedBy,
        "approvedAt": approvedAt,
        "status_long": status_long,
        "request_order_items":
            List<dynamic>.from(request_order_items?.map((x) => x) ?? []),
      };
}

class GoDetails {
  int? itemID;
  int? requestID;
  int? assetItemID;
  double? cost;
  double? ordered_qty;
  String? asset_name;
  int? accepted_qty;
  String? comment;

  GoDetails(
      {this.itemID,
      this.requestID,
      this.assetItemID,
      this.cost,
      this.ordered_qty,
      this.asset_name,
      this.accepted_qty,
      this.comment});

  GoDetails.fromJson(Map<String, dynamic> json) {
    itemID = json['itemID'];
    requestID = json['requestID'];
    assetItemID = json['assetItemID'];
    cost = json['cost'];
    ordered_qty = json['ordered_qty'];
    asset_name = json['asset_name'];
    accepted_qty = json['accepted_qty'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemID'] = this.itemID;
    data['requestID'] = this.requestID;
    data['assetItemID'] = this.assetItemID;
    data['cost'] = this.cost;
    data['ordered_qty'] = this.ordered_qty;
    data['asset_name'] = this.asset_name;
    data['accepted_qty'] = this.accepted_qty;
    data['comment'] = this.comment;

    return data;
  }
}
