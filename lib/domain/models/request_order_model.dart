import 'dart:convert';

CreateRequestOrderDataModel createRequestOrderDataModel(String str) =>
    CreateRequestOrderDataModel.fromJson(json.decode(str));

class CreateRequestOrderDataModel {
  int? facilityID;

  List<SubmitItems?>? items;
  CreateRequestOrderDataModel({
    this.facilityID,
    this.items,
  });

  factory CreateRequestOrderDataModel.fromJson(Map<String, dynamic> json) {
    return CreateRequestOrderDataModel(
      facilityID: json['facilityID'],
      items: json["submitItems"] != null
          ? List<SubmitItems>.from(
              json["submitItems"]?.map((x) => SubmitItems.fromJson(x)))
          : [],
    );
  }
  Map<String, dynamic> toJson() => {
        "facilityID": facilityID,
        "submitItems": List<dynamic>.from(items!.map((x) => x)),
      };
}

class SubmitItems {
  SubmitItems({
    this.assetItemID,
    this.ordered_qty,
    this.cost,
  });

  int? assetItemID;
  int? ordered_qty;

  int? cost;

  factory SubmitItems.fromJson(Map<String, dynamic> json) => SubmitItems(
        assetItemID: json["assetItemID"],
        ordered_qty: json["ordered_qty"],
        cost: json["cost"],
      );

  Map<String, dynamic> toJson() => {
        "assetItemID": assetItemID,
        "ordered_qty": ordered_qty,
        "cost": cost,
      };
}
