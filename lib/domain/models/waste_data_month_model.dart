import 'dart:convert';

List<WasteDataMonthModel> wasteDataMonthDetailModelFromJson(String str) =>
    List<WasteDataMonthModel>.from(
      json.decode(str).map(
            (x) => WasteDataMonthModel.fromJson(x),
          ),
    );

String wasteDataMonthDetailModelToJson(WasteDataMonthModel data) => json.encode(
      data.toJson(),
    );

class WasteDataMonthModel {
  int? facility_id;
  String? facility_name;
  String? month;
  int? year;
  String? waste_type;
  int? waste_type_id;
  List<ItemDataModel?>? item_data;

  WasteDataMonthModel({
    this.facility_id,
    this.facility_name,
    this.month,
    this.year,
    this.waste_type,
    this.waste_type_id,
    this.item_data,
  });

  factory WasteDataMonthModel.fromJson(Map<String, dynamic> json) =>
      WasteDataMonthModel(
        facility_id: json["facility_id"],
        facility_name: json["facility_name"],
        month: json["month"],
        year: json["year"],
        waste_type: json["waste_type"],
        waste_type_id: json["waste_type_id"],
        item_data: List<ItemDataModel>.from(
          json["item_data"].map(
            (x) => ItemDataModel.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "facility_id": facility_id,
        "facility_name": facility_name,
        "month": month,
        "year": year,
        "waste_type": waste_type,
        "waste_type_id": waste_type_id,
        'item_data': item_data?.map((x) => x?.toJson()).toList() ?? [],
      };
}

class ItemDataModel {
  String? waste_type;
  int? wasteTypeId;
  double? opening;
  List<DetailsModel>? details;

  ItemDataModel({
    this.waste_type,
    this.wasteTypeId,
    this.opening,
    this.details,
  });

  factory ItemDataModel.fromJson(Map<String, dynamic> json) => ItemDataModel(
        waste_type: json['waste_type'],
        wasteTypeId: json['wasteTypeId'],
        opening: json['opening'],
        details: List<DetailsModel>.from(
          json["details"].map(
            (x) => DetailsModel.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        'waste_type': waste_type,
        'wasteTypeId': wasteTypeId,
        'opening': opening,
        'details': details?.map((x) => x.toJson()).toList() ?? [],
      };
}

class DetailsModel {
  int? id;
  String? date;
  String? waste_type;
  int? opening;
  double? procuredQty;
  double? consumedQty;
  int? closing_qty;
  String? description;
  String? transactionType;
  int? show_opening;

  DetailsModel({
    this.id,
    this.date,
    this.waste_type,
    this.description,
    this.procuredQty,
    this.consumedQty,
    this.transactionType,
    this.closing_qty,
    this.show_opening,
    this.opening,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
        id: json['id'],
        date: json['date'],
        waste_type: json['waste_type'],
        description: json['description'],
        procuredQty: json['procured_qty'],
        consumedQty: json['consumed_qty'],
        transactionType: json['transactionType'],
        closing_qty: json['closing_qty'],
        show_opening: json['show_opening'],
        opening: json['opening'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'waste_type': waste_type,
        'description': description,
        'procured_qty': procuredQty,
        'consumed_qty': consumedQty,
        'transactionType': transactionType,
        'closing_qty': closing_qty,
        'show_opening': show_opening,
        'opening': opening,
      };
}
