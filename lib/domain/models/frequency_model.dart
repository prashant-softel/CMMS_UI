// To parse this JSON data, do
//
//     final inventoryCategoryModel = inventoryCategoryModelFromJson(jsonString);

import 'dart:convert';

List<FrequencyModel> frequencyModelFromJson(String str) =>
    List<FrequencyModel>.from(
        json.decode(str).map((x) => FrequencyModel.fromJson(x)));

String frequencyModelToJson(List<FrequencyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FrequencyModel {
  FrequencyModel({this.id, this.name, this.days, this.status});

  int? id;
  String? name;
  int? days;
  int? status;

  factory FrequencyModel.fromJson(Map<String, dynamic> json) => FrequencyModel(
        id: json["id"],
        name: json["name"],
        days: json["days"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "status": status, "days": days};
}
