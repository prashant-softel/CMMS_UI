class SaveRoleNotificationModel {
  SaveRoleNotificationModel({
    required this.role_id,
    required this.set_existing_users,
    required this.set_role,
    required this.notification_list,
  });

  int role_id;
  bool set_existing_users;
  bool set_role;

  List<SaveRoleNotificationList> notification_list;

  factory SaveRoleNotificationModel.fromJson(Map<String, dynamic> json) =>
      SaveRoleNotificationModel(
        role_id: json["role_id"],
        set_existing_users: json["set_existing_users"],
        set_role: json["set_role"],
        notification_list: List<SaveRoleNotificationList>.from(
            json["notification_list"]
                .map((x) => SaveRoleNotificationList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "role_id": role_id,
        "set_existing_users": set_existing_users,
        "set_role": set_role,
        "notification_list":
            List<dynamic>.from(notification_list.map((x) => x.toJson())),
      };
}

class SaveRoleNotificationList {
  SaveRoleNotificationList({
    required this.notification_id,
    required this.flag,
    required this.can_change,
  });
  int notification_id;
  int flag;
  int can_change;
  factory SaveRoleNotificationList.fromJson(Map<String, dynamic> json) =>
      SaveRoleNotificationList(
        notification_id: json["notification_id"],
        flag: json["flag"],
        can_change: json["can_change"],
      );

  Map<String, dynamic> toJson() => {
        "notification_id": notification_id,
        "flag": flag,
        "can_change": can_change,
      };
}
