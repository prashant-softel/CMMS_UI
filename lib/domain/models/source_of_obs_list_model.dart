import 'dart:convert';

List<SourceOfObservationListModel> sourceofobservationFromJson(String str) =>
    List<SourceOfObservationListModel>.from(
        json.decode(str).map((x) => SourceOfObservationListModel.fromJson(x)));

String sourceofobservationToJson(List<SourceOfObservationListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SourceOfObservationListModel {
  SourceOfObservationListModel({
    this.id,
    this.name,
    this.description,
    // this.status,
  });

  int? id;
  String? name;
  String? description;
  // int? status;

  factory SourceOfObservationListModel.fromJson(Map<String, dynamic> json) =>
      SourceOfObservationListModel(
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
