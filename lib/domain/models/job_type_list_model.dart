// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<JobTypeListModel> jobTypeListModelFromJson(String str) =>
    List<JobTypeListModel>.from(
        json.decode(str).map((x) => JobTypeListModel.fromJson(x)));

String jobTypeListModelToJson(List<JobTypeListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobTypeListModel {
  JobTypeListModel({this.id, this.name, this.facilityId, this.description});

  int? id;
  String? name;
  String? description;
  int? facilityId;

  factory JobTypeListModel.fromJson(Map<String, dynamic> json) =>
      JobTypeListModel(
          id: json["id"],
          name: json["title"],
          facilityId: json["facilityId"],
          description: json["description"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": name,
        "facilityId": facilityId,
        "description": description
      };
}
