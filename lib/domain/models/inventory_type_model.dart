import 'dart:convert';

List<InventoryTypeModel> inventoryTypeModelFromJson(String str) =>
    List<InventoryTypeModel>.from(
        json.decode(str).map((x) => InventoryTypeModel.fromJson(x)));

String inventoryTypeModelToJson(List<InventoryTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InventoryTypeModel {
  InventoryTypeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
  });

  int? id;
  String? name;
  String? description;
  int? status;

  factory InventoryTypeModel.fromJson(Map<String, dynamic> json) =>
      InventoryTypeModel(
        id: json["id"] as int? ?? 0,
        name: json["name"] as String? ?? '',
        description: json["description"] as String? ?? '',
        status: json["status"] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "status": status,
      };
}
