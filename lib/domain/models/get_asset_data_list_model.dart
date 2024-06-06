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
  // int? status;

  GetAssetDataModel(
      {this.id,
      this.asset_type,
      this.name,
      this.asset_code,
      this.cat_name,
      this.serial_number,
      this.returned_qty
      // this.status,
      });

  GetAssetDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serial_number = json['serial_number'];
    asset_type = json['asset_type'];
    name = json['asset_name'];
    asset_code = json['asset_code'];
    cat_name = json['cat_name'];

    returned_qty = json['returned_qty'];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "serial_number": serial_number,
        "asset_type": asset_type,
        "asset_name": name,
        "asset_code": asset_code,
        "cat_name": cat_name,
        "returned_qty": returned_qty,
      };
}
