import 'dart:convert';

List<DesignationModel> roleListFromJson(String str) =>
    List<DesignationModel>.from(json.decode(str).map(DesignationModel.fromJson));

String roleListToJson(List<DesignationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DesignationModel {
  factory DesignationModel.fromJson(Map<String, dynamic> json) => DesignationModel(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    // input: json['input'],
  );
  DesignationModel({
    this.id,
    this.name,
    this.description,
    // this.input,
  });

  int? id;
  String? name;
  String? description;
  // int? input;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    // 'input': input,
  };
}
