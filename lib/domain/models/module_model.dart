import 'dart:convert';

List<ModuleModel> ModuleModelFromJson(String str) =>
    List<ModuleModel>.from(
        json.decode(str).map((x) => ModuleModel.fromJson(x)));

String ModuleModelToJson(List<ModuleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModuleModel {
  int? id;
  String? name;
  String? moduleName;
  String? menuImage;
  int? add;
  int? edit;
  int? delete;
  int? view;
  int? approve;
  int? issue;
  int? selfView;

  ModuleModel({
    this.id,
    this.name,
    this.moduleName,
    this.menuImage,
    this.add,
    this.edit,
    this.delete,
    this.view,
    this.approve,
    this.issue,
    this.selfView,
  });

  factory ModuleModel.fromJson(Map<String, dynamic> json) =>
      ModuleModel(
        id: json['id'],
        name: json['featureName'],
        moduleName: json['moduleName'],
        menuImage: json['menuImage'],
        add: json['add'],
        edit: json['edit'],
        delete: json['delete'],
        view: json['view'],
        approve: json['approve'],
        issue: json['issue'],
        selfView: json['selfView'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "featureName": name,
        "moduleName": moduleName,
        "menuImage": menuImage,
        "add": add,
        "edit": edit,
        "delete": delete,
        "view": view,
        "approve": approve,
        "issue": issue,
        "selfView": selfView,
      };
}
