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
    this.description,
    this.sop_file_id,
    this.sop_file_name,
    this.sop_file_path,
    this.jsa_file_id,
    this.jsa_file_name,
    this.jsa_file_path,
    
   

  });

  int? id;
  String? name;
  String? jobTypeName;
  String? description;
  int? sop_file_id;
  String? sop_file_name;
  String? sop_file_path;
  int? jsa_file_id;
  String? jsa_file_name;
  String? jsa_file_path;
 
  

  factory SOPListModel.fromJson(Map<String, dynamic> json) => SOPListModel(
        id: json["id"],
        name: json["name"],
        jobTypeName: json['jobTypeName'],
        description: json['description'],
        sop_file_id: json['sop_file_id'],
        sop_file_name: json['sop_file_name'],
        sop_file_path: json['sop_file_path'],
        jsa_file_id: json['jsa_file_id'],
        jsa_file_name: json['jsa_file_name'],
        jsa_file_path: json['jsa_file_path'],
       
        
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "jobTypeName": jobTypeName,
        "description": description,
        "sop_file_id": sop_file_id,
        "sop_file_name": sop_file_name,
        "sop_file_path": sop_file_path,
        "jsa_file_id": jsa_file_id,
        "jsa_file_name": jsa_file_name,
        "jsa_file_path": jsa_file_path,
       
      };
}
