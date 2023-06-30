import 'dart:convert';

List<CreateRoleModel> CreateRoleListModelFromJson(String str) =>
    List<CreateRoleModel>.from(
        json.decode(str).map((x) => CreateRoleModel.fromJson(x)));

String CreateRoleListModelToJson(List<CreateRoleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateRoleModel {

  String? name;

  CreateRoleModel({
    this.name,
  });

  factory CreateRoleModel.fromJson(Map<String, dynamic> json) =>
      CreateRoleModel(
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
