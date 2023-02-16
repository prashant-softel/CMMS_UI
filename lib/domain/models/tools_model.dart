import 'dart:convert';

List<ToolsModel> facilityListFromJson(String str) =>
    List<ToolsModel>.from(json.decode(str).map(ToolsModel.fromJson));

String facilityListToJson(List<ToolsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ToolsModel {
  factory ToolsModel.fromJson(Map<String, dynamic> json) => ToolsModel(
        id: json['id'],
        name: json['name'],
        input: json['input'],
      );
  ToolsModel({
    this.id,
    this.name,
    this.input,
  });

  int? id;
  String? name;
  int? input;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'input': input,
      };
}
