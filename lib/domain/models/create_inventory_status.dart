import 'dart:convert';

List<CreateInventoryStatusListModel> inventoryStatusListModelFromJson(String str) =>
    List<CreateInventoryStatusListModel>.from(
        json.decode(str).map((x) => CreateInventoryStatusListModel.fromJson(x)));

String inventoryStatusListModelToJson(List<CreateInventoryStatusListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateInventoryStatusListModel {
  // int? id;
  String? name;
  String? description;

  CreateInventoryStatusListModel({this.name, this.description});

  factory CreateInventoryStatusListModel.fromJson(Map<String, dynamic> json) =>
      CreateInventoryStatusListModel(
        // id: json['id'],
        name: json['name'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "name": name,
        "description": description,
      };
}
