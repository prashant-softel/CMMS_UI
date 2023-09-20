class CreatePmPlanModel {
  String? plan_name;
  String? plan_date;
  int? facility_id;
  int? category_id;
  int? plan_freq_id;
  List<AssetChecklist>? mapAssetChecklist;
  CreatePmPlanModel(
      {this.category_id,
      this.facility_id,
      this.mapAssetChecklist,
      this.plan_date,
      this.plan_freq_id,
      this.plan_name});

  factory CreatePmPlanModel.fromJson(Map<String, dynamic> json) =>
      CreatePmPlanModel(
        plan_freq_id: json["plan_freq_id"],
        category_id: json["category_id"],
        facility_id: json["facility_id"],
        plan_date: json["plan_date"],
        plan_name: json["plan_name"],
        mapAssetChecklist: List<AssetChecklist>.from(
            json["mapAssetChecklist"].map((x) => AssetChecklist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "plan_name": plan_name,
        "plan_date": plan_date,
        "facility_id": facility_id,
        "category_id": category_id,
        "plan_freq_id": plan_freq_id,
        "mapAssetChecklist":
            List<dynamic>.from(mapAssetChecklist!.map((x) => x.toJson())),
      };
}

class AssetChecklist {
  AssetChecklist({this.asset_id, this.checklist_id});

  int? asset_id;
  int? checklist_id;

  factory AssetChecklist.fromJson(Map<String, dynamic> json) => AssetChecklist(
        asset_id: json["asset_id"],
        checklist_id: json["asset_item_ID"],
      );

  Map<String, dynamic> toJson() => {
        "checklist_id": checklist_id,
        "asset_id": asset_id,
      };
}
