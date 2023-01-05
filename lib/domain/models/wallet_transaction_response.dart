// To parse this JSON data, do
//
//     final walletTransactionResponse = walletTransactionResponseFromJson(jsonString);

import 'dart:convert';

WalletTransactionResponse walletTransactionResponseFromJson(String str) =>
    WalletTransactionResponse.fromJson(
        json.decode(str) as Map<String, dynamic>);

String walletTransactionResponseToJson(WalletTransactionResponse data) =>
    json.encode(data.toJson());

class WalletTransactionResponse {
  WalletTransactionResponse({
    this.message,
    this.data,
  });

  factory WalletTransactionResponse.fromJson(Map<String, dynamic> json) =>
      WalletTransactionResponse(
        message:
            json['message'] == null ? null : json['message'] as String? ?? '',
        data: json['data'] == null
            ? null
            : WalletTransactionData.fromJson(
                json['data'] as Map<String, dynamic>),
      );

  String? message;
  WalletTransactionData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'data': data == null ? null : data!.toJson(),
      };
}

class WalletTransactionData {
  WalletTransactionData({
    this.data,
    this.pageState,
    this.totalCount,
  });

  factory WalletTransactionData.fromJson(Map<String, dynamic> json) =>
      WalletTransactionData(
        data: json['data'] == null
            ? null
            : List<WalletTransactionDatum>.from(
                (json['data'] as List<dynamic>).map<dynamic>(
                  (dynamic x) => WalletTransactionDatum.fromJson(
                      x as Map<String, dynamic>),
                ),
              ),
        pageState: json['pageState'] as String? ?? '',
        totalCount: json['totalCount'] as String? ?? '',
      );

  List<WalletTransactionDatum>? data;
  String? pageState;
  String? totalCount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data == null
            ? null
            : List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
        'pageState': pageState,
        'totalCount': totalCount,
      };
}

class WalletTransactionDatum {
  WalletTransactionDatum({
    this.commontype,
    this.txntimestamp,
    this.txnid,
    this.amount,
    this.closingbal,
    this.currency,
    this.description,
    this.initiatedby,
    this.notes,
    this.openingbal,
    this.orderid,
    this.paymenttypemode,
    this.transactionid,
    this.trigger,
    this.txnlogid,
    this.txntype,
    this.txntypetext,
    this.userid,
    this.usertype,
    this.walletid,
  });

  factory WalletTransactionDatum.fromJson(Map<String, dynamic> json) =>
      WalletTransactionDatum(
        commontype: json['commontype'] as String? ?? '',
        txntimestamp:
            DateTime.parse(json['txntimestamp'] as String? ?? '').toLocal(),
        txnid: json['txnid'] as String? ?? '',
        amount: json['amount'] as String? ?? '',
        closingbal: json['closingbal'] as String? ?? '',
        currency: json['currency'] as String? ?? '',
        description: json['description'] as String? ?? '',
        initiatedby: json['initiatedby'] as String? ?? '',
        notes: json['notes'] as String? ?? '',
        openingbal: json['openingbal'] as String? ?? '',
        orderid: json['orderid'] as String? ?? '',
        paymenttypemode: json['paymenttypemode'] as String? ?? '',
        transactionid: json['transactionid'] as String? ?? '',
        trigger: json['trigger'] as String? ?? '',
        txnlogid: json['txnlogid'] as String? ?? '',
        txntype: json['txntype'] as int? ?? 0,
        txntypetext: json['txntypetext'] as String? ?? '',
        userid: json['userid'] as String? ?? '',
        usertype: json['usertype'] as String? ?? '',
        walletid: json['walletid'] as String? ?? '',
      );

  String? commontype;
  DateTime? txntimestamp;
  String? txnid;
  String? amount;
  String? closingbal;
  String? currency;
  String? description;
  String? initiatedby;
  String? notes;
  String? openingbal;
  String? orderid;
  String? paymenttypemode;
  String? transactionid;
  String? trigger;
  dynamic txnlogid;
  int? txntype;
  String? txntypetext;
  String? userid;
  String? usertype;
  String? walletid;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'commontype': commontype,
        'txntimestamp': txntimestamp,
        'txnid': txnid,
        'amount': amount,
        'closingbal': closingbal,
        'currency': currency,
        'description': description,
        'initiatedby': initiatedby,
        'notes': notes,
        'openingbal': openingbal,
        'orderid': orderid,
        'paymenttypemode': paymenttypemode,
        'transactionid': transactionid,
        'trigger': trigger,
        'txnlogid': txnlogid,
        'txntype': txntype,
        'txntypetext': txntypetext,
        'userid': userid,
        'usertype': usertype,
        'walletid': walletid,
      };
}
