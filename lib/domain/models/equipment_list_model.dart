// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';


List<EquipmentListModel> equipmentListModelFromJson(String str) =>
    List<EquipmentListModel>.from(
        json.decode(str).map((x) => EquipmentListModel.fromJson(x)));

String equipmentListModelToJson(List<EquipmentListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EquipmentListModel {
  int? invId;
  String? invName;
  int? moduleQuantity;
  List<SMBS?>? smbs;


   EquipmentListModel({
    this.invId,
    this.invName,
    this.moduleQuantity,
    this.smbs,
   
  });

 

  factory EquipmentListModel.fromJson(Map<String, dynamic> json) =>
      EquipmentListModel(
        invId: json["invId"],
        invName: json["invName"],
        moduleQuantity: json["moduleQuantity"],
        smbs: json["smbs"]!=null? List<SMBS>.from(
            json["smbs"].map((x) => SMBS.fromJson(x))):[],
       
      );

  Map<String, dynamic> toJson() => {
        "invId": invId,
        "invName": invName,
        "moduleQuantity": moduleQuantity,
        "smbs": List<dynamic>.from(smbs!.map((x) => x)),

        
      };
}

class SMBS {
  SMBS({
    this.parentId,
    this.smbId,
    this.smbName,
    this.moduleQuantity,
   
  });

  int? parentId;
  int? smbId;
  String? smbName;
  int? moduleQuantity;
 



  factory SMBS.fromJson(Map<String, dynamic> json) => SMBS(
        parentId: json["parentId"],
        smbId: json['smbId'],
        smbName: json['smbName'],
        moduleQuantity: json['moduleQuantity'],
        

      );

  Map<String, dynamic> toJson() => {
        "parentId": parentId,
        "smbId": smbId,
        "smbName": smbName,
        "moduleQuantity": moduleQuantity
       

      };
}



String smbModelToJson(SMBS data) => json.encode(data.toJson());

