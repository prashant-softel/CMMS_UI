import 'dart:convert';

List<CourseCategoryModel> CourseCategoryModelFromJson(String str) => 
  List<CourseCategoryModel>.from(json.decode(str).map((x) => CourseCategoryModel.fromJson(x)));

String CourseCategoryModelToJson(List<CourseCategoryModel> data) => 
  json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseCategoryModel {
  CourseCategoryModel({
    this.id,
    this.name,
    this.description,
  });
    
  int? id;
  String? name;
  String? description;

  factory CourseCategoryModel.fromJson(Map<String, dynamic> json) => CourseCategoryModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
  };
}
