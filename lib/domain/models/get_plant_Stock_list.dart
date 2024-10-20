import 'dart:convert';

List<PlantStockListModel> MrsModelFromJson(String str) =>
    List<PlantStockListModel>.from(
        json.decode(str).map((x) => PlantStockListModel.fromJson(x)));

String plantstockListModelToJson(List<PlantStockListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlantStockListModel {
  int? facilityID;
  String? facilityName;

  List<StockDetails> stockDetails;

  PlantStockListModel(
      {required this.stockDetails, this.facilityID, this.facilityName});

  factory PlantStockListModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['stockDetails'] as List;
    print(list.runtimeType);
    List<StockDetails> stockDetails =
        list.map((i) => StockDetails.fromJson(i)).toList();

    return PlantStockListModel(
      facilityID: parsedJson['facilityID'],
      facilityName: parsedJson['facilityName'],
      stockDetails: stockDetails,
    );
  }
  Map<String, dynamic> toJson() => {
        "facilityID": facilityID,
        "facilityName": facilityName,
        "stockDetails": List<dynamic>.from(stockDetails.map((x) => x.toJson())),
      };
}

class StockDetails {
  int? mrs_item_id;
  dynamic serial_no;
  String? issued_date;
  dynamic available_qty;
  dynamic requested_qty;
  dynamic consumed_qty;
  dynamic returned_qty;
  dynamic issued_qty;
  dynamic approved_qty;
  int? facility_Is_Block;
  dynamic facility_Is_Block_of_name;
  int? assetItemID;
  String? name;
  String? asset_code;
  int? asset_type_ID;
  String? asset_type;
  double? opening;
  double? inward;
  double? outward;
  double? balance;
  String? return_remarks;
  StockDetails(
      {this.assetItemID,
      this.asset_code,
      this.mrs_item_id,
      this.name,
      this.asset_type_ID,
      this.asset_type,
      this.balance,
      this.issued_date,
      this.returned_qty,
      this.facility_Is_Block,
      this.facility_Is_Block_of_name,
      this.inward,
      this.opening,
      this.outward,
      this.approved_qty,
      this.available_qty,
      this.consumed_qty,
      this.issued_qty,
      this.requested_qty,
      this.return_remarks,
      this.serial_no});

  factory StockDetails.fromJson(Map<String, dynamic> parsedJson) {
    var serialNumber = parsedJson['serial_number'] ?? '';
    return StockDetails(
      assetItemID: parsedJson['assetItemID'],
      return_remarks: parsedJson['return_remarks'],
      mrs_item_id: parsedJson['mrs_item_id'],
      returned_qty: parsedJson['returned_qty'],
      approved_qty: parsedJson['approved_qty'],
      available_qty: parsedJson['available_qty'],
      consumed_qty: parsedJson['consumed_qty'],
      issued_qty: parsedJson['issued_qty'],
      requested_qty: parsedJson['requested_qty'],
      serial_no: serialNumber,
      asset_code: parsedJson['asset_code'],
      asset_type_ID: parsedJson['asset_type_ID'],
      asset_type: parsedJson['asset_type'],
      balance: parsedJson['balance'],
      issued_date: parsedJson['issued_date'],
      facility_Is_Block: parsedJson['facility_Is_Block'],
      facility_Is_Block_of_name: parsedJson['facility_Is_Block_of_name'],
      name: "${parsedJson['asset_name']} ($serialNumber)",
      inward: parsedJson['inward'],
      opening: parsedJson['opening'],
      outward: parsedJson['outward'],
    );
  }
  Map<String, dynamic> toJson() => {
        "return_remarks": return_remarks,
        "returned_qty": returned_qty,
        "mrs_item_id": mrs_item_id,
        "issued_date": issued_date,
        "assetItemID": assetItemID,
        "approved_qty": approved_qty,
        "available_qty": available_qty,
        "consumed_qty": consumed_qty,
        "issued_qty": issued_qty,
        "requested_qty": requested_qty,
        "serial_number": serial_no,
        "asset_code": asset_code,
        "asset_type_ID": asset_type_ID,
        "balance": balance,
        "asset_type": asset_type,
        "facility_Is_Block": facility_Is_Block,
        "facility_Is_Block_of_name": facility_Is_Block_of_name,
        "asset_name": name,
        "inward": inward,
        "opening": opening,
        "outward": outward,
      };
}
