class CreatePmPlanModel {
  String? plan_name;
  String? plan_date;
  int? facility_id;
  int? category_id;
  int? plan_freq_id;
  int? assigned_to_id;
  List<AssetChecklist>? mapAssetChecklist;
  CreatePmPlanModel(
      {this.category_id,
      this.facility_id,
      this.mapAssetChecklist,
      this.plan_date,
      this.plan_freq_id,
      this.assigned_to_id,
      this.plan_name});

  factory CreatePmPlanModel.fromJson(Map<String, dynamic> json) =>
      CreatePmPlanModel(
        plan_freq_id: json["plan_freq_id"],
        category_id: json["category_id"],
        facility_id: json["facility_id"],
        plan_date: json["plan_date"],
        plan_name: json["plan_name"],
        assigned_to_id: json["assigned_to_id"],
        mapAssetChecklist: List<AssetChecklist>.from(
            json["mapAssetChecklist"].map((x) => AssetChecklist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "plan_name": plan_name,
        "plan_date": plan_date,
        "facility_id": facility_id,
        "category_id": category_id,
        "plan_freq_id": plan_freq_id,
        "assigned_to_id": assigned_to_id,
        "mapAssetChecklist":
            List<dynamic>.from(mapAssetChecklist!.map((x) => x.toJson())),
      };
}

class AssetChecklist {
  AssetChecklist(
      {this.asset_id,
      this.asset_name,
      this.checklist_id,
      this.checklist_name,
      this.module_qty,
      this.parent_id,
      this.parent_name});
  int? asset_id;
  String? asset_name;
  int? parent_id;
  String? parent_name;
  int? module_qty;
  int? checklist_id;
  String? checklist_name;
  // int? asset_id;
  // int? checklist_id;

  factory AssetChecklist.fromJson(Map<String, dynamic> parsedJson) =>
      AssetChecklist(
        asset_id: parsedJson['asset_id'],
        asset_name: parsedJson['asset_name'],
        checklist_id: parsedJson['checklist_id'],
        checklist_name: parsedJson['checklist_name'],
        module_qty: parsedJson['module_qty'],
        parent_id: parsedJson['parent_id'],
        parent_name: parsedJson['parent_name'],
      );

  Map<String, dynamic> toJson() => {
        "asset_id": asset_id,
        "parent_name": parent_name,
        "module_qty": module_qty,
        "checklist_id": checklist_id,
        "checklist_name": checklist_name,
        "asset_name": asset_name,
        "parent_id": parent_id,
      };
}
