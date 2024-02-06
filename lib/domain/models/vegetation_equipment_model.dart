import 'dart:convert';

List<VegetationEquipmentModel> getVegetationEquipmentModelFromJson(String str) =>
    List<VegetationEquipmentModel>.from(
        json.decode(str).map((x) => VegetationEquipmentModel.fromJson(x)));

String getVegetationEquipmentModelToJson(List<VegetationEquipmentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VegetationEquipmentModel {
  int? blockId;
  String? blockName;
  int? area;
  List<Invs>? invs;

  VegetationEquipmentModel(
      {this.blockId, this.blockName, this.area, this.invs});

  factory VegetationEquipmentModel.fromJson(Map<String, dynamic> json) =>
      VegetationEquipmentModel(
        blockId: json['blockId'],
        blockName: json['blockName'],
        area: json['area'],
        invs: json['invs'] != null
            ? List<Invs>.from(json['invs'].map((x) => Invs.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
    "blockId" : blockId,
    "blockName" : blockName,
    "area" : area,
    "invs" : List<dynamic>.from(invs!.map((x) => x))
  };
}

class Invs {
  int? blockId;
  int? invId;
  String? invName;
  int? area;

  Invs({this.blockId, this.invId, this.invName, this.area});

  factory Invs.fromJson(Map<String, dynamic> json) => Invs(
      blockId: json['blockId'],
      invId: json['invId'],
      invName: json['invName'],
      area: json['area']);

  Map<String, dynamic> toJson() => {
        "blockId": blockId,
        "invId": invId,
        "invName": invName,
        "area": area,
      };
}

String smbModelToJson(Invs data) => json.encode(data.toJson());
