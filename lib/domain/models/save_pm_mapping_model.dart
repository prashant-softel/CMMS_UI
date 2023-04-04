class SavePmModel {
  SavePmModel({
    required this.facilityId,
    required this.checklist_map_list,
  });

  int facilityId;

  List<ChecklistMapList> checklist_map_list;

  factory SavePmModel.fromJson(Map<String, dynamic> json) => SavePmModel(
        facilityId: json["facility_id"],
        checklist_map_list: List<ChecklistMapList>.from(
            json["checklist_map_list"]
                .map((x) => ChecklistMapList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "facility_id": facilityId,
        "checklist_map_list":
            List<dynamic>.from(checklist_map_list.map((x) => x.toJson())),
      };
}

class ChecklistMapList {
  ChecklistMapList(
      {required this.status,
      required this.category_id,
      required this.checklist_ids});

  int status;
  int category_id;
  List<int?> checklist_ids;

  factory ChecklistMapList.fromJson(Map<String, dynamic> json) =>
      ChecklistMapList(
        status: json["status"],
        category_id: json["category_id"],
        checklist_ids: List<int>.from(json["checklist_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "category_id": category_id,
        "checklist_ids": List<dynamic>.from(checklist_ids.map((x) => x)),
      };
}
