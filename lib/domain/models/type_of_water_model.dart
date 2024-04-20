import 'dart:convert';

List<WaterSource> waterSourceListModelFromJson(String str) =>
    List<WaterSource>.from(
        json.decode(str).map((x) => WaterSource.fromJson(x)));

String waterListModelToJson(List<WaterSource> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WaterSource {
  WaterSource({
    this.id,
    this.facilityID,
    this.name,
    this.description,
    this.status,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
  });

  int? id;
  int? facilityID;
  String? name;
  String? description;
  int? status;
  DateTime? createdAt;
  int? createdBy;
  DateTime? updatedAt;
  int? updatedBy;

  factory WaterSource.fromJson(Map<String, dynamic> json) => WaterSource(
        id: json['id'],
        facilityID: json['facilityID'],
        name: json['name'],
        description: json['description'],
        status: json['status'],
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
        "description": description,
        "status": status,
        "createdAt": createdAt,
        "createdBy": createdBy,
        "updatedAt": updatedAt,
        "updatedBy": updatedBy,
      };
}
