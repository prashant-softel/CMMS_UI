import 'dart:convert';

class ResolutionTypeModel {
  int? id;
  String? name;
  String? description;
  

  ResolutionTypeModel({this.id, this.name, this.description});

  factory ResolutionTypeModel.fromJson(Map<String, dynamic> json) =>
      ResolutionTypeModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        
      };
}

List<ResolutionTypeModel> resolutionTypeFromJson(String str) =>
    List<ResolutionTypeModel>.from(
        json.decode(str).map(ResolutionTypeModel.fromJson));

String resolutionTypeToJson(List<ResolutionTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
