import 'dart:convert';

List<StatutoryComplianceModel> statutoryComplianceModelFromJson(String str) =>
  List<StatutoryComplianceModel>.from(
    json.decode(str).map((x) => StatutoryComplianceModel.fromJson(x))
  );

String statutoryComplianceModelToJson(List<StatutoryComplianceModel> data) =>
  json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StatutoryComplianceModel {
  StatutoryComplianceModel({
    this.id,
    this.name,
    // this.description,
  });

  int? id;
  String? name;
  // String? description;

  factory StatutoryComplianceModel.fromJson(Map<String, dynamic> json) => StatutoryComplianceModel(
    id: json["id"],
    name: json["name"],
    // description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    // "description": description,
  };
}
