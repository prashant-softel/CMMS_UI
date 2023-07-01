import 'dart:convert';

List<CompetencyModel> preventiveCheckListModelFromJson(String str) =>
    List<CompetencyModel>.from(
        json.decode(str).map((x) => CompetencyModel.fromJson(x)));

String preventiveCheckListModelToJson(List<CompetencyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompetencyModel {
  int? id;
  String? name;
  String? description;


  CompetencyModel({
    this.id,
    this.name,
    this.description
  });

  factory CompetencyModel.fromJson(Map<String, dynamic> json) =>
      CompetencyModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
