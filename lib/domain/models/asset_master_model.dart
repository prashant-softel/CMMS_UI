import 'dart:convert';

List<AssetMasterModel> assetmasterListModelFromJson(String str) =>
    List<AssetMasterModel>.from(
        json.decode(str).map((x) => AssetMasterModel.fromJson(x)));

String assetmasterListModelToJson(List<AssetMasterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AssetMasterModel {
  int? id;

  String? asset_type;
  int? min_qty;
  int? flag;
  int? asset_Type_id;
  String? asset_code;
  String? asset_name;
  String? description;
  String? approval_required;
  String? cat_name;
  String? measurement;
  int? decimal_status;
  String? asset_description;
  int? item_category_ID;
  int? unit_measurement_ID;
  int? approval_required_id;
  String? fileData;
  String? section;
  int? max_request_qty;
  int? reorder_qty;

  // String? action;

  AssetMasterModel({
    this.id,
    this.asset_type,
    this.min_qty,
    this.flag,
    this.asset_Type_id,
    this.asset_code,
    this.asset_name,
    this.description,
    this.approval_required,
    this.cat_name,
    this.measurement,
    this.decimal_status,
    this.asset_description,
    this.item_category_ID,
    this.unit_measurement_ID,
    this.approval_required_id,
    this.fileData,
    this.section,
    this.max_request_qty,
    this.reorder_qty,
    // this.asset_name,
  });

  factory AssetMasterModel.fromJson(Map<String, dynamic> json) =>
      AssetMasterModel(
        id: json['id'],
        asset_type: json['asset_type'],
        min_qty: json['min_qty'],
        flag: json['flag'],
        approval_required: json['approval_required'],
        cat_name: json['cat_name'],
        measurement: json['measurement'],
        decimal_status: json['decimal_status'],
        asset_description: json['asset_description'],
        fileData: json['fileData'],
        asset_code: json['asset_code'],
        asset_name: json['asset_name'],
        description: json['description'],
        asset_Type_id: json['asset_type_ID'],
        item_category_ID: json['item_category_ID'],
        unit_measurement_ID: json['unit_measurement_ID'],
        approval_required_id: json['approval_required_id'],
        section: json['section'],
        max_request_qty: json['max_request_qty'],
        reorder_qty: json['reorder_qty'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "asset_type": asset_type,
        "min_qty": min_qty,
        "flag": flag,
        "approval_required": approval_required,
        "cat_name": cat_name,
        "measurement": measurement,
        "decimal_status": decimal_status,
        "asset_description": asset_description,
        "fileData": fileData,
        "asset_code": asset_code,
        "asset_name": asset_name,
        "description": description,
        "asset_type_ID": asset_Type_id,
        "item_category_ID": item_category_ID,
        "unit_measurement_ID": unit_measurement_ID,
        "approval_required_id": approval_required_id,
        "section": section,
        "max_request_qty": max_request_qty,
        "reorder_qty": reorder_qty
      };
}
