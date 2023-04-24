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
  JobTypeListModel({
    this.id,
    this.name,
    
   

  });

  int? id;
  String? name;
 
  

  factory JobTypeListModel.fromJson(Map<String, dynamic> json) => JobTypeListModel(
        id: json["id"],
        name: json["name"],
       
        
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
       
      };
}
