class SaveAccessLevelModel {
  SaveAccessLevelModel({
    required this.user_id,
    required this.access_list,
  });

  int user_id;

  List<SaveAccessList> access_list;

  factory SaveAccessLevelModel.fromJson(Map<String, dynamic> json) =>
      SaveAccessLevelModel(
        user_id: json["user_id"],
        access_list: List<SaveAccessList>.from(
            json["access_list"].map((x) => SaveAccessList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_id": user_id,
        "access_list": List<dynamic>.from(access_list.map((x) => x.toJson())),
      };
}

class SaveAccessList {
  SaveAccessList(
      {required this.feature_id,
      required this.add,
      required this.approve,
      required this.delete,
      required this.edit,
      required this.issue,
      required this.selfView,
      required this.view});
  int feature_id;
  int add;
  int edit;
  int delete;
  int view;
  int issue;
  int approve;
  int selfView;

  factory SaveAccessList.fromJson(Map<String, dynamic> json) => SaveAccessList(
        feature_id: json["feature_id"],
        add: json["add"],
        edit: json["edit"],
        delete: json["delete"],
        view: json["view"],
        issue: json["issue"],
        approve: json["approve"],
        selfView: json["selfView"],
      );

  Map<String, dynamic> toJson() => {
        "feature_id": feature_id,
        "add": add,
        "edit": edit,
        "delete": delete,
        "view": view,
        "issue": issue,
        "approve": approve,
        "selfView": selfView,
      };
}
