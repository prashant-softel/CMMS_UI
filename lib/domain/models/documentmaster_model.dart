import 'dart:convert';

List<DocumentMasterModel>DocumentMasterModelFromJson(String str) =>
  List<DocumentMasterModel>.from(
    json.decode(str).map((x) => DocumentMasterModel.fromJson(x))
  );

String DocumentMasterModelToJson(List<DocumentMasterModel> data) =>
  json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DocumentMasterModel {
  DocumentMasterModel({
    this.id,
    this.name,
    this.description,
  });

  int? id;
  String? name;
  String? description;

  factory DocumentMasterModel.fromJson(Map<String, dynamic> json) => DocumentMasterModel(
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
