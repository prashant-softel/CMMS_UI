import 'dart:convert';

List<MaterialCategoryListModel> MaterialCategoryFromJson(String str) =>
    List<MaterialCategoryListModel>.from(
        json.decode(str).map((x) => MaterialCategoryListModel.fromJson(x)));

String materialCategoryToJson(MaterialCategoryListModel data) =>
    json.encode(data.toJson());

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
    
    // this.status,
  });
   
  String? name;
  // int? status;

  factory CreateMaterialCategory.fromJson(Map<String, dynamic> json) =>
      CreateMaterialCategory(
       
       
        name: json["cat_name"],
        // status: json["status"],
      );

  Map<String, dynamic> toJson() => {
  
        "cat_name": name,

        // "status": status,
      };
}
