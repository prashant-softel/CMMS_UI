// To parse this JSON data, do
//
//     final toolTypeModel = toolTypeModelFromJson(jsonString);

import 'dart:convert';

List<ToolTypeModel> toolTypeModelFromJson(String str) =>
    List<ToolTypeModel>.from(
        json.decode(str).map((x) => ToolTypeModel.fromJson(x)));

String toolTypeModelToJson(List<ToolTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ToolTypeModel {
  ToolTypeModel({
    this.id,
    this.tool_name,
  });

  int? id;
  String? tool_name;

  factory ToolTypeModel.fromJson(Map<String, dynamic> json) => ToolTypeModel(
        id: json["id"],
        tool_name: json["tool_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryid": tool_name,
      };
}

// class UpdateWorkTypeModel {
//   UpdateWorkTypeModel({
//     this.id,
//     this.categoryid,
//     // this.categoryName,
//     this.workType,
//     // this.status,
//   });

//   int? id;
//   int? categoryid;
//   // String? categoryName;
//   String? workType;
//   // int? status;

//   factory UpdateWorkTypeModel.fromJson(Map<String, dynamic> json) =>
//       UpdateWorkTypeModel(
//         id: json["id"],
//         categoryid: json["categoryid"],
//         // categoryName: json["categoryName"],
//         workType: json["workType"],
//         // status: json["status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "categoryid": categoryid,
//         // "categoryName": categoryName,
//         "workType": workType,
//         // "status": status,
//       };
// }
