// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';


List<SafetyMeasureListModel> safetyMeasureListModelFromJson(String str) =>
    List<SafetyMeasureListModel>.from(
        json.decode(str).map((x) => SafetyMeasureListModel.fromJson(x)));

String safetyMeasureListModelToJson(List<SafetyMeasureListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SafetyMeasureListModel {
  SafetyMeasureListModel(
      {this.id,
      this.name,
      this.inputID,
      this.inputName,
      this.permitType,
      this.isRequired,
      this.isChecked = false});

  int? id;
  String? name;
  int? inputID;
  String? inputName;
  String? permitType;
  int? isRequired;
  bool isChecked;

  factory SafetyMeasureListModel.fromJson(Map<String, dynamic> json) =>
      SafetyMeasureListModel(
        id: json["id"],
        name: json["name"],
        inputID: json['inputID'],
        inputName: json['inputName'],
        permitType: json['permitType'],
        isRequired: json['isRequired'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "inputID": inputID,
        "inputName": inputName,
        "permitType": permitType,
        "isRequired": isRequired
      };
}
