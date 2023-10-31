import 'dart:convert';

List<TransactionReportListModel> transactionReportListModelFromJson(
        String str) =>
    List<TransactionReportListModel>.from(
        json.decode(str).map(TransactionReportListModel.fromJson));

class TransactionReportListModel {
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
  String? createdBy;
  String? createdAt;

  TransactionReportListModel({
    this.fromActorID,
    this.fromActorType,
    this.fromActorName,
    this.toActorID,
    this.toActorType,
    this.toActorName,
    this.assetItemID,
    this.assetItemName,
    this.qty,
    this.facilityName,
    this.remarks,
    this.lastUpdated,
    this.createdBy,
    this.createdAt,
  });

  // Factory method to create a TransactionReportListModel instance from JSON
  factory TransactionReportListModel.fromJson(Map<String, dynamic> json) {
    return TransactionReportListModel(
      fromActorID: json["fromActorID"],
      fromActorType: json["fromActorType"],
      fromActorName: json["fromActorName"],
      toActorID: json["toActorID"],
      toActorType: json["toActorType"],
      toActorName: json["toActorName"],
      assetItemID: json["assetItemID"],
      assetItemName: json["assetItemName"],
      qty: json["qty"],
      facilityName: json["facilityName"],
      remarks: json["remarks"],
      lastUpdated: json["lastUpdated"],
      createdBy: json["createdBy"],
      createdAt: json["createdAt"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fromActorID'] = this.fromActorID;
    data['fromActorType'] = this.fromActorType;
    data['fromActorName'] = this.fromActorName;
    data['toActorID'] = this.toActorID;
    data['toActorType'] = this.toActorType;
    data['toActorName'] = this.toActorName;
    data['assetItemID'] = this.assetItemID;
    data['assetItemName'] = this.assetItemName;
    data['qty'] = this.qty;
    data['facilityName'] = this.facilityName;
    data['remarks'] = this.remarks;
    data['lastUpdated'] = this.lastUpdated;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;

    return data;
  }
}
