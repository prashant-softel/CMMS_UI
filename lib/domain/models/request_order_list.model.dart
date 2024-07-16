import 'dart:convert';

// Function to parse JSON string and return a list of GetRequestOrderListModel objects
List<GetRequestOrderListModel> getRequestOrderListModelFromJson(String str) =>
    List<GetRequestOrderListModel>.from(
        json.decode(str).map((x) => GetRequestOrderListModel.fromJson(x)));

// Function to convert a list of GetRequestOrderListModel objects to a JSON string
String roListModelToJson(List<GetRequestOrderListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetRequestOrderListModel {
  int? requestOrderId;
  int? facilityID;
  String? facilityName;
  double? cost;
  int? assetItemID;
  String? comment;
  int? status;
  String? status_short;
  String? status_long;
  dynamic rejectedRemark;
  String? generatedBy;
  String? rejectedBy;
  String? rejectedAt;
  String? approvedBy;
  String? approvedAt;
  String? generatedAt;
  int? numberOfMasters;
  int? numberOfItemCount;
  List<RequestOrderItem>? requestOrderItems;
  String? displayCurrency;

  GetRequestOrderListModel({
    this.requestOrderId,
    this.facilityID,
    this.facilityName,
    this.cost,
    this.assetItemID,
    this.comment,
    this.status,
    this.status_short,
    this.status_long,
    this.rejectedRemark,
    this.generatedBy,
    this.rejectedBy,
    this.rejectedAt,
    this.approvedBy,
    this.approvedAt,
    this.generatedAt,
    this.numberOfMasters,
    this.numberOfItemCount,
    this.requestOrderItems,
    this.displayCurrency,
  });

  // Factory method to create a GetRequestOrderListModel instance from JSON
  factory GetRequestOrderListModel.fromJson(Map<String, dynamic> json) {
    return GetRequestOrderListModel(
      requestOrderId: json['request_order_id'],
      facilityID: json['facilityID'],
      facilityName: json['facilityName'],
      cost: json['cost'].toDouble(),
      assetItemID: json['assetItemID'],
      comment: json['comment'],
      status: json['status'],
      status_short: json['status_short'],
      status_long: json['status_long'],
      rejectedRemark: json['rejectedRemark'],
      generatedBy: json['generatedBy'],
      rejectedBy: json['rejectedBy'],
      rejectedAt: json['rejectedAt'],
      approvedBy: json['approvedBy'],
      approvedAt: json['approvedAt'],
      generatedAt: json['generatedAt'],
      numberOfMasters: json['number_of_masters'],
      numberOfItemCount: json['number_of_item_count'],
      requestOrderItems: json['request_order_items'] != null
          ? List<RequestOrderItem>.from(json['request_order_items']
              .map((x) => RequestOrderItem.fromJson(x)))
          : null,
      displayCurrency: null,
    );
  }

  // Method to convert an instance of GetRequestOrderListModel to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_order_id'] = this.requestOrderId;
    data['facilityID'] = this.facilityID;
    data['facilityName'] = this.facilityName;
    data['cost'] = this.cost;
    data['assetItemID'] = this.assetItemID;
    data['comment'] = this.comment;
    data['status'] = this.status;
    data['status_short'] = this.status_short;
    data['status_long'] = this.status_long;
    data['rejectedRemark'] = this.rejectedRemark;
    data['generatedBy'] = this.generatedBy;
    data['rejectedBy'] = this.rejectedBy;
    data['rejectedAt'] = this.rejectedAt;
    data['approvedBy'] = this.approvedBy;
    data['approvedAt'] = this.approvedAt;
    data['generatedAt'] = this.generatedAt;
    data['number_of_masters'] = this.numberOfMasters;
    data['number_of_item_count'] = this.numberOfItemCount;
    if (this.requestOrderItems != null) {
      data['request_order_items'] =
          this.requestOrderItems!.map((v) => v.toJson()).toList();
    }
    data['displayCurrency'] = this.displayCurrency;
    return data;
  }
}

class RequestOrderItem {
  int? itemID;
  int? requestID;
  int? assetMasterItemID;
  dynamic assetItemID;
  double? cost;
  int? currencyId;
  String? currency;
  double? orderedQty;
  String? assetName;
  dynamic assetCode;
  dynamic assetType;
  dynamic assetCat;
  double? acceptedQty;
  String? comment;

  RequestOrderItem({
    this.itemID,
    this.requestID,
    this.assetMasterItemID,
    this.assetItemID,
    this.cost,
    this.currencyId,
    this.currency,
    this.orderedQty,
    this.assetName,
    this.assetCode,
    this.assetType,
    this.assetCat,
    this.acceptedQty,
    this.comment,
  });

  // Factory method to create a RequestOrderItem instance from JSON
  factory RequestOrderItem.fromJson(Map<String, dynamic> json) {
    return RequestOrderItem(
      itemID: json['itemID'],
      requestID: json['requestID'],
      assetMasterItemID: json['assetMasterItemID'],
      assetItemID: json['assetItemID'],
      cost: json['cost'].toDouble(),
      currencyId: json['currencyId'],
      currency: json['currency'],
      orderedQty: json['ordered_qty'].toDouble(),
      assetName: json['asset_name'],
      assetCode: json['asset_code'],
      assetType: json['asset_type'],
      assetCat: json['asset_cat'],
      acceptedQty: json['accepted_qty'].toDouble(),
      comment: json['comment'],
    );
  }

  // Method to convert an instance of RequestOrderItem to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemID'] = this.itemID;
    data['requestID'] = this.requestID;
    data['assetMasterItemID'] = this.assetMasterItemID;
    data['assetItemID'] = this.assetItemID;
    data['cost'] = this.cost;
    data['currencyId'] = this.currencyId;
    data['currency'] = this.currency;
    data['ordered_qty'] = this.orderedQty;
    data['asset_name'] = this.assetName;
    data['asset_code'] = this.assetCode;
    data['asset_type'] = this.assetType;
    data['asset_cat'] = this.assetCat;
    data['accepted_qty'] = this.acceptedQty;
    data['comment'] = this.comment;
    return data;
  }
}
