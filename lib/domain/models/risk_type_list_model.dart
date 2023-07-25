// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<RiskTypeModel> riskTypeModelFromJson(String str) =>
    List<RiskTypeModel>.from(
        json.decode(str).map((x) => RiskTypeModel.fromJson(x)));

String riskTypeModelToJson(List<RiskTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RiskTypeModel {
  RiskTypeModel({
    this.id,
    this.name,
    this.description,
   
    
   

  });

  int? id;
  String? name;
  String? description;
 
  

  factory RiskTypeModel.fromJson(Map<String, dynamic> json) => RiskTypeModel(
        id: json["id"],
        name: json["name"],
        description: json['description'],
       
        
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
       
      };
}
