import 'dart:convert';

List<InventoryStatusListModel> inventoryStatusListModelFromJson(String str) =>
    List<InventoryStatusListModel>.from(
        json.decode(str).map((x) => InventoryStatusListModel.fromJson(x)));

String inventoryStatusListModelToJson(List<InventoryStatusListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InventoryStatusListModel {
  int? id;
  String? name;
  String? description;

  InventoryStatusListModel({this.id, this.name, this.description});

  factory InventoryStatusListModel.fromJson(Map<String, dynamic> json) =>
      InventoryStatusListModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
