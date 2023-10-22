import 'dart:convert';

List<TransactionStockReportListModel> transactionStockReportListModelFromJson(
        String str) =>
    List<TransactionStockReportListModel>.from(json
        .decode(str)
        .map((x) => TransactionStockReportListModel.fromJson(x)));

class TransactionStockReportListModel {
  int? fromActorID;
  String? fromActorType;
  String? fromActorName;
  int? toActorID;
  String? toActorType;
  String? toActorName;
  int? assetItemID;
  String? assetItemName;
  double? qty;
  String? facilityName;
  String? remarks;
  String? lastUpdated;
  dynamic createdBy;
  dynamic createdAt;

  TransactionStockReportListModel(
      {this.assetItemID,
      this.assetItemName,
      this.createdAt,
      this.createdBy,
      this.facilityName,
      this.fromActorID,
      this.fromActorName,
      this.fromActorType,
      this.lastUpdated,
      this.qty,
      this.remarks,
      this.toActorID,
      this.toActorName,
      this.toActorType});

  factory TransactionStockReportListModel.fromJson(
      Map<String, dynamic> parsedJson) {
    return TransactionStockReportListModel(
      assetItemID: parsedJson['assetItemID'],
      assetItemName: parsedJson['assetItemName'],
      createdAt: parsedJson['createdAt'],
      createdBy: parsedJson['createdBy'],
      facilityName: parsedJson['facilityName'],
      fromActorID: parsedJson['fromActorID'],
      fromActorName: parsedJson['fromActorName'],
      fromActorType: parsedJson['fromActorType'],
      lastUpdated: parsedJson['lastUpdated'],
      qty: parsedJson['qty'],
      remarks: parsedJson['remarks'],
      toActorID: parsedJson['toActorID'],
      toActorName: parsedJson['toActorName'],
      toActorType: parsedJson['toActorType'],
    );
  }
  Map<String, dynamic> toJson() => {
        "assetItemID": assetItemID,
        "assetItemName": assetItemName,
        "createdAt": createdAt,
        "createdBy": createdBy,
        "facilityName": facilityName,
        "fromActorID": fromActorID,
        "fromActorName": fromActorName,
        "fromActorType": fromActorType,
        "lastUpdated": lastUpdated,
        "qty": qty,
        "remarks": remarks,
        "toActorID": toActorID,
        "toActorName": toActorName,
        "toActorType": toActorType,
      };
}
