// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

UserNotification userNotificationFromJson(String str) =>
    UserNotification.fromJson(json.decode(str) as Map<String, dynamic>);

String userNotificationToJson(UserNotification data) =>
    json.encode(data.toJson());

class UserNotification {
  UserNotification({
    this.data,
    this.message,
    this.totalCount,
  });

  factory UserNotification.fromJson(Map<String, dynamic> json) =>
      UserNotification(
        data: List<UserNotificationData>.from(
            (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                (dynamic x) =>
                    UserNotificationData.fromJson(x as Map<String, dynamic>))),
        message: json['message'] as String? ?? '',
        totalCount: json['total_count'] as int? ?? 0,
      );

  List<UserNotificationData>? data;
  String? message;
  int? totalCount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
        'message': message,
        'total_count': totalCount,
      };
}

class UserNotificationData {
  UserNotificationData({
    this.totalCount,
    this.appName,
    this.userType,
    this.userTypeMsg,
    this.body,
    this.image,
    this.userName,
    this.metaData,
    this.notifyType,
    this.notificationTypeMsg,
    this.topic,
    this.isRead,
    this.notificationType,
    this.createdtimestamp,
    this.title,
    this.date,
    this.userMetaData,
  });

  factory UserNotificationData.fromJson(Map<String, dynamic> json) =>
      UserNotificationData(
        totalCount: json['total_count'] as int? ?? 0,
        appName: json['appName'] as String? ?? '',
        userType: json['userType'] as int? ?? 0,
        userTypeMsg: json['userTypeMsg'] as String? ?? '',
        body: json['body'] as String? ?? '',
        image: json['image'] as String? ?? '',
        userName: json['userName'] as String? ?? '',
        metaData: MetaData.fromJson(json['metaData'] as Map<String, dynamic>),
        notifyType: json['notifyType'] as int? ?? 0,
        notificationTypeMsg: json['notificationTypeMsg'] as String? ?? '',
        topic: json['topic'] as String? ?? '',
        isRead: json['isRead'] as int? ?? 0,
        notificationType: json['notificationType'] as int? ?? 0,
        createdtimestamp: json['createdtimestamp'] as double? ?? 0.0,
        title: json['title'] as String? ?? '',
        date: json['date'] as String? ?? '',
        userMetaData:
            UserMetaData.fromJson(json['userMetaData'] as Map<String, dynamic>),
      );

  int? totalCount;
  String? appName;
  int? userType;
  String? userTypeMsg;
  String? body;
  String? image;
  String? userName;
  MetaData? metaData;
  int? notifyType;
  String? notificationTypeMsg;
  String? topic;
  int? isRead;
  int? notificationType;
  double? createdtimestamp;
  String? title;
  String? date;
  UserMetaData? userMetaData;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'total_count': totalCount,
        'appName': appName,
        'userType': userType,
        'userTypeMsg': userTypeMsg,
        'body': body,
        'image': image,
        'userName': userName,
        'metaData': metaData!.toJson(),
        'notifyType': notifyType,
        'notificationTypeMsg': notificationTypeMsg,
        'topic': topic,
        'isRead': isRead,
        'notificationType': notificationType,
        'createdtimestamp': createdtimestamp,
        'title': title,
        'date': date,
        'userMetaData': userMetaData!.toJson(),
      };
}

class MetaData {
  MetaData({
    this.userId,
    this.userName,
    this.userProfilePic,
    this.userTypeCode,
    this.firstName,
    this.lastName,
    this.storyId,
    this.orderId,
    this.virtualOrderId,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        userId: json['userId'] as String? ?? '',
        userName: json['userName'] as String? ?? '',
        userProfilePic: json['userProfilePic'] == null
            ? null
            : json['userProfilePic'] as String? ?? '',
        userTypeCode: json['userTypeCode'] as int? ?? 0,
        firstName: json['firstName'] == null
            ? null
            : json['firstName'] as String? ?? '',
        lastName:
            json['lastName'] == null ? null : json['lastName'] as String? ?? '',
        storyId:
            json['storyId'] == null ? null : json['storyId'] as String? ?? '',
        orderId:
            json['orderId'] == null ? null : json['orderId'] as String? ?? '',
        virtualOrderId: json['virtualOrderId'] == null
            ? null
            : json['virtualOrderId'] as String? ?? '',
      );

  String? userId;
  String? userName;
  String? userProfilePic;
  int? userTypeCode;
  String? firstName;
  String? lastName;
  String? storyId;
  String? orderId;
  String? virtualOrderId;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId,
        'userName': userName,
        'userProfilePic': userProfilePic == null ? null : userProfilePic,
        'userTypeCode': userTypeCode,
        'firstName': firstName == null ? null : firstName,
        'lastName': lastName == null ? null : lastName,
        'storyId': storyId == null ? null : storyId,
        'orderId': orderId == null ? null : orderId,
        'virtualOrderId': virtualOrderId == null ? null : virtualOrderId,
      };
}

class UserMetaData {
  UserMetaData({
    this.id,
    this.firstName,
    this.lastName,
    this.profilePic,
    this.username,
  });

  factory UserMetaData.fromJson(Map<String, dynamic> json) => UserMetaData(
        id: json['_id'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        profilePic: json['profilePic'] == null
            ? null
            : json['profilePic'] as String? ?? '',
        username: json['username'] as String? ?? '',
      );

  String? id;
  String? firstName;
  String? lastName;
  String? profilePic;
  String? username;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
        'profilePic': profilePic == null ? null : profilePic,
        'username': username,
      };
}
