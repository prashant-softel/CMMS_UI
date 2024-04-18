import 'dart:convert';

class GrievanceTypeModel {
  int? id;
  String? name;
  String? description;
  int? status;

  GrievanceTypeModel({this.id, this.name, this.description, this.status});

  factory GrievanceTypeModel.fromJson(Map<String, dynamic> json) =>
      GrievanceTypeModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'status': status,
      };
}

List<GrievanceTypeModel> grievanceTypeFromJson(String str) =>
    List<GrievanceTypeModel>.from(
        json.decode(str).map(GrievanceTypeModel.fromJson));

String grievanceTypeToJson(List<GrievanceTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
