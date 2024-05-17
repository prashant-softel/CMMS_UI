import 'dart:convert';

List<WaterSource> waterSourceListModelFromJson(String str) =>
    List<WaterSource>.from(
        json.decode(str).map((x) => WaterSource.fromJson(x)));

String waterListModelToJson(List<WaterSource> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WaterSource {
  WaterSource({
    this.id,
    this.facility_id,
    this.name,
    this.description,
    this.status,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.show_opening,
  });

  int? id;
  int? facility_id;
  String? name;
  String? description;
  int? status;
  DateTime? createdAt;
  int? createdBy;
  DateTime? updatedAt;
  int? updatedBy;
  int? show_opening;

  factory WaterSource.fromJson(Map<String, dynamic> json) => WaterSource(
        id: json['id'],
        facility_id: json['facility_id'],
        name: json['name'],
        description: json['description'],
        status: json['status'],
        createdAt: DateTime.parse(json['createdAt']),
        createdBy: json['createdBy'],
        show_opening: json['show_opening'],
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null,
        updatedBy: json['updatedBy'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "facility_id": facility_id,
        "name": name,
        "description": description,
        "show_opening": show_opening
        // "status": status,
        // "createdAt": createdAt,
        // "createdBy": createdBy,
        // "updatedAt": updatedAt,
        // "updatedBy": updatedBy,
      };
}
