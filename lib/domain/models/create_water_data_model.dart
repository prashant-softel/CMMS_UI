import 'dart:convert';

CreateWaterData createWaterDataModelFromJson(String str) =>
    CreateWaterData.fromJson(json.decode(str));

class CreateWaterData {
  int? id;
  int? facilityId;
  String? date;
  int? waterTypeId;
  String? description;
  int? consumeType;
  double? debitQty;
  double? creditQty;

  CreateWaterData({
    this.id,
    this.facilityId,
    this.date,
    this.waterTypeId,
    this.description,
    this.consumeType,
    this.debitQty,
    this.creditQty,
  });

  factory CreateWaterData.fromJson(Map<String, dynamic> json) {
    return CreateWaterData(
      id: json['id'],
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
        "id": id,
        "facilityId": facilityId,
        "date": date,
        "waterTypeId": waterTypeId,
        "description": description,
        "consumeType": consumeType,
        "debitQty": debitQty,
        "creditQty": creditQty
      };
}
