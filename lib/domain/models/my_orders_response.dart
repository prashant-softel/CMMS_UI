// To parse this JSON data, do
//
//     final myOrdersResponse = myOrdersResponseFromJson(jsonString);

import 'dart:convert';

MyOrdersResponse myOrdersResponseFromJson(String str) =>
    MyOrdersResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String myOrdersResponseToJson(MyOrdersResponse data) =>
    json.encode(data.toJson());

class MyOrdersResponse {
  MyOrdersResponse({
    this.message,
    this.data,
  });

  factory MyOrdersResponse.fromJson(Map<String, dynamic> json) =>
      MyOrdersResponse(
        message: json['message'] == null ? null : json['message'] as String,
        data: List<MyOrdersDatum>.from(
          (json['data'] as List<dynamic>).map<dynamic>(
            (dynamic x) => MyOrdersDatum.fromJson(x as Map<String, dynamic>),
          ),
        ),
      );

  String? message;
  List<MyOrdersDatum>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'data': data == null
            ? null
            : List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
      };
}

class MyOrdersDatum {
  MyOrdersDatum({
    this.id,
    this.price,
    this.status,
    this.createdDate,
    this.createdTs,
    this.updatedAt,
    this.orderType,
    this.appCommission,
    this.finalAmount,
    this.tax,
    this.lastDigit,
    this.isViewed,
    this.orderId,
    this.scheduleData,
    this.reason,
    this.opponentUser,
    this.notes,
    this.orderThumbnailUrl,
    this.orderUrl,
  });

  factory MyOrdersDatum.fromJson(Map<String, dynamic> json) => MyOrdersDatum(
        id: json['_id'] == null ? null : json['_id'] as String? ?? '',
        price: json['price'] == null
            ? null
            : Price.fromJson(json['price'] as Map<String, dynamic>),
        status: json['status'] == null ? null : json['status'] as String,
        createdDate: json['createdDate'] == null
            ? null
            : DateTime.parse(json['createdDate'] as String? ?? ''),
        createdTs:
            json['createdTs'] == null ? null : json['createdTs'] as int? ?? 0,
        updatedAt:
            json['updatedAt'] == null ? null : json['updatedAt'] as int? ?? 0,
        orderType: json['orderType'] == null
            ? null
            : json['orderType'] as String? ?? '',
        appCommission: json['appCommission'] as String? ?? '',
        finalAmount: json['finalAmount'] as String? ?? '',
        tax: json['tax'] as String? ?? '',
        lastDigit: json['lastDigit'] as String? ?? '',
        isViewed: json['isViewed'] == null
            ? null
            : json['isViewed'] as bool? ?? false,
        orderId:
            json['orderId'] == null ? null : json['orderId'] as String? ?? '',
        scheduleData: json['scheduleData'] == null
            ? null
            : ScheduleData.fromJson(
                json['scheduleData'] as Map<String, dynamic>),
        reason: json['reason'] == null ? null : json['reason'] as String? ?? '',
        opponentUser: json['opponentUser'] == null
            ? null
            : OpponentUser.fromJson(
                json['opponentUser'] as Map<String, dynamic>),
        notes: json['notes'] as String? ?? '',
        orderThumbnailUrl: json['orderThumbnailUrl'] as String? ?? '',
        orderUrl: json['orderUrl'] as String? ?? '',
      );

  String? id;
  Price? price;
  String? status;
  DateTime? createdDate;
  int? createdTs;
  int? updatedAt;
  String? orderType;
  String? appCommission;
  String? finalAmount;
  String? tax;
  String? lastDigit;
  bool? isViewed;
  String? orderId;
  ScheduleData? scheduleData;
  String? reason;
  OpponentUser? opponentUser;
  String? notes;
  String? orderThumbnailUrl;
  String? orderUrl;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'price': price!.toJson(),
        'status': status,
        'createdDate': createdDate!.toIso8601String(),
        'createdTs': createdTs,
        'updatedAt': updatedAt,
        'orderType': orderType,
        'appCommission': appCommission,
        'finalAmount': finalAmount,
        'tax': tax,
        'lastDigit': lastDigit,
        'isViewed': isViewed,
        'orderId': orderId,
        'scheduleData': scheduleData!.toJson(),
        'reason': reason,
        'opponentUser': opponentUser!.toJson(),
        'notes': notes,
        'orderThumbnailUrl': orderThumbnailUrl,
        'orderUrl': orderUrl,
      };
}

class OpponentUser {
  OpponentUser({
    this.username,
    this.firstName,
    this.lastName,
    this.profilePic,
  });

  factory OpponentUser.fromJson(Map<String, dynamic> json) => OpponentUser(
        username:
            json['username'] == null ? null : json['username'] as String? ?? '',
        firstName: json['firstName'] == null
            ? null
            : json['firstName'] as String? ?? '',
        lastName:
            json['lastName'] == null ? null : json['lastName'] as String? ?? '',
        profilePic: json['profilePic'] == null
            ? null
            : json['profilePic'] as String? ?? '',
      );

  String? username;
  String? firstName;
  String? lastName;
  String? profilePic;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'profilePic': profilePic,
      };
}

class Price {
  Price({
    this.price,
    this.currencyCode,
    this.currencySymbol,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        price: json['price'] == null ? null : json['price'] as int? ?? 0,
        currencyCode: json['currencyCode'] as String? ?? '',
        currencySymbol: json['currencySymbol'] as String? ?? '',
      );

  int? price;
  String? currencyCode;
  String? currencySymbol;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'price': price,
        'currencyCode': currencyCode,
        'currencySymbol': currencySymbol,
      };
}

class ScheduleData {
  ScheduleData({
    this.sid,
    this.scheduleDate,
    this.startTime,
    this.endTime,
    this.startTs,
    this.endTs,
  });

  factory ScheduleData.fromJson(Map<String, dynamic> json) => ScheduleData(
        sid: json['sid'] == null
            ? null
            : List<String>.from(json['sid'] as List<dynamic>),
        scheduleDate: json['scheduleDate'] == null
            ? null
            : json['scheduleDate'] as String? ?? '',
        startTime: json['startTime'] == null
            ? null
            : json['startTime'] as String? ?? '',
        endTime:
            json['endTime'] == null ? null : json['endTime'] as String? ?? '',
        startTs: json['startTs'] == null ? null : json['startTs'] as int? ?? 0,
        endTs: json['endTs'] == null ? null : json['endTs'] as int? ?? 0,
      );

  List<String>? sid;
  String? scheduleDate;
  String? startTime;
  String? endTime;
  int? startTs;
  int? endTs;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'sid': sid == null
            ? null
            : List<dynamic>.from(sid!.map<dynamic>((x) => x)),
        'scheduleDate': scheduleDate == null ? null : scheduleDate,
        'startTime': startTime == null ? null : startTime,
        'endTime': endTime == null ? null : endTime,
        'startTs': startTs == null ? null : startTs,
        'endTs': endTs == null ? null : endTs,
      };
}
