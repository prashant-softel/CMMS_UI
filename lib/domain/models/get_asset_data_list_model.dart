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
  GetAssetDataModel({
    this.id,
    this.asset_type,
    this.name,
    this.asset_code,
    this.cat_name,
    this.serial_number,
    this.returned_qty,
    this.return_remarks,
    this.mrs_item_id,
  });

  GetAssetDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mrs_item_id = json['mrs_item_id'];
    serial_number = json['serial_number'];
    asset_type = json['asset_type'];
    name = json['asset_name'];
    asset_code = json['asset_code'];
    cat_name = json['cat_name'];
    return_remarks = json['return_remarks'];
    returned_qty = json['returned_qty'];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "mrs_item_id": mrs_item_id,
        "serial_number": serial_number,
        "asset_type": asset_type,
        "asset_name": name,
        "asset_code": asset_code,
        "cat_name": cat_name,
        "return_remarks": return_remarks,
        "returned_qty": returned_qty,
      };
}
