import 'dart:convert';

List<MaterialCategoryListModel> MaterialCategoryFromJson(String str) =>
    List<MaterialCategoryListModel>.from(
        json.decode(str).map((x) => MaterialCategoryListModel.fromJson(x)));

String materialCategoryToJson(List<MaterialCategoryListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MaterialCategoryListModel {
  MaterialCategoryListModel({
    this.id,
    this.name,
    // this.status,
  });
  int? id;
  String? name;
  // int? status;

  factory MaterialCategoryListModel.fromJson(Map<String, dynamic> json) =>
      MaterialCategoryListModel(
        id: json["id"],
        name: json["cat_name"],
        // status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cat_name": name,
        // "status": status,
      };
}

class CreateMaterialCategory {
  CreateMaterialCategory({
    this.name,
  });

  String? name;
  factory CreateMaterialCategory.fromJson(Map<String, dynamic> json) =>
      CreateMaterialCategory(
        name: json["cat_name"],
      );

  Map<String, dynamic> toJson() => {
        "cat_name": name,
      };
}
