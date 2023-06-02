import 'dart:convert';

import 'package:get/get.dart';

GetNotificationModel getNotificationModelFromJson(String str) =>
    GetNotificationModel.fromJson(json.decode(str));

class GetNotificationModel {
  int? role_id;
  String? role_name;
  List<NotificationList>? notification_list;

  GetNotificationModel({this.role_id, this.role_name, this.notification_list});

  factory GetNotificationModel.fromJson(Map<String, dynamic> parsedJson) {
    var notification_list = parsedJson['notification_list'] as List;
    List<NotificationList> notificationlist =
        notification_list.map((i) => NotificationList.fromJson(i)).toList();

    return GetNotificationModel(
        role_id: parsedJson['role_id'],
        role_name: parsedJson['role_name'],
        notification_list: notificationlist);
  }
}

class NotificationList {
  RxInt notification_id = RxInt(0);
  RxString module_name = RxString('');
  RxString feature_name = RxString('');
  RxString notification_name = RxString('');
  RxInt default_flag = RxInt(0);
  RxInt can_change = RxInt(0);
  RxInt user_flag = RxInt(0);

  NotificationList({
    required int notification_id,
    required String module_name,
    required String feature_name,
    required String notification_name,
    required int default_flag,
    required int can_change,
    required int user_flag,
  }) {
    this.notification_id.value = notification_id;
    this.feature_name.value = feature_name;
    this.module_name.value = module_name;
    this.notification_name.value = notification_name;
    this.default_flag.value = default_flag;
    this.can_change.value = can_change;
    this.user_flag.value = user_flag;
  }

  factory NotificationList.fromJson(Map<String, dynamic> json) =>
      NotificationList(
        can_change: json["can_change"],
        default_flag: json["default_flag"],
        feature_name: json["feature_name"],
        module_name: json["module_name"],
        notification_id: json["notification_id"],
        notification_name: json["notification_name"],
        user_flag: json["user_flag"],
      );

  Map<String, dynamic> toJson() => {
        "user_flag": user_flag,
        "notification_name": notification_name,
        "notification_id": notification_id,
        "module_name": module_name,
        "feature_name": feature_name,
        "default_flag": default_flag,
        "can_change": can_change
      };
}
