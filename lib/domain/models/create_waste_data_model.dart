import 'dart:convert';

CreateWasteData createWasteDataModelFromJson(String str) =>
    CreateWasteData.fromJson(json.decode(str));

class CreateWasteData {
  int? id;
  int? facilityId;
  String? date;
  int? wasteTypeId;
  String? description;
  int? consumeType;
  double? debitQty;
  double? creditQty;

  CreateWasteData({
    this.id,
    this.facilityId,
    this.date,
    this.wasteTypeId,
    this.description,
    this.consumeType,
    this.debitQty,
    this.creditQty,
  });

  factory CreateWasteData.fromJson(Map<String, dynamic> json) {
    return CreateWasteData(
      id: json['id'],
      facilityId: json['facilityId'],
      date: json['date'],
      wasteTypeId: json['wasteTypeId'],
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
        "wasteTypeId": wasteTypeId,
        "description": description,
        "consumeType": consumeType,
        "debitQty": debitQty,
        "creditQty": creditQty
      };
}
