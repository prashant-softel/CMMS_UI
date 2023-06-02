import 'dart:convert';

List<WarrantyTypeModel> warrantyTypeModelFromJson(String str) =>
    List<WarrantyTypeModel>.from(
        json.decode(str).map((x) => WarrantyTypeModel.fromJson(x)));

String warrantyTypeModelToJson(List<WarrantyTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WarrantyTypeModel {
  WarrantyTypeModel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory WarrantyTypeModel.fromJson(Map<String, dynamic> json) =>
      WarrantyTypeModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
