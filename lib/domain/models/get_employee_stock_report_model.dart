import 'dart:convert';

List<EmployeeStockReportListModel> MrsModelFromJson(String str) =>
    List<EmployeeStockReportListModel>.from(
        json.decode(str).map((x) => EmployeeStockReportListModel.fromJson(x)));

class EmployeeStockReportListModel {
  String? facilityName;
  int? facility_Is_Block;
  dynamic facility_Is_Block_of_name;
  String? requested_by_name;
  int? assetItemID;
  String? asset_name;
  String? asset_code;
  int? asset_type_ID;
  double? opening;
  int? inward;
  int? outward;
  double? balance;

  EmployeeStockReportListModel(
      {this.assetItemID,
      this.asset_code,
      this.asset_name,
      this.asset_type_ID,
      this.balance,
      this.facility_Is_Block,
      this.facility_Is_Block_of_name,
      this.inward,
      this.opening,
      this.outward,
      this.facilityName,
      this.requested_by_name});

  factory EmployeeStockReportListModel.fromJson(
      Map<String, dynamic> parsedJson) {
    return EmployeeStockReportListModel(
      assetItemID: parsedJson['assetItemID'],
      asset_code: parsedJson['asset_code'],
      asset_type_ID: parsedJson['asset_type_ID'],
      balance: parsedJson['balance'],
      facility_Is_Block: parsedJson['facility_Is_Block'],
      facility_Is_Block_of_name: parsedJson['facility_Is_Block_of_name'],
      asset_name: parsedJson['asset_name'],
      inward: parsedJson['inward'],
      opening: parsedJson['opening'],
      outward: parsedJson['outward'],
      facilityName: parsedJson['facilityName'],
      requested_by_name: parsedJson['requested_by_name'],
    );
  }
  Map<String, dynamic> toJson() => {
        "assetItemID": assetItemID,
        "asset_code": asset_code,
        "asset_type_ID": asset_type_ID,
        "balance": balance,
        "facility_Is_Block": facility_Is_Block,
        "facility_Is_Block_of_name": facility_Is_Block_of_name,
        "asset_name": asset_name,
        "inward": inward,
        "opening": opening,
        "outward": outward,
        "facilityName": facilityName,
        "requested_by_name": requested_by_name,
      };
}
