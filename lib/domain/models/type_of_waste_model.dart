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
    this.type,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.show_opening,
  });

  int? id;
  int? facilityID;
  String? name;
  int? type;
  String? description;
  int? show_opening;
  DateTime? createdAt;
  int? createdBy;
  DateTime? updatedAt;
  int? updatedBy;

  factory WasteSource.fromJson(Map<String, dynamic> json) => WasteSource(
        id: json['id'],
        show_opening: json['show_opening'],
        facilityID: json['facility_id'],
        name: json['name'],
        type: json['Type'],
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
        "show_opening": show_opening,
        "facility_id": facilityID,
        "name": name,
        "Type": type,
        "description": description,
        "createdAt": createdAt,
        "createdBy": createdBy,
        "updatedAt": updatedAt,
        "updatedBy": updatedBy,
      };
}

class CreateWasteSource {
  CreateWasteSource(
      {this.id,
      this.facilityID,
      this.name,
      this.description,
      this.type,
      this.show_opening});

  int? id;
  int? facilityID;
  String? name;
  String? description;
  int? type;
  int? show_opening;

  factory CreateWasteSource.fromJson(Map<String, dynamic> json) =>
      CreateWasteSource(
          id: json['id'],
          facilityID: json['facility_id'],
          name: json['name'],
          type: json['Type'],
          description: json['description'],
          show_opening: json['show_opening']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'facility_id': facilityID,
        'name': name,
        'Type': type,
        'description': description,
        'show_opening': show_opening
      };
}
