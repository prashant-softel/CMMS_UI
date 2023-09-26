import 'dart:convert';

import 'package:cmms/domain/models/create_pm_plan_model.dart';

PMPlanDetail pmPlanDetailFromJson(String str) =>
    PMPlanDetail.fromJson(json.decode(str));

class PMPlanDetail {
  int? isDraft;
  int? plan_id;
  String? plan_name;
  int? status_id;
  String? status_short;
  String? status_long;
  String? plan_date;
  int? facility_id;
  String? facility_name;
  int? category_id;
  String? category_name;
  int? assign_to_id;
  String? assign_to_name;
  int? plan_freq_id;
  String? plan_freq_name;
  int? created_by_id;
  String? created_by_name;
  String? created_at;
  int? approved_by_id;
  String? approved_by_name;
  String? approved_at;
  int? rejected_by_id;
  String? rejected_by_name;
  String? rejected_at;
  int? updated_by_id;
  String? updated_by_name;
  String? updated_at;
  List<AssetChecklist>? mapAssetChecklist;

  PMPlanDetail(
      {this.approved_at,
      this.approved_by_id,
      this.approved_by_name,
      this.assign_to_id,
      this.assign_to_name,
      this.category_id,
      this.category_name,
      this.created_at,
      this.created_by_id,
      this.created_by_name,
      this.facility_id,
      this.facility_name,
      this.isDraft,
      this.mapAssetChecklist,
      this.plan_date,
      this.plan_freq_id,
      this.plan_freq_name,
      this.plan_id,
      this.plan_name,
      this.rejected_at,
      this.rejected_by_id,
      this.rejected_by_name,
      this.status_id,
      this.status_long,
      this.status_short,
      this.updated_at,
      this.updated_by_id,
      this.updated_by_name});

  factory PMPlanDetail.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['mapAssetChecklist'] as List;
    print(list.runtimeType);
    List<AssetChecklist> mapAssetChecklist =
        list.map((i) => AssetChecklist.fromJson(i)).toList();

    return PMPlanDetail(
      approved_at: parsedJson['approved_at'],
      approved_by_id: parsedJson['approved_by_id'],
      approved_by_name: parsedJson['approved_by_name'],
      assign_to_id: parsedJson['assign_to_id'],
      assign_to_name: parsedJson['assign_to_name'],
      category_id: parsedJson['category_id'],
      category_name: parsedJson['category_name'],
      created_at: parsedJson['created_at'],
      created_by_id: parsedJson['created_by_id'],
      created_by_name: parsedJson['created_by_name'],
      status_short: parsedJson['status_short'],
      facility_id: parsedJson['facility_id'],
      mapAssetChecklist: mapAssetChecklist,
      facility_name: parsedJson['facility_name'],
      isDraft: parsedJson['isDraft'],
      plan_date: parsedJson['plan_date'],
      status_long: parsedJson['status_long'],
      plan_freq_id: parsedJson['plan_freq_id'],
      plan_freq_name: parsedJson['plan_freq_name'],
      plan_id: parsedJson['plan_id'],
      plan_name: parsedJson['plan_name'],
      rejected_at: parsedJson['rejected_at'],
      rejected_by_id: parsedJson['rejected_by_id'],
      rejected_by_name: parsedJson['rejected_by_name'],
      status_id: parsedJson['status_id'],
      updated_at: parsedJson['updated_at'],
      updated_by_id: parsedJson['updated_by_id'],
      updated_by_name: parsedJson['updated_by_name'],
    );
  }
  Map<String, dynamic> toJson() => {
        "updated_by_name": updated_by_name,
        "updated_by_id": updated_by_id,
        "updated_at": updated_at,
        "status_short": status_short,
        "status_long": status_long,
        "status_id": status_id,
        "rejected_by_name": rejected_by_name,
        "rejected_by_id": rejected_by_id,
        "rejected_at": rejected_at,
        "plan_name": plan_name,
        "plan_id": plan_id,
        "plan_freq_name": plan_freq_name,
        "plan_freq_id": plan_freq_id,
        "plan_date": plan_date,
        "facility_name": facility_name,
        "isDraft": isDraft,
        "facility_id": facility_id,
        "created_by_name": created_by_name,
        "created_by_id": created_by_id,
        "created_at": created_at,
        "category_name": category_name,
        "category_id": category_id,
        "assign_to_name": assign_to_name,
        "assign_to_id": assign_to_id,
        "approved_by_name": approved_by_name,
        "approved_by_id": approved_by_id,
        "approved_at": approved_at,
        "mapAssetChecklist":
            List<dynamic>.from(mapAssetChecklist!.map((x) => x.toJson())),
      };
}

// class MapAssetChecklist {
//   int? asset_id;
//   String? asset_name;
//   int? parent_id;
//   String? parent_name;
//   int? module_qty;
//   int? checklist_id;
//   String? checklist_name;
//   MapAssetChecklist(
//       {this.asset_id,
//       this.asset_name,
//       this.checklist_id,
//       this.checklist_name,
//       this.module_qty,
//       this.parent_id,
//       this.parent_name});

//   factory MapAssetChecklist.fromJson(Map<String, dynamic> parsedJson) {
//     return MapAssetChecklist(
//       asset_id: parsedJson['asset_id'],
//       asset_name: parsedJson['asset_name'],
//       checklist_id: parsedJson['checklist_id'],
//       checklist_name: parsedJson['checklist_name'],
//       module_qty: parsedJson['module_qty'],
//       parent_id: parsedJson['parent_id'],
//       parent_name: parsedJson['parent_name'],
//     );
//   }
//   Map<String, dynamic> toJson() => {
//         "asset_id": asset_id,
//         "parent_name": parent_name,
//         "module_qty": module_qty,
//         "checklist_id": checklist_id,
//         "checklist_name": checklist_name,
//         "asset_name": asset_name,
//         "parent_id": parent_id,
//       };
// }
