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
    this.status_name,
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
  String? createdByName;
  CreatedAt? createdAt;
  int? status;
  String? status_name;
  dynamic latitude;
  dynamic longitude;

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        id: json['id'] == null ? 0 : json['id'],
        createdAt: CreatedAt.fromJson(json['created_at']),
        moduleType: json["module_type"] == null ? 0 : json["module_type"],
        moduleRefId: json["module_ref_id"] == null ? 0 : json["module_ref_id"],
        secondaryModuleType: json["secondary_module_type"] == null
            ? 0
            : json["secondary_module_type"],
        secondaryModuleRefId: json["secondary_module_ref_id"] == null
            ? 0
            : json["secondary_module_ref_id"],
        comment: json["comment"] == null ? '' : json["comment"],
        createdById: json["created_by_id"] == null ? 0 : json["created_by_id"],
        createdByName:
            json["created_by_name"] == null ? '' : json["created_by_name"],
        status: json["status"] == null ? 0 : json["status"],
        status_name: json["status_name"] == null ? 0 : json["status_name"],
        latitude: json["latitude"] == null ? '' : json["latitude"],
        longitude: json["longitude"] == null ? '' : json["longitude"],
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
        "created_at":
            createdAt?.result.toString(), // Access and convert result to string
        "status": status,
        "status_name": status_name,
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

class CreatedAt {
  DateTime? result;
  int? id;
  dynamic exception;
  int? status;
  bool? isCanceled;
  bool? isCompleted;
  bool? isCompletedSuccessfully;
  int? creationOptions;
  dynamic asyncState;
  bool? isFaulted;

  CreatedAt(
      {this.result,
      this.id,
      this.asyncState,
      this.creationOptions,
      this.exception,
      this.isCanceled,
      this.isCompleted,
      this.isCompletedSuccessfully,
      this.isFaulted,
      this.status});

  factory CreatedAt.fromJson(Map<String, dynamic> json) {
    return CreatedAt(
      result: json['result'] == null
          ? DateTime.now()
          : DateTime.parse(json['result'] as String),
      id: json['id'],
      asyncState: json['asyncState'],
      creationOptions: json['creationOptions'],
      exception: json['exception'],
      isCanceled: json['isCanceled'],
      isCompleted: json['isCompleted'],
      isCompletedSuccessfully: json['isCompletedSuccessfully'],
      isFaulted: json['isFaulted'],
      status: json['status'],
    );
  }
}
