import 'dart:convert';

List<RoleModel> roleListFromJson(String str) =>
    List<RoleModel>.from(json.decode(str).map(RoleModel.fromJson));

String roleListToJson(List<RoleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RoleModel {
  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        id: json['id'],
        name: json['name'],
        // input: json['input'],
      );
  RoleModel({
    this.id,
    this.name,
    // this.input,
  });

  int? id;
  String? name;
  // int? input;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        // 'input': input,
      };
}
