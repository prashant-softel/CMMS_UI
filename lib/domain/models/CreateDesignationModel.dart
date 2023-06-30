import 'dart:convert';

List<CreateDesignationModel> CreateModuleListModelFromJson(String str) =>
    List<CreateDesignationModel>.from(
        json.decode(str).map((x) => CreateDesignationModel.fromJson(x)));

String CreateModuleListModelToJson(List<CreateDesignationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateDesignationModel {

  String? name;
  String? description;


  CreateDesignationModel({
    // this.id,
    this.name,
    this.description,
  });

  factory CreateDesignationModel.fromJson(Map<String, dynamic> json) =>
      CreateDesignationModel(
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
