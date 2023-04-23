// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<CurrencyListModel> currencyListModelFromJson(String str) =>
    List<CurrencyListModel>.from(
        json.decode(str).map((x) => CurrencyListModel.fromJson(x)));

String currencyListModelToJson(List<CurrencyListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CurrencyListModel {
  CurrencyListModel({
    this.id,
    this.code,
    this.name,
    
   

  });

  int? id;
  String? code;
  String? name;
 
  

  factory CurrencyListModel.fromJson(Map<String, dynamic> json) => CurrencyListModel(
        id: json["id"],
        code: json['code'],
        name: json["name"],
       
        
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
       
      };
}
