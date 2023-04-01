// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

List<HistoryModel> historyModelFromJson(String str) => List<HistoryModel>.from(
    json.decode(str).map((x) => HistoryModel.fromJson(x)));

String historyModelToJson(List<HistoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HistoryModel {
  HistoryModel({
    this.id,
    this.moduleType,
    this.moduleRefId,
    this.secondaryModuleType,
    this.secondaryModuleRefId,
    this.comment,
    this.createdById,
    this.createdByName,
    this.createdAt,
    this.status,
    this.latitude,
    this.longitude,
  });

  int? id;
  int? moduleType;
  int? moduleRefId;
  int? secondaryModuleType;
  int? secondaryModuleRefId;
  String? comment;
  int? createdById;
  CreatedByName? createdByName;
  DateTime? createdAt;
  int? status;
  dynamic latitude;
  dynamic longitude;

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        id: json["id"],
        moduleType: json["module_type"],
        moduleRefId: json["module_ref_id"],
        secondaryModuleType: json["secondary_module_type"],
        secondaryModuleRefId: json["secondary_module_ref_id"],
        comment: json["comment"],
        createdById: json["created_by_id"],
        createdByName: createdByNameValues.map[json["created_by_name"]]!,
        createdAt: DateTime.parse(json["created_at"]),
        status: json["status"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "module_type": moduleType,
        "module_ref_id": moduleRefId,
        "secondary_module_type": secondaryModuleType,
        "secondary_module_ref_id": secondaryModuleRefId,
        "comment": comment,
        "created_by_id": createdById,
        "created_by_name": createdByNameValues.reverse[createdByName],
        "created_at": createdAt?.toIso8601String(),
        "status": status,
        "latitude": latitude,
        "longitude": longitude,
      };
}

enum CreatedByName { SATENDRA_KUMAR }

final createdByNameValues =
    EnumValues({"Satendra Kumar": CreatedByName.SATENDRA_KUMAR});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
