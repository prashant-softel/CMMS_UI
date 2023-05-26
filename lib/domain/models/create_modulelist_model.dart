import 'dart:convert';

List<CreateModuleListModel> CreateModuleListModelFromJson(String str) =>
    List<CreateModuleListModel>.from(
        json.decode(str).map((x) => CreateModuleListModel.fromJson(x)));

String CreateModuleListModelToJson(List<CreateModuleListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateModuleListModel {
  
  String? moduleName;
  String? featureName;
  String? menuImage;
  int? add;
  int? edit;
  int? delete;
  int? view;
  int? approve;
  int? issue;
  int? selfView;

  CreateModuleListModel({
    // this.id,
    this.moduleName,
    this.featureName,
    this.menuImage,
    this.add,
    this.edit,
    this.delete,
    this.view,
    this.approve,
    this.issue,
    this.selfView,
  });

  factory CreateModuleListModel.fromJson(Map<String, dynamic> json) =>
      CreateModuleListModel(
        // id: json['id'],
        moduleName: json['moduleName'],
        featureName: json['featureName'],
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
        // "id": id,
        "moduleName": moduleName,
        "featureName": featureName,
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
