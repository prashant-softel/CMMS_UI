// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<CreateSafetyMeasureModel> safetyMeasureListModelFromJson(String str) =>
    List<CreateSafetyMeasureModel>.from(
        json.decode(str).map((x) => CreateSafetyMeasureModel.fromJson(x)));

String safetyMeasureListModelToJson(List<CreateSafetyMeasureModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateSafetyMeasureModel {
  CreateSafetyMeasureModel({
    this.id,
    this.title,
    // this.description,
    this.permitType,
    this.input,
    this.required,
    this.isRequiredValue
    


  });

  int? id;
  String? title;
  // String? description;
  int? permitType;
  int? input;
  int? required;
  bool? isRequiredValue;
  
  


  factory CreateSafetyMeasureModel.fromJson(Map<String, dynamic> json) => CreateSafetyMeasureModel(
    id: json["id"],
    title: json["title"],
    // description: json["description"],
    permitType: json["permitType"],
    input: json['input'],
    required: json['required'],
    isRequiredValue: json['isRequiredValue'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    // "description": description,
    "permitType": permitType,
    "input": input,
    "required": required,
    "isRequiredValue": isRequiredValue

    
  };
}
