// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<EmployeeListModel2> employeeListModel2FromJson(String str) =>
    List<EmployeeListModel2>.from(
        json.decode(str).map((x) => EmployeeListModel2.fromJson(x)));

String employeeListModel2ToJson(List<EmployeeListModel2> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeListModel2 {
  EmployeeListModel2({
    this.id,
    this.login_id,
    this.name,
    this.gender
    
   

  });

  int? id;
  String? login_id;
  String? name;
  String? gender;
 
  

  factory EmployeeListModel2.fromJson(Map<String, dynamic> json) => EmployeeListModel2(
        id: json["id"],
        login_id: json['login_id'],
        name: json["name"],
        gender: json["gender"]
       
        
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "login_id": login_id,
        "name": name,
        "gender": gender,
       
      };
}
