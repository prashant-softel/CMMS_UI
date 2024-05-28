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
  String? date;
  String? transactionType;
  String? description;
  int? opening;
  int? procured_qty;
  int? consumed_qty;
  int? closing_qty;
  String? wasteType;
  int? wasteTypeId;
  int? id;
  int? consumeTypeId;
  int? month;
  int? year;

  WasteDataMonthModel({
    this.facility_id,
    this.facility_name,
    this.date,
    this.transactionType,
    this.description,
    this.opening,
    this.procured_qty,
    this.consumed_qty,
    this.closing_qty,
    this.wasteType,
    this.wasteTypeId,
    this.id,
    this.consumeTypeId,
    this.month,
    this.year,
  });

  factory WasteDataMonthModel.fromJson(Map<String, dynamic> json) =>
      WasteDataMonthModel(
        facility_id: json["facility_id"],
        facility_name: json["facility_name"],
        date: json["date"],
        transactionType: json["transactionType"],
        description: json["description"],
        opening: json["opening"],
        procured_qty: json["procured_qty"],
        consumed_qty: json["consumed_qty"],
        closing_qty: json["closing_qty"],
        wasteType: json["waste_type"],
        wasteTypeId: json["wasteTypeId"],
        id: json["id"],
        consumeTypeId: json["consumeTypeId"],
        month: json["months"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "facility_id": facility_id,
        "facility_name": facility_name,
        "date": date,
        "transactionType": transactionType,
        "description": description,
        "opening": opening,
        "procured_qty": procured_qty,
        "consumed_qty": consumed_qty,
        "closing_qty": closing_qty,
        "waste_type": wasteType,
        "wasteTypeId": wasteTypeId,
        "id": id,
        "consumeTypeId": consumeTypeId,
        "month": month,
        "year": year,
      };
}
