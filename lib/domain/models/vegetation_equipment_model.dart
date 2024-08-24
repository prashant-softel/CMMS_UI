import 'dart:convert';

List<VegetationEquipmentModel> getVegetationEquipmentModelFromJson(
        String str) =>
    List<VegetationEquipmentModel>.from(
        json.decode(str).map((x) => VegetationEquipmentModel.fromJson(x)));

String getVegetationEquipmentModelToJson(List<VegetationEquipmentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VegetationEquipmentModel {
  int? invId;
  String? invName;
  int? moduleQuantity;
  bool isExpanded;
  double? area;
  List<SMBS>? smbs;
  String? selectedDay;

  VegetationEquipmentModel({
    this.invId,
    this.invName,
    this.moduleQuantity,
    this.isExpanded = false,
    this.area,
    this.smbs,
    this.selectedDay,
  });

  factory VegetationEquipmentModel.fromJson(Map<String, dynamic> json) =>
      VegetationEquipmentModel(
        invId: json['invId'],
        invName: json['invName'],
        moduleQuantity: json['moduleQuantity'],
        area: json['area'],
        smbs: json['smbs'] != null
            ? List<SMBS>.from(
                json['smbs'].map(
                  (x) => SMBS.fromJson(x),
                ),
              )
            : [],
      );

  Map<String, dynamic> toJson() => {
        'invId': invId,
        'invName': invName,
        'moduleQuantity': moduleQuantity,
        'area': area,
        'smbs': smbs != null
            ? List<dynamic>.from(smbs!.map((x) => x.toJson()))
            : [],
      };
}

class SMBS {
  int? parentId;
  int? smbId;
  String? smbName;
  int? moduleQuantity;
  double? area;
  String? selectedDay;
  SMBS({
    this.parentId,
    this.smbId,
    this.smbName,
    this.moduleQuantity,
    this.area,
    this.selectedDay,
  });

  factory SMBS.fromJson(Map<String, dynamic> json) => SMBS(
        parentId: json['parentId'],
        smbId: json['smbId'],
        smbName: json['smbName'],
        moduleQuantity: json['moduleQuantity'],
        area: json['area'],
      );

  Map<String, dynamic> toJson() => {
        'parentId': parentId,
        'smbId': smbId,
        'smbName': smbName,
        'moduleQuantity': moduleQuantity,
        'area': area,
      };
}
