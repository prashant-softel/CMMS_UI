import 'dart:convert';

List<InventoryTypeListModel> inventoryTypeListModelFromJson(String str) =>
    List<InventoryTypeListModel>.from(
        json.decode(str).map((x) => InventoryTypeListModel.fromJson(x)));

String preventiveCheckListModelToJson(List<InventoryTypeListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InventoryTypeListModel {
  int? id;
  String? name;
  String? description;
  int? status;

  InventoryTypeListModel({this.id, this.name, this.description, this.status});

  factory InventoryTypeListModel.fromJson(Map<String, dynamic> json) =>
      InventoryTypeListModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "status": status,
      };
}
