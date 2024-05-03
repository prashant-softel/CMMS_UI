import 'dart:convert';

List<GetRODetailsByIDModel> getRODetailsByIDModelFromJson(String str) =>
    List<GetRODetailsByIDModel>.from(
        json.decode(str).map((x) => GetRODetailsByIDModel.fromJson(x)));

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
  int? number_of_masters;

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
    this.generatedAt,
    this.number_of_masters,
    this.rejectedAt,
    this.rejectedBy,
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
        generatedAt: parsedJson["generatedAt"] ?? "",
        number_of_masters: parsedJson["number_of_masters"] ?? "",
        rejectedAt: parsedJson["rejectedAt"] ?? "",
        rejectedBy: parsedJson["rejectedBy"] ?? "",
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
        "generatedAt": generatedAt,
        "number_of_masters": number_of_masters,
        "rejectedAt": rejectedAt,
        "rejectedBy": rejectedBy,
        "request_order_items":
            List<dynamic>.from(request_order_items?.map((x) => x) ?? []),
      };
}

class GoDetails {
  int? itemID;
  int? requestID;
  int? assetMasterItemID;
  double? cost;
  double? ordered_qty;
  String? name;
  int? accepted_qty;
  String? comment;
  String? asset_name;
  String? asset_code;
  String? asset_type;
  String? asset_cat;

  GoDetails(
      {this.itemID,
      this.requestID,
      this.assetMasterItemID,
      this.cost,
      this.ordered_qty,
      this.name,
      this.accepted_qty,
      this.comment,
      this.asset_code,
      this.asset_name,
      this.asset_type,
      this.asset_cat});

  GoDetails.fromJson(Map<String, dynamic> json) {
    itemID = json['itemID'];
    requestID = json['requestID'];
    assetMasterItemID = json['assetMasterItemID'];
    cost = json['cost'];
    ordered_qty = json['ordered_qty'];
    name = json['asset_name'];
    accepted_qty = json['accepted_qty'];
    comment = json['comment'];
    asset_code = json['asset_code'];
    asset_name = json['asset_name'];
    asset_type = json['asset_type'];
    asset_cat = json['asset_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemID'] = this.itemID;
    data['requestID'] = this.requestID;
    data['assetMasterItemID'] = this.assetMasterItemID;
    data['cost'] = this.cost;
    data['ordered_qty'] = this.ordered_qty;
    data['asset_name'] = this.name;
    data['accepted_qty'] = this.accepted_qty;
    data['comment'] = this.comment;
    data['asset_code'] = this.asset_code;
    data['asset_name'] = this.asset_name;
    data['asset_type'] = this.asset_type;
    data['asset_cat'] = this.asset_cat;

    return data;
  }
}
