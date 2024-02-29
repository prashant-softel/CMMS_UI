import 'dart:convert';

List<ToolsModel> facilityListFromJson(String str) =>
    List<ToolsModel>.from(json.decode(str).map(ToolsModel.fromJson));

String facilityListToJson(List<ToolsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ToolsModel {
  factory ToolsModel.fromJson(Map<String, dynamic> json) => ToolsModel(
        id: json["id"],
        Equipment_name: json["equipment_name"],
        workTypeName: json["workTypeName"],
        linkedToolName: json["linkedToolName"],
        WorkTypeId: json["WorkTypeId"],
        equipmentCategoryId: json["equipmentCategoryId"],
      );
  ToolsModel({
    required this.id,
    required this.Equipment_name,
    required this.workTypeName,
    required this.linkedToolName,
    required this.WorkTypeId,
    required this.equipmentCategoryId,
  });

  int id;
  String Equipment_name;
  String workTypeName;
  String linkedToolName;
  int WorkTypeId;
  int equipmentCategoryId;

  Map<String, dynamic> toJson() => {
        "id": id,
        "equipment_name": Equipment_name,
        "workTypeName": workTypeName,
        "linkedToolName": linkedToolName,
        "WorkTypeId": WorkTypeId,
        "equipmentCategoryId": equipmentCategoryId,
      };
}
