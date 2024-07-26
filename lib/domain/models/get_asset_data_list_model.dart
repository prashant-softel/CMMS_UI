import 'dart:convert';

List<GetAssetDataModel> newPermitListFromJson(String str) =>
    List<GetAssetDataModel>.from(
        json.decode(str).map(GetAssetDataModel.fromJson));

String newPermitListToJson(List<GetAssetDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAssetDataModel {
  int? id;
  String? asset_type;
  String? name;
  String? asset_code;
  String? cat_name;
  dynamic serial_number;
  dynamic returned_qty;
  String? return_remarks;
  int? mrs_item_id;
  int? itemID;
  int? requestID;
  String? currency;
  int? currencyID;
  int? fromActorID;
  String? fromActorName;

  double? cost;
  double? ordered_qty;
  int? accepted_qty;
  String? comment;
  String? asset_name;
  String? asset_cat;
  GetAssetDataModel(
      {this.id,
      this.asset_type,
      this.name,
      this.currencyID,
      this.asset_code,
      this.cat_name,
      this.serial_number,
      this.returned_qty,
      this.return_remarks,
      this.mrs_item_id,
      this.accepted_qty,
      this.currency,
      this.asset_cat,
      this.asset_name,
      this.comment,
      this.cost,
      this.itemID,
      this.ordered_qty,
      this.requestID,
      this.fromActorName,
      this.fromActorID});

  GetAssetDataModel.fromJson(Map<String, dynamic> json) {
    accepted_qty = json['accepted_qty'];
    id = json['id'];

    fromActorName = json['fromActorName'];
    asset_cat = json['asset_cat'];
    asset_name = json['asset_name'];
    comment = json['comment'];
    cost = json['cost'];
    currency = json['currency'];
    currencyID = json['currencyID'];

    itemID = json['itemID'];
    ordered_qty = json['ordered_qty'];
    requestID = json['requestID'];

    mrs_item_id = json['mrs_item_id'];
    serial_number = json['serial_number'];
    asset_type = json['asset_type'];
    name = json['asset_name'];
    asset_code = json['asset_code'];
    cat_name = json['cat_name'];
    return_remarks = json['return_remarks'];
    returned_qty = json['returned_qty'];
    fromActorID = json['fromActorID'];
  }

  Map<String, dynamic> toJson() => {
        "accepted_qty": accepted_qty,
        "fromActorName": fromActorName,
        "fromActorID": fromActorID,
        "asset_cat": asset_cat,
        "asset_name": asset_name,
        "comment": comment,
        "cost": cost,
        "currency": currency,
        "currencyID": currencyID,

        "itemID": itemID,
        "ordered_qty": ordered_qty,
        "requestID": requestID,
        "id": id,
        "mrs_item_id": mrs_item_id,
        "serial_number": serial_number,
        "asset_type": asset_type,
        // "asset_name": name,
        "asset_code": asset_code,
        "cat_name": cat_name,
        "return_remarks": return_remarks,
        "returned_qty": returned_qty,
      };
}
