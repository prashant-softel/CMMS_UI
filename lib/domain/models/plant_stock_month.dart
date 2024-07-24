import 'dart:convert';

List<PlantStockMonth> PlantStockMonthDetailModelFromJson(String str) =>
    List<PlantStockMonth>.from(
        json.decode(str).map((x) => PlantStockMonth.fromJson(x)));

// String pmPlanModelToJson(List<PlantStockMonth> data) =>
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
      details: List<PlantDetail>.from(json['details'].map((x) => PlantDetail.fromJson(x))),
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
  dynamic  fromActorType;
  dynamic  fromActorName;
  dynamic toActorID;
  dynamic  toActorType;
  dynamic  toActorName;
  dynamic assetItemID;
  dynamic assetItemName;
  dynamic  assetType;
  dynamic qty;
  dynamic mrsID;
  dynamic referenceID;
  dynamic referenceBy;
  dynamic  referenceName;
  dynamic remarks;
  dynamic lastUpdated;
  dynamic  createdBy;
  dynamic createdAt;

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
      fromActorType: json['fromActorType'],
      fromActorName: json['fromActorName'],
      toActorID: json['toActorID'],
      toActorType: json['toActorType'],
      toActorName: json['toActorName'],
      assetItemID: json['assetItemID'],
      assetItemName: json['assetItemName'],
      assetType: json['asset_type'],
      qty: json['qty'],
      mrsID: json['mrsID'],
      referenceID: json['referenceID'],
      referenceBy: json['referenceBy'],
      referenceName: json['referenceName'],
      remarks: json['remarks'],
      lastUpdated: DateTime.parse(json['lastUpdated']),
      createdBy: json['createdBy'],
      createdAt: DateTime.parse(json['createdAt']),
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
      'lastUpdated': lastUpdated.toIso8601String(),
      'createdBy': createdBy,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
