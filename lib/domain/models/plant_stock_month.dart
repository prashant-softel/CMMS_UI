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
  List<PlantDetail>? details;

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
      details: json['details'] == null
          ? null
          : List<PlantDetail>.from(
              json['details'].map((x) => PlantDetail.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'facilityName': facilityName,
      'facilityID': facilityID,
      'opening': opening,
      'details': List<dynamic>.from(details!.map((x) => x.toJson())),
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
  String? toActorType1;
  String? fromActorType1;

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
    this.toActorType1,
    this.fromActorType1,
  });

  factory PlantDetail.fromJson(Map<String, dynamic> json) {
 String fromActorType = json['fromActorType'];
  String formattedFromActorType;

  if (fromActorType == "JobCard") {
    formattedFromActorType = "JC${json['fromActorID']}-${json['fromActorName']}";
  }else if(fromActorType=="Inventory"){
     formattedFromActorType = "Asset${json['fromActorID']}-${json['fromActorName']}";
  } else {
    formattedFromActorType = "${fromActorType}${json['fromActorID']}-${json['fromActorName']}";
  }
   String toActorType = json['toActorType'];
  String formattedtoActorType;

  if (toActorType == "JobCard") {
    formattedtoActorType = "JC${json['toActorID']}-${json['toActorName']}";
  }else if(toActorType == "Inventory"){
    formattedtoActorType = "Asset${json['toActorID']}-${json['toActorName']}";
  } else {
    formattedtoActorType = "${toActorType}${json['toActorID']}-${json['toActorName']}";
  }
   
    return PlantDetail(
      fromActorID: json['fromActorID'],
      fromActorType:formattedFromActorType,
          // "${json['fromActorType']}${json['fromActorID']}-${json['fromActorName']}",
      fromActorType1: json['fromActorType'],
      fromActorName: json['fromActorName'],
      toActorID: json['toActorID'],
      toActorType: formattedtoActorType,
      // "${json['toActorType']}${json['toActorID']}-${json['toActorName']}",
      toActorType1: json['toActorType'],
      toActorName: json['toActorName'],
      assetItemID: json['assetItemID'],
      assetItemName: json['assetItemName'] ?? "",
      assetType: json['asset_type'],
      qty: json['qty'],
      mrsID: json['mrsID'],
      referenceID: json['referenceID'],
      referenceBy: json['referenceBy'],
      referenceName: json['referenceName'],
      remarks: json['remarks'],
      lastUpdated: "${json['createdBy']}-${json['lastUpdated']}",
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
