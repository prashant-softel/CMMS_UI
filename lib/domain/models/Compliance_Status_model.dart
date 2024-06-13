import 'dart:convert';

List<ComplianceStatusModel> ComplianceStatusModelFromJson(String str) =>
  List<ComplianceStatusModel>.from(
    json.decode(str).map((x) => ComplianceStatusModel.fromJson(x))
  );

String ComplianceStatusModelToJson(List<ComplianceStatusModel> data) =>
  json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ComplianceStatusModel {
  ComplianceStatusModel({
    this.id,
    this.name,
    this.description,
  });

  int? id;
  String? name;
  String? description;

  factory ComplianceStatusModel.fromJson(Map<String, dynamic> json) => ComplianceStatusModel(
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
