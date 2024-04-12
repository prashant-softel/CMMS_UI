import 'dart:convert';

class GrievanceType {
  int? id;
  String? name;
  String? description;
  int? status;

  GrievanceType({this.id, this.name, this.description, this.status});

  factory GrievanceType.fromJson(Map<String, dynamic> json) => GrievanceType(
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

List<GrievanceType> grievanceTypeFromJson(String str) =>
    List<GrievanceType>.from(json.decode(str).map(GrievanceType.fromJson));

String grievanceTypeToJson(List<GrievanceType> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

