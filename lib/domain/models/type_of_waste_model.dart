import 'dart:convert';

List<WasteSource> wasteSourceListModelFromJson(String str) =>
    List<WasteSource>.from(
        json.decode(str).map((x) => WasteSource.fromJson(x)));

String wasteListModelToJson(List<WasteSource> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WasteSource {
  WasteSource({
    this.id,
    this.facilityID,
    this.name,
    this.description,
    this.wastetype,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
  });

  int? id;
  int? facilityID;
  String? name;
  int? wastetype;
  String? description;

  DateTime? createdAt;
  int? createdBy;
  DateTime? updatedAt;
  int? updatedBy;

  factory WasteSource.fromJson(Map<String, dynamic> json) => WasteSource(
        id: json['id'],
        facilityID: json['facilityID'],
        name: json['name'],
        wastetype: json['wastetype'],
        description: json['description'],
        createdAt: DateTime.parse(json['createdAt']),
        createdBy: json['createdBy'],
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null,
        updatedBy: json['updatedBy'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "facilityID": facilityID,
        "name": name,
        "wastetype": wastetype,
        "description": description,
        "createdAt": createdAt,
        "createdBy": createdBy,
        "updatedAt": updatedAt,
        "updatedBy": updatedBy,
      };
}
