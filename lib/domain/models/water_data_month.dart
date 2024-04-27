import 'dart:convert';

List<WaterDataMonth> waterDataMonthDetailModelFromJson(String str) =>
    List<WaterDataMonth>.from(
        json.decode(str).map((x) => WaterDataMonth.fromJson(x)));

String waterDataMonthDetailModelToJson(WaterDataMonth data) =>
    json.encode(data.toJson());

class WaterDataMonth {
  int? facilityId;
  String? facilityName;
  String? month;
  int? year;
  List<ItemData>? itemData;

  WaterDataMonth({
    this.facilityId,
    this.facilityName,
    this.month,
    this.year,
    this.itemData,
  });

  factory WaterDataMonth.fromJson(Map<String, dynamic> json) => WaterDataMonth(
        facilityId: json['facility_id'],
        facilityName: json['facility_name'],
        month: json['month'],
        year: json['year'],
        itemData: List<ItemData>.from(
            json["item_data"].map((x) => ItemData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'facility_id': facilityId,
        'facility_name': facilityName,
        'month': month,
        'year': year,
        'item_data': itemData?.map((x) => x.toJson()).toList() ?? [],
      };
}

class ItemData {
  String? waterType;
  int? waterTypeId;
  int? opening;
  List<Details>? details;

  ItemData({
    this.waterType,
    this.waterTypeId,
    this.opening,
    this.details,
  });

  factory ItemData.fromJson(Map<String, dynamic> json) => ItemData(
        waterType: json['water_type'],
        waterTypeId: json['waterTypeId'],
        opening: json['opening'],
        details:
            List<Details>.from(json["details"].map((x) => Details.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'water_type': waterType,
        'waterTypeId': waterTypeId,
        'opening': opening,
        'details': details?.map((x) => x.toJson()).toList() ?? [],
      };
}

class Details {
  int? id;
  String? date;
  String? description;
  double? procuredQty;
  double? consumedQty;
  String? transactionType;

  Details({
    this.id,
    this.date,
    this.description,
    this.procuredQty,
    this.consumedQty,
    this.transactionType,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json['id'],
        date: json['date'],
        description: json['description'],
        procuredQty: json['procured_qty'],
        consumedQty: json['consumed_qty'],
        transactionType: json['transactionType'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'description': description,
        'procured_qty': procuredQty,
        'consumed_qty': consumedQty,
        'transactionType': transactionType,
 
     };
}