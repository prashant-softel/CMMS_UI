import 'dart:convert';

List<CreateBusinessTypeModel> CreateModuleListModelFromJson(String str) =>
    List<CreateBusinessTypeModel>.from(
        json.decode(str).map((x) => CreateBusinessTypeModel.fromJson(x)));

String CreateModuleListModelToJson(List<CreateBusinessTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateBusinessTypeModel {
  
  String? name;
  String? description;
  int? status;

   CreateBusinessTypeModel({
    // this.id,
    this.name,
    this.description,
    // this.menuImage,
    this.status,
  });

  factory CreateBusinessTypeModel.fromJson(Map<String, dynamic> json) =>
      CreateBusinessTypeModel(
        // id: json['id'],
        name: json['name'],
        description: json['description'],
        // menuImage: json['menuImage'],
        // add: json['add'],
        // edit: json['edit'],
        // delete: json['delete'],
        // view: json['view'],
        // approve: json['approve'],
        // issue: json['issue'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "name": name,
        "description": description,

        "status": status,

      };
}
