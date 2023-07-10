import 'dart:convert';

List<GetAssetItemsModel> MrsModelFromJson(String str) =>
    List<GetAssetItemsModel>.from(
        json.decode(str).map((x) => GetAssetItemsModel.fromJson(x)));

class GetAssetItemsModel {
  int? asset_type_ID;
  int? asset_ID;
  String? asset_code;
  String? cat_name;
  int? id;
  dynamic serial_number;
  String? name;
  String? asset_type;
  String? approval_required;
  String? file_path;
  int? asset_master_id;
  int? spare_multi_selection;
  int? available_qty;
  GetAssetItemsModel(
      {this.approval_required,
      this.asset_ID,
      this.asset_code,
      this.asset_master_id,
      this.name,
      this.asset_type,
      this.asset_type_ID,
      this.cat_name,
      this.file_path,
      this.id,
      this.serial_number,
      this.spare_multi_selection,
      this.available_qty});

  factory GetAssetItemsModel.fromJson(Map<String, dynamic> parsedJson) {
    return GetAssetItemsModel(
      approval_required: parsedJson['approval_required'],
      asset_ID: parsedJson['asset_ID'],
      asset_code: parsedJson['asset_code'],
      asset_master_id: parsedJson['asset_master_id'],
      name: parsedJson['asset_name'],
      id: parsedJson['id'],
      asset_type: parsedJson['asset_type'],
      asset_type_ID: parsedJson['asset_type_ID'],
      cat_name: parsedJson['cat_name'],
      file_path: parsedJson['file_path'],
      available_qty: parsedJson['available_qty'],
      serial_number: parsedJson['serial_number'],
      spare_multi_selection: parsedJson['spare_multi_selection'],
    );
  }
  Map<String, dynamic> toJson() => {
        "approval_required": approval_required,
        "asset_ID": asset_ID,
        "asset_code": asset_code,
        "asset_master_id": asset_master_id,
        "asset_name": name,
        "id": id,
        "asset_type": asset_type,
        "asset_type_ID": asset_type_ID,
        "cat_name": cat_name,
        "file_path": file_path,
        "serial_number": serial_number,
        "available_qty": available_qty,
      };
}
