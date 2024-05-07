import 'dart:convert';

List<TypeOfObsListModel> typeofobservationFromJson(String str) =>
    List<TypeOfObsListModel>.from(
        json.decode(str).map((x) => TypeOfObsListModel.fromJson(x)));

String typeofobservationToJson(List<TypeOfObsListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TypeOfObsListModel {
  TypeOfObsListModel({
    this.id,
    this.name,
    this.description,
    // this.status,
  });

  int? id;
  String? name;
  String? description;
  // int? status;

  factory TypeOfObsListModel.fromJson(Map<String, dynamic> json) =>
      TypeOfObsListModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        // status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        // "status": status,
      };
}
