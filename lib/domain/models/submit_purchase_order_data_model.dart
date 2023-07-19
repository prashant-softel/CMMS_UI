import 'dart:convert';

SubmitPurchaseOrderDataModel submitPurchaseOrderDataModel(String str) =>
    SubmitPurchaseOrderDataModel.fromJson(json.decode(str));

class SubmitPurchaseOrderDataModel {
  int? id;
  int? facility_id;
  int? purchaseID;

  List<SubmitItems?>? items;
  SubmitPurchaseOrderDataModel(
      {this.facility_id, this.items, this.id, this.purchaseID});

  factory SubmitPurchaseOrderDataModel.fromJson(Map<String, dynamic> json) {
    return SubmitPurchaseOrderDataModel(
      facility_id: json['facility_id'],
      id: json['id'],
      purchaseID: json['purchaseID'],
      items: json["submitItems"] != null
          ? List<SubmitItems>.from(
              json["submitItems"]?.map((x) => SubmitItems.fromJson(x)))
          : [],
    );
  }
  Map<String, dynamic> toJson() => {
        "facility_id": facility_id,
        "id": id,
        "purchaseID": purchaseID,
        "submitItems": List<dynamic>.from(items!.map((x) => x)),
      };
}

class SubmitItems {
  SubmitItems({
    this.assetCode,
    this.assetItemID,
    this.orderedQty,
    this.type,
    this.cost,
  });

  String? assetCode;
  int? assetItemID;
  int? orderedQty;
  int? type;
  int? cost;

  factory SubmitItems.fromJson(Map<String, dynamic> json) => SubmitItems(
        assetCode: json["assetCode"],
        assetItemID: json["assetItemID"],
        orderedQty: json["orderedQty"],
        type: json["type"],
        cost: json["cost"],
      );

  Map<String, dynamic> toJson() => {
        "assetCode": assetCode,
        "assetItemID": assetItemID,
        "orderedQty": orderedQty,
        "type": type,
        "cost": cost,
      };
}
