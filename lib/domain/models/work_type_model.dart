// To parse this JSON data, do
//
//     final workTypeModel = workTypeModelFromJson(jsonString);

import 'dart:convert';

List<WorkTypeModel> workTypeModelFromJson(String str) =>
    List<WorkTypeModel>.from(
        json.decode(str).map((x) => WorkTypeModel.fromJson(x)));

String workTypeModelToJson(List<WorkTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkTypeModel {
  WorkTypeModel({
    this.id,
    this.categoryid,
    this.categoryName,
    this.workType,
    this.status,
  });

  int? id;
  int? categoryid;
  String? categoryName;
  String? workType;
  int? status;

  factory WorkTypeModel.fromJson(Map<String, dynamic> json) => WorkTypeModel(
        id: json["id"],
        categoryid: json["categoryid"],
        categoryName: json["categoryName"],
        workType: json["workType"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryid": categoryid,
        "categoryName": categoryName,
        "workType": workType,
        "status": status,
      };
}
