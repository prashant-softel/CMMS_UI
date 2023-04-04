
import 'dart:convert';

List<PmMappingListModel> pmMappingModelFromJson(String str) =>
    List<PmMappingListModel>.from(
        json.decode(str).map((x) => PmMappingListModel.fromJson(x)));

class PmMappingListModel {
  int? category_id;
  String? category_name;
  int? status;
  int? plan_id;
  List<CheckList>? checklists;

  PmMappingListModel(
      {this.category_id,
      this.category_name,
      this.status,
      this.checklists,
      this.plan_id});

  factory PmMappingListModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['checklists'] as List;
    print(list.runtimeType);
    List<CheckList> checkList = list.map((i) => CheckList.fromJson(i)).toList();

    return PmMappingListModel(
      category_id: parsedJson['category_id'],
      category_name: parsedJson['category_name'],
      checklists: checkList,
      status: parsedJson['status'],
      plan_id: parsedJson['plan_id'],
    );
  }
}

class CheckList {
  int? checklist_id;
  String? checklist_name;
  int? type;
  int? mapping_id;

  CheckList(
      {this.checklist_id, this.checklist_name, this.mapping_id, this.type});

  factory CheckList.fromJson(Map<String, dynamic> parsedJson) {
    return CheckList(
        checklist_id: parsedJson['checklist_id'],
        checklist_name: parsedJson['checklist_name'],
        type: parsedJson['type'],
        mapping_id: parsedJson['mapping_id']);
  }
}
