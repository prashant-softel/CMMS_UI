import 'dart:convert';

List<CreateCompetency> CreateModuleListModelFromJson(String str) =>
    List<CreateCompetency>.from(
        json.decode(str).map((x) => CreateCompetency.fromJson(x)));

String CreateModuleListModelToJson(List<CreateCompetency> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateCompetency {

  String? name;
  String? description;

  CreateCompetency({
    // this.id,
    this.name,
    this.description,
  });

  factory CreateCompetency.fromJson(Map<String, dynamic> json) =>
      CreateCompetency(
        // id: json['id'],
        name: json['name'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
    // "id": id,
    "name": name,
    "description": description
  };
}
