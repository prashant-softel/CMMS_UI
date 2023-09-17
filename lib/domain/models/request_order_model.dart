import 'dart:convert';

CreateRequestOrderDataModel createRequestOrderDataModel(String str) =>
    CreateRequestOrderDataModel.fromJson(json.decode(str));

class CreateRequestOrderDataModel {
  int? facilityID;
  int? request_order_id;

  List<SubmitItems?>? items;
  String? comment;
  CreateRequestOrderDataModel({
    this.facilityID,
    this.items,
    this.comment,
    this.request_order_id,
  });

  factory CreateRequestOrderDataModel.fromJson(Map<String, dynamic> json) {
    return CreateRequestOrderDataModel(
      request_order_id: json['request_order_id'],
      facilityID: json['facilityID'],
      items: json["request_order_items"] != null
          ? List<SubmitItems>.from(
              json["request_order_items"]?.map((x) => SubmitItems.fromJson(x)))
          : [],
      comment: json['comment'],
    );
  }
  Map<String, dynamic> toJson() => {
        "facilityID": facilityID,
        "request_order_items": List<dynamic>.from(items!.map((x) => x)),
        "comment": comment,
        "request_order_id": request_order_id,
      };
}

class SubmitItems {
  SubmitItems({
    // this.itemID,
    this.assetItemID,
    this.cost,
    this.ordered_qty,
    this.comment,
    this.itemID,
  });

  // int? itemID;
  int? assetItemID;
  int? cost;
  int? ordered_qty;
  String? comment;
  int? itemID;

  factory SubmitItems.fromJson(Map<String, dynamic> json) => SubmitItems(
        // itemID: json["itemID"],
        assetItemID: json["assetItemID"],
        itemID: json["itemID"],

        cost: json["cost"],
        ordered_qty: json["ordered_qty"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "itemID": itemID,
        "assetItemID": assetItemID,
        "cost": cost,
        "ordered_qty": ordered_qty,
        "comment": comment,
      };
}
