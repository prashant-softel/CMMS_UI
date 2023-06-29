// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<EmployeeListModel> employeeListModelFromJson(String str) =>
    List<EmployeeListModel>.from(
        json.decode(str).map((x) => EmployeeListModel.fromJson(x)));

String employeeListModelToJson(List<EmployeeListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeListModel {
  EmployeeListModel({
    this.id,
    this.login_id,
    this.name,
    this.gender,
    this.mobileNumber
    
   

  });

  int? id;
  String? login_id;
  String? name;
  String? gender;
  String? mobileNumber;
 
  

  factory EmployeeListModel.fromJson(Map<String, dynamic> json) => EmployeeListModel(
        id: json["id"],
        login_id: json['login_id'],
        name: json["name"],
        gender: json["gender"],
        mobileNumber: json['mobileNumber'],
       
        
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "login_id": login_id,
        "name": name,
        "gender": gender,
        "mobileNumber": mobileNumber
       
      };
}
