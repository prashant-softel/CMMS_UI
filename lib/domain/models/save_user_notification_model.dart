class SaveUserNotificationModel {
  SaveUserNotificationModel({
    required this.user_id,
    required this.access_list,
  });

  int user_id;

  List<NotificationList> access_list;

  factory SaveUserNotificationModel.fromJson(Map<String, dynamic> json) =>
      SaveUserNotificationModel(
        user_id: json["user_id"],
        access_list: List<NotificationList>.from(
            json["notification_list"].map((x) => NotificationList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_id": user_id,
        "notification_list":
            List<dynamic>.from(access_list.map((x) => x.toJson())),
      };
}

class NotificationList {
  NotificationList(
      {required this.notification_id,
      required this.can_change,
      required this.user_flag,
      required this.default_flag});
  int notification_id;
  int user_flag;
  int can_change;
  int default_flag;

  factory NotificationList.fromJson(Map<String, dynamic> json) =>
      NotificationList(
        default_flag: json["default_flag"],
        user_flag: json["user_flag"],
        can_change: json["can_change"],
        notification_id: json["notification_id"],
      );

  Map<String, dynamic> toJson() => {
        "notification_id": notification_id,
        "can_change": can_change,
        "user_flag": user_flag,
        "default_flag": default_flag,
      };
}
