import 'dart:convert';

List<WarrantyUsageTermListModel> warrantyUsageTermListModelFromJson(
        String str) =>
    List<WarrantyUsageTermListModel>.from(
        json.decode(str).map((x) => WarrantyUsageTermListModel.fromJson(x)));

String warrantyUsageTermListModelToJson(
        List<WarrantyUsageTermListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WarrantyUsageTermListModel {
  WarrantyUsageTermListModel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory WarrantyUsageTermListModel.fromJson(Map<String, dynamic> json) =>
      WarrantyUsageTermListModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
