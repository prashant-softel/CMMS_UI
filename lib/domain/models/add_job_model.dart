// To parse this JSON data, do
//
//     final addJobModel = addJobModelFromJson(jsonString);

import 'dart:convert';

AddJobModel addJobModelFromJson(String str) =>
    AddJobModel.fromJson(json.decode(str));

String addJobModelToJson(AddJobModel data) => json.encode(data.toJson());

class AddJobModel {
  AddJobModel({
    this.id,
    required this.facilityId,
    required this.blockId,
    required this.permitId,
    required this.assignedId,
    required this.title,
    required this.description,
    this.status,
    required this.breakdownTime,
    required this.assetsIds,
    required this.workTypeIds,
  });

  int? id;
  int facilityId;
  int blockId;
  int permitId;
  int assignedId;
  String title;
  String description;
  int? status;

  String? breakdownTime;
  List<int> assetsIds;
  List<int?> workTypeIds;

  factory AddJobModel.fromJson(Map<String, dynamic> json) => AddJobModel(
        id: json["id"],
        facilityId: json["facility_id"],
        blockId: json["block_id"],
        permitId: json["permit_id"],
        assignedId: json["assigned_id"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
        breakdownTime: (json['breakdown_time'] == null)
            ? null
            : json['breakdown_time'] as String,
        assetsIds: List<int>.from(json["AssetsIds"].map((x) => x)),
        workTypeIds: List<int>.from(json["WorkType_Ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "facility_id": facilityId,
        "block_id": blockId,
        "permit_id": permitId,
        "assigned_id": assignedId,
        "title": title,
        "description": description,
        "status": status,
        "breakdown_time": breakdownTime,
        "AssetsIds": List<dynamic>.from(assetsIds.map((x) => x)),
        "WorkType_Ids": List<dynamic>.from(workTypeIds.map((x) => x)),
      };
}

// class AssetsId {
//   AssetsId({
//     required this.assetId,
//     required this.categoryIds,
//   });

//   int assetId;
//   int categoryIds;

//   factory AssetsId.fromJson(Map<String, dynamic> json) => AssetsId(
//         assetId: json["asset_id"],
//         categoryIds: json["category_ids"],
//       );

//   Map<String, dynamic> toJson() => {
//         "asset_id": assetId,
//         "category_ids": categoryIds,
//       };
// }

// AssetsId addAssetsIdFromJson(String str) {
//   var assetsId = AssetsId.fromJson(json.decode(str));
//   return assetsId;
// }

// String addAssetsIdToJson(AssetsId data) => json.encode(data.toJson());
