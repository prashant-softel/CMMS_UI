// To parse this JSON data, do
//
//     final billingTypeResponse = billingTypeResponseFromJson(jsonString);

import 'dart:convert';

BillingTypeResponse billingTypeResponseFromJson(String str) =>
    BillingTypeResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String billingTypeResponseToJson(BillingTypeResponse data) =>
    json.encode(data.toJson());

class BillingTypeResponse {
  BillingTypeResponse({
    this.message,
    this.data,
  });

  factory BillingTypeResponse.fromJson(Map<String, dynamic> json) =>
      BillingTypeResponse(
        message: json['message'] as String? ?? '',
        data: json['data'] == null
            ? null
            : List<BillingTypeDatum>.from(
                (json['data'] as List<dynamic>).map<dynamic>(
                  (dynamic x) =>
                      BillingTypeDatum.fromJson(x as Map<String, dynamic>),
                ),
              ),
      );

  String? message;
  List<BillingTypeDatum>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'data': data == null
            ? null
            : List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
      };
}

class BillingTypeDatum {
  BillingTypeDatum({
    this.id,
    this.orderTs,
    this.orderId,
    this.productId,
    this.productType,
    this.orderType,
    this.postData,
    this.productDescription,
    this.amount,
    this.currency,
    this.postedUserId,
    this.userId,
    this.userInvoiceUrl,
    this.invoiceUrl,
    this.opponentUserName,
    this.opponentProfilePic,
    this.productName,
    this.url,
  });

  factory BillingTypeDatum.fromJson(Map<String, dynamic> json) =>
      BillingTypeDatum(
        id: json['_id'] == null ? null : json['_id'] as String? ?? '',
        orderTs: json['orderTs'] == null ? null : json['orderTs'] as int? ?? 0,
        orderId:
            json['orderId'] == null ? null : json['orderId'] as String? ?? '',
        productId: json['productType'] as String? ?? '',
        orderType: json['orderType'] as String? ?? '',
        postData: json['postData'] == null
            ? null
            : BillingHistoryPostData.fromJson(json['postData'] as Map<String, dynamic>),
        productDescription: json['productDescription'] as String? ?? '',
        amount: json['amount'] == null ? null : json['amount'] as int? ?? 0,
        currency: json['currency'] as String? ?? '',
        postedUserId: json['postedUserId'] == null
            ? null
            : json['postedUserId'] as String? ?? '',
        userId: json['userId'] as String? ?? '',
        userInvoiceUrl: json['userInvoiceUrl'] == null
            ? null
            : json['userInvoiceUrl'] as String? ?? '',
        invoiceUrl: json['invoiceUrl'] == null
            ? null
            : json['invoiceUrl'] as String? ?? '',
        opponentUserName: json['opponentUserName'] == null
            ? null
            : json['opponentUserName'] as String? ?? '',
        opponentProfilePic: json['opponentProfilePic'] == null
            ? null
            : json['opponentProfilePic'] as String? ?? '',
        productName: json['productName'] as String? ?? '',
        url: json['url'] == null ? null : json['url'] as String? ?? '',
      );

  String? id;
  int? orderTs;
  String? orderId;
  String? productId;
  String? productType;
  String? orderType;
  BillingHistoryPostData? postData;
  String? productDescription;
  int? amount;
  String? currency;
  String? postedUserId;
  String? userId;
  String? userInvoiceUrl;
  String? invoiceUrl;
  String? opponentUserName;
  String? opponentProfilePic;
  String? productName;
  String? url;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'orderTs': orderTs,
        'orderId': orderId,
        'productId': productId,
        'productType': productType,
        'orderType': orderType,
        'postData': postData,
        'productDescription': productDescription,
        'amount': amount,
        'currency': currency,
        'postedUserId': postedUserId,
        'userId': userId,
        'userInvoiceUrl': userInvoiceUrl,
        'invoiceUrl': invoiceUrl,
        'opponentUserName': opponentUserName,
        'opponentProfilePic': opponentProfilePic,
        'productName': productName,
        'url': url,
      };
}

class BillingHistoryPostData {
  BillingHistoryPostData({
    this.seqId,
    this.type,
    this.url,
  });

  factory BillingHistoryPostData.fromJson(Map<String, dynamic> json) =>
      BillingHistoryPostData(
        seqId: json['seqId'] as int? ?? 0,
        type: json['type'] == null ? null : json['type'] as int? ?? 0,
        url: json['url'] == null ? null : json['url'] as String? ?? '',
      );

  int? seqId;
  int? type;
  String? url;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'seqId': seqId == null ? null : seqId,
        'type': type == null ? null : type,
        'url': url == null ? null : url,
      };
}
