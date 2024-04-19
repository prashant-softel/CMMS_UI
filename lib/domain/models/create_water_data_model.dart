import 'dart:convert';

CreateWaterData createWaterDataModelFromJson(String str) =>
    CreateWaterData.fromJson(json.decode(str));

class CreateWaterData {
  int? facilityId;
  String? date;
  int? waterTypeId;
  String? description;
  int? consumeType;
  double? debitQty;
  double? creditQty;

  CreateWaterData(
      {this.facilityId,
      this.date,
      this.waterTypeId,
      this.description,
      this.consumeType,
      this.debitQty,
      this.creditQty});

  factory CreateWaterData.fromJson(Map<String, dynamic> json) {
    return CreateWaterData(
      facilityId: json['facilityId'],
      date: json['date'],
      waterTypeId: json['waterTypeId'],
      description: json['description'],
      consumeType: json['consumeType'],
      debitQty: json['debitQty'],
      creditQty: json['creditQty'],
    );
  }
  Map<String, dynamic> toJson() => {
        "facilityId": facilityId,
        "date": date,
        "waterTypeId": waterTypeId,
        "description": description,
        "consumeType": consumeType,
        "debitQty": debitQty,
        "creditQty": creditQty
      };
}
