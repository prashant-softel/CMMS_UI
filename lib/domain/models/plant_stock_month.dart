import 'dart:convert';

List<PlantStockMonth> plantStockMonthDetailModelFromJson(String str) =>
    List<PlantStockMonth>.from(
        json.decode(str).map((x) => PlantStockMonth.fromJson(x)));

// String plantStockMonthDetailModelFromJson(List<PlantStockMonth> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class PlantStockMonth {
  dynamic facilityName;
  dynamic facilityID;
  dynamic opening;
  List<PlantDetail> details;

  PlantStockMonth({
    this.facilityName,
    this.facilityID,
    this.opening,
    required this.details,
  });

  factory PlantStockMonth.fromJson(Map<String, dynamic> json) {
    return PlantStockMonth(
      facilityName: json['facilityName'],
      facilityID: json['facilityID'],
      opening: json['opening'],
      details: List<PlantDetail>.from(
          json['details'].map((x) => PlantDetail.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'facilityName': facilityName,
      'facilityID': facilityID,
      'opening': opening,
      'details': List<dynamic>.from(details.map((x) => x.toJson())),
    };
  }
}

class PlantDetail {
  dynamic fromActorID;
  dynamic fromActorType;
  dynamic fromActorName;
  dynamic toActorID;
  dynamic toActorType;
  dynamic toActorName;
  dynamic assetItemID;
  dynamic assetItemName;
  dynamic assetType;
  dynamic qty;
  dynamic mrsID;
  dynamic referenceID;
  dynamic referenceBy;
  dynamic referenceName;
  dynamic remarks;
   String? lastUpdated;
  dynamic createdBy;
  String? createdAt;

  PlantDetail({
    this.fromActorID,
    this.fromActorType,
    this.fromActorName,
    this.toActorID,
    this.toActorType,
    this.toActorName,
    this.assetItemID,
    this.assetItemName,
    this.assetType,
    this.qty,
    this.mrsID,
    this.referenceID,
    this.referenceBy,
    this.referenceName,
    this.remarks,
    this.lastUpdated,
    this.createdBy,
    this.createdAt,
  });

  factory PlantDetail.fromJson(Map<String, dynamic> json) {
    return PlantDetail(
      fromActorID: json['fromActorID'],
      fromActorType: "${json['fromActorType']}-${json['fromActorName']}",
      fromActorName: json['fromActorName'],
      toActorID: json['toActorID'],
      toActorType: "${json['toActorType']}-${json['toActorName']}",
      toActorName: json['toActorName'],
      assetItemID: json['assetItemID'],
      assetItemName: json['assetItemName']??"",
      assetType: json['asset_type'],
      qty: json['qty']?.toString(),
      mrsID: json['mrsID'],
      referenceID: json['referenceID'],
      referenceBy: json['referenceBy'],
      referenceName: json['referenceName'],
      remarks: json['remarks'],
     lastUpdated: "${json['lastUpdated']}-${json['createdBy']}",
      createdBy: json['createdBy'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fromActorID': fromActorID,
      'fromActorType': fromActorType,
      'fromActorName': fromActorName,
      'toActorID': toActorID,
      'toActorType': toActorType,
      'toActorName': toActorName,
      'assetItemID': assetItemID,
      'assetItemName': assetItemName,
      'asset_type': assetType,
      'qty': qty,
      'mrsID': mrsID,
      'referenceID': referenceID,
      'referenceBy': referenceBy,
      'referenceName': referenceName,
      'remarks': remarks,
      'lastUpdated': lastUpdated,
      'createdBy': createdBy,
      'createdAt': createdAt,
    };
  }
}
