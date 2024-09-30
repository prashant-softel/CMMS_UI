import 'dart:convert';

List<SmReportListModel> smReportListModelFromJson(String str) =>
    List<SmReportListModel>.from(
        json.decode(str).map((x) => SmReportListModel.fromJson(x)));

String smReportListModelToJson(List<SmReportListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SmReportListModel {
  SmReportListModel(
      {this.act_available_qty,
      this.asset_Item_ID,
      this.asset_code,
      this.asset_name,
      this.asset_type,
      this.asset_type_ID,
      this.facility_ID,
      this.facility_Name,
      this.id,
      this.inward,
      this.material_Category,
      this.min_available_qty,
      this.mrs_ID,
      this.opening,
      this.outward,
      this.per_item_cost});

  int? id;
  int? mrs_ID;
  String? asset_code;
  int? facility_ID;
  String? facility_Name;
  String? material_Category;
  int? asset_Item_ID;
  String? asset_name;
  int? asset_type_ID;
  String? asset_type;
  int? per_item_cost;
  int? opening;
  int? inward;
  int? outward;
  int? min_available_qty;
  int? act_available_qty;

  factory SmReportListModel.fromJson(Map<String, dynamic> json) =>
      SmReportListModel(
        id: json["id"],
        mrs_ID: json["mrs_ID"],
        asset_code: json['asset_code'],
        facility_ID: json['facility_ID'],
        facility_Name: json['facility_Name'],
        material_Category: json['material_Category'],
        asset_Item_ID: json['asset_Item_ID'],
        asset_name: json['asset_name'],
        asset_type_ID: json['asset_type_ID'],
        asset_type: json['asset_type'],
        per_item_cost: json['per_item_cost'],
        opening: json['opening'],
        inward: json['inward'],
        outward: json['outward'],
        min_available_qty: json['min_available_qty'],
        act_available_qty: json['act_available_qty'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mrs_ID": mrs_ID,
        "asset_code": asset_code,
        "facility_ID": facility_ID,
        "facility_Name": facility_Name,
        "material_Category": material_Category,
        "asset_Item_ID": asset_Item_ID,
        "asset_name": asset_name,
        "asset_type_ID": asset_type_ID,
        "asset_type": asset_type,
        "per_item_cost": per_item_cost,
        "opening": opening,
        "inward": inward,
        "outward": outward,
        "min_available_qty": min_available_qty,
        "act_available_qty": act_available_qty,
      };
}
