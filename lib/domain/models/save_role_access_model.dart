class SaveRoleAccessLevelModel {
  SaveRoleAccessLevelModel({
    required this.role_id,
    required this.set_existing_users,
    required this.set_role,
    required this.access_list,
  });

  int role_id;
  bool set_existing_users;
  bool set_role;

  List<SaveRoleAccessList> access_list;

  factory SaveRoleAccessLevelModel.fromJson(Map<String, dynamic> json) =>
      SaveRoleAccessLevelModel(
        role_id: json["role_id"],
        set_existing_users: json["set_existing_users"],
        set_role: json["set_role"],
        access_list: List<SaveRoleAccessList>.from(
            json["access_list"].map((x) => SaveRoleAccessList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "role_id": role_id,
        "set_existing_users": set_existing_users,
        "set_role": set_role,
        "access_list": List<dynamic>.from(access_list.map((x) => x.toJson())),
      };
}

class SaveRoleAccessList {
  SaveRoleAccessList(
      {required this.feature_id,
      required this.feature_name,
      required this.add,
      required this.approve,
      required this.delete,
      required this.edit,
      required this.issue,
      required this.selfView,
      required this.view});
  int feature_id;
  String feature_name;
  int add;
  int edit;
  int delete;
  int view;
  int issue;
  int approve;
  int selfView;

  factory SaveRoleAccessList.fromJson(Map<String, dynamic> json) =>
      SaveRoleAccessList(
        feature_id: json["feature_id"],
        feature_name: json["feature_name"],
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
        "feature_name": feature_name,
        "add": add,
        "edit": edit,
        "delete": delete,
        "view": view,
        "issue": issue,
        "approve": approve,
        "selfView": selfView,
      };
}
