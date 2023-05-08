// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<SOPListModel> sopListModelFromJson(String str) =>
    List<SOPListModel>.from(
        json.decode(str).map((x) => SOPListModel.fromJson(x)));

String sopListModelToJson(List<SOPListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SOPListModel {
  SOPListModel({
    this.id,
    this.name,
    this.jobTypeName,
    
   

  });

  int? id;
  String? name;
  String? jobTypeName;
 
  

  factory SOPListModel.fromJson(Map<String, dynamic> json) => SOPListModel(
        id: json["id"],
        name: json["name"],
        jobTypeName: json['jobTypeName'],
       
        
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "jobTypeName": jobTypeName,
       
      };
}
