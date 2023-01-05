// To parse this JSON data, do
//
//     final mySubscriptions = mySubscriptionsFromJson(jsonString);

import 'dart:convert';

MySubscriptions mySubscriptionsFromJson(String str) =>
    MySubscriptions.fromJson(json.decode(str) as Map<String, dynamic>);

String mySubscriptionsToJson(MySubscriptions data) =>
    json.encode(data.toJson());

class MySubscriptions {
  MySubscriptions({
    this.message,
    this.data,
  });

  factory MySubscriptions.fromJson(Map<String, dynamic> json) =>
      MySubscriptions(
        message:
            json['message'] == null ? null : json['message'] as String? ?? '',
        data: json['data'] == null
            ? null
            : MySubscriptionsData.fromJson(
                json['data'] as Map<String, dynamic>),
      );

  String? message;
  MySubscriptionsData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'data': data == null ? null : data!.toJson(),
      };
}

class MySubscriptionsData {
  MySubscriptionsData({
    this.totalCount,
    this.subscription,
  });

  factory MySubscriptionsData.fromJson(Map<String, dynamic> json) =>
      MySubscriptionsData(
        totalCount:
            json['totalCount'] == null ? null : json['totalCount'] as int? ?? 0,
        subscription: json['subscription'] == null
            ? null
            : List<MySubscription>.from(
                (json['subscription'] as List<dynamic>? ?? <dynamic>[])
                    .map<dynamic>((dynamic x) =>
                        MySubscription.fromJson(x as Map<String, dynamic>))),
      );

  int? totalCount;
  List<MySubscription>? subscription;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'totalCount': totalCount == null ? null : totalCount,
        'subscription': subscription == null
            ? null
            : List<dynamic>.from(subscription!.map<dynamic>((x) => x.toJson())),
      };
}

class MySubscription {
  MySubscription({
    this.id,
    this.planStartTime,
    this.planEndTime,
    this.planName,
    this.totalAmount,
    this.amount,
    this.discount,
    this.currency,
    this.planDuration,
    this.planDurationType,
    this.planDescription,
    this.createdTs,
    this.userInvoiceUrl,
    this.userId,
    this.userUsername,
    this.userFullName,
    this.profilePic,
    this.userTypeCode,
    this.userTypeText,
  });

  factory MySubscription.fromJson(Map<String, dynamic> json) => MySubscription(
        id: json['_id'] == null ? null : json['_id'] as String? ?? '',
        planStartTime: json['planStartTime'] == null
            ? null
            : json['planStartTime'] as int? ?? 0,
        planEndTime: json['planEndTime'] == null
            ? null
            : json['planEndTime'] as int? ?? 0,
        planName:
            json['planName'] == null ? null : json['planName'] as String? ?? '',
        totalAmount: json['totalAmount'] == null
            ? null
            : json['totalAmount'] as int? ?? 0,
        amount: json['amount'] == null ? null : json['amount'] as int? ?? 0,
        discount:
            json['discount'] == null ? null : json['discount'] as int? ?? 0,
        currency: MySubscriptionsCurrency.fromJson(
            json['currency'] as Map<String, dynamic>),
        planDuration: json['planDuration'] == null
            ? null
            : json['planDuration'] as int? ?? 0,
        planDurationType: json['planDurationType'] == null
            ? null
            : json['planDurationType'] as String? ?? '',
        planDescription: json['planDescription'] == null
            ? null
            : json['planDescription'] as String? ?? '',
        createdTs:
            json['createdTs'] == null ? null : json['createdTs'] as int? ?? 0,
        userInvoiceUrl: json['userInvoiceUrl'] == null
            ? null
            : json['userInvoiceUrl'] as String? ?? '',
        userId: json['userId'] == null ? null : json['userId'] as String? ?? '',
        userUsername: json['userUsername'] == null
            ? null
            : json['userUsername'] as String? ?? '',
        userFullName: json['userFullName'] == null
            ? null
            : json['userFullName'] as String? ?? '',
        profilePic: json['profilePic'] == null
            ? null
            : json['profilePic'] as String? ?? '',
        userTypeCode: json['userTypeCode'] == null
            ? null
            : json['userTypeCode'] as int? ?? 0,
        userTypeText: json['userTypeText'] == null
            ? null
            : json['userTypeText'] as String? ?? '',
      );

  String? id;
  int? planStartTime;
  int? planEndTime;
  String? planName;
  int? totalAmount;
  int? amount;
  int? discount;
  MySubscriptionsCurrency? currency;
  int? planDuration;
  String? planDurationType;
  String? planDescription;
  int? createdTs;
  String? userInvoiceUrl;
  String? userId;
  String? userUsername;
  String? userFullName;
  String? profilePic;
  int? userTypeCode;
  String? userTypeText;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id == null ? null : id,
        'planStartTime': planStartTime == null ? null : planStartTime,
        'planEndTime': planEndTime == null ? null : planEndTime,
        'planName': planName == null ? null : planName,
        'totalAmount': totalAmount == null ? null : totalAmount,
        'amount': amount == null ? null : amount,
        'discount': discount == null ? null : discount,
        'currency': currency == null ? null : currency!.toJson(),
        'planDuration': planDuration == null ? null : planDuration,
        'planDurationType': planDurationType == null ? null : planDurationType,
        'planDescription': planDescription == null ? null : planDescription,
        'createdTs': createdTs == null ? null : createdTs,
        'userInvoiceUrl': userInvoiceUrl == null ? null : userInvoiceUrl,
        'userId': userId == null ? null : userId,
        'userUsername': userUsername == null ? null : userUsername,
        'userFullName': userFullName == null ? null : userFullName,
        'profilePic': profilePic == null ? null : profilePic,
        'userTypeCode': userTypeCode == null ? null : userTypeCode,
        'userTypeText': userTypeText == null ? null : userTypeText,
      };
}

class MySubscriptionsCurrency {
  MySubscriptionsCurrency({
    this.currencyCode,
    this.symbol,
  });

  factory MySubscriptionsCurrency.fromJson(Map<String, dynamic> json) =>
      MySubscriptionsCurrency(
        currencyCode: json['currency_code'] == null
            ? null
            : json['currency_code'] as String? ?? '',
        symbol: json['symbol'] == null ? null : json['symbol'] as String? ?? '',
      );

  String? currencyCode;
  String? symbol;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'currency_code': currencyCode,
        'symbol': symbol,
      };
}
