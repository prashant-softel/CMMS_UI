import 'dart:convert';

List<TypePermitModel> facilityListFromJson(String str) =>
    List<TypePermitModel>.from(json.decode(str).map(TypePermitModel.fromJson));

String facilityListToJson(List<TypePermitModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TypePermitModel {
  factory TypePermitModel.fromJson(Map<String, dynamic> json) =>
      TypePermitModel(
          id: json['id'], name: json['name'], description: json['description']);
  TypePermitModel({this.id, this.name, this.description});

  int? id;
  String? name;
  String? description;

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': name, 'description': description};
}
