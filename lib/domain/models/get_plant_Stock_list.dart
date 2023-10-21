import 'dart:convert';

List<PlantStockListModel> MrsModelFromJson(String str) =>
    List<PlantStockListModel>.from(
        json.decode(str).map((x) => PlantStockListModel.fromJson(x)));

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
  int? facility_Is_Block;
  dynamic facility_Is_Block_of_name;
  int? assetItemID;
  String? asset_name;
  String? asset_code;
  int? asset_type_ID;
  String? asset_type;
  double? opening;
  double? inward;
  double? outward;
  double? balance;

  StockDetails(
      {this.assetItemID,
      this.asset_code,
      this.asset_name,
      this.asset_type_ID,
      this.asset_type,
      this.balance,
      this.facility_Is_Block,
      this.facility_Is_Block_of_name,
      this.inward,
      this.opening,
      this.outward});

  factory StockDetails.fromJson(Map<String, dynamic> parsedJson) {
    return StockDetails(
      assetItemID: parsedJson['assetItemID'],
      asset_code: parsedJson['asset_code'],
      asset_type_ID: parsedJson['asset_type_ID'],
      balance: parsedJson['balance'],
      asset_type: parsedJson['asset_type'],
      facility_Is_Block: parsedJson['facility_Is_Block'],
      facility_Is_Block_of_name: parsedJson['facility_Is_Block_of_name'],
      asset_name: parsedJson['asset_name'],
      inward: parsedJson['inward'],
      opening: parsedJson['opening'],
      outward: parsedJson['outward'],
    );
  }
  Map<String, dynamic> toJson() => {
        "assetItemID": assetItemID,
        "asset_code": asset_code,
        "asset_type_ID": asset_type_ID,
        "balance": balance,
        "asset_type": asset_type,
        "facility_Is_Block": facility_Is_Block,
        "facility_Is_Block_of_name": facility_Is_Block_of_name,
        "asset_name": asset_name,
        "inward": inward,
        "opening": opening,
        "outward": outward,
      };
}
