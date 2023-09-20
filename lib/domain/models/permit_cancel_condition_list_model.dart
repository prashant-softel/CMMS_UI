// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

List<PermitCancelListModel> permitCancelListModelFromJson(String str) =>
    List<PermitCancelListModel>.from(json.decode(str).map((x) => PermitCancelListModel.fromJson(x)));

String permitCancelListModelToJson(List<PermitCancelListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PermitCancelListModel {
  PermitCancelListModel({
    this.id,
    this.name,
    this.isChecked = false
  });

  int? id;
  String? name;
  bool? isChecked;

  factory PermitCancelListModel.fromJson(Map<String, dynamic> json) => PermitCancelListModel(
        id: json['id'] == null ? 0 : json['id'],
        name: json["name"] == null ? '' : json["name"],
        
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
