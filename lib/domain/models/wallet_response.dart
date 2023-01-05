// To parse this JSON data, do
//
//     final walletResponse = walletResponseFromJson(jsonString);

import 'dart:convert';

WalletResponse walletResponseFromJson(String str) =>
    WalletResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String walletResponseToJson(WalletResponse data) => json.encode(data.toJson());

class WalletResponse {
  WalletResponse({
    this.message,
    this.data,
  });

  factory WalletResponse.fromJson(Map<String, dynamic> json) => WalletResponse(
    message:
    json['message'] == null ? null : json['message'] as String? ?? '',
    data: json['data'] == null
        ? null
        : WalletData.fromJson(json['data'] as Map<String, dynamic>),
  );

  String? message;
  WalletData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'message': message == null ? null : message,
    'data': data == null ? null : data!.toJson(),
  };
}

class WalletData {
  WalletData({
    this.walletData,
    this.walletEarningData,
  });

  factory WalletData.fromJson(Map<String, dynamic> json) => WalletData(
    walletData: json['walletData'] == null
        ? null
        : List<WalletDatum>.from((json['walletData'] as List<dynamic>)
        .map<dynamic>((dynamic x) =>
        WalletDatum.fromJson(x as Map<String, dynamic>))),
    walletEarningData: json['walletEarningData'] == null
        ? null
        : List<WalletEarningDatum>.from(
      (json['walletEarningData'] as List<dynamic>).map<dynamic>(
            (dynamic x) =>
            WalletEarningDatum.fromJson(x as Map<String, dynamic>),
      ),
    ),
  );

  List<WalletDatum>? walletData;
  List<WalletEarningDatum>? walletEarningData;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'walletData': walletData == null
        ? null
        : List<dynamic>.from(walletData!.map<dynamic>((x) => x.toJson())),
    'walletEarningData': walletEarningData == null
        ? null
        : List<dynamic>.from(
        walletEarningData!.map<dynamic>((x) => x.toJson())),
  };
}

class WalletDatum {
  WalletDatum({
    this.userid,
    this.usertype,
    this.currency,
    this.createddate,
    this.balance,
    this.hardLimit,
    this.isHardLimitHit,
    this.isSoftLimitHit,
    this.softLimit,
    this.status,
    this.statustext,
    this.walletid,
    this.withdrawalLimit,
    this.currencySymbol,
  });



  factory WalletDatum.fromJson(Map<String, dynamic> json) => WalletDatum(
    userid: json['userid'] == null ? null : json['userid'] as String? ?? '',
    usertype:
    json['usertype'] == null ? null : json['usertype'] as String? ?? '',
    currency:
    json['currency'] == null ? null : json['currency'] as String? ?? '',
    createddate: json['createddate'] == null
        ? null
        : DateTime.parse(
      json['createddate'] as String? ?? '',
    ),
    balance:
    json['balance'] == null ? null : json['balance'] as String? ?? '',
    hardLimit: json['hard_limit'],
    isHardLimitHit: json['is_hard_limit_hit'] == null
        ? null
        : json['is_hard_limit_hit'] as bool? ?? false,
    isSoftLimitHit: json['is_soft_limit_hit'] == null
        ? null
        : json['is_soft_limit_hit'] as bool? ?? false,
    softLimit: json['soft_limit'] ,
    status: json['status'] == null ? null : json['status'] as int? ?? 0,
    statustext: json['statustext'] == null
        ? null
        : json['statustext'] as String? ?? '',
    walletid:
    json['walletid'] == null ? null : json['walletid'] as String? ?? '',
    withdrawalLimit: json['withdrawal_limit'] == null
        ? null
        : json['withdrawal_limit'] as int? ?? 0,
    currencySymbol: json['currency_symbol'] == null
        ? null
        : json['currency_symbol'] as String? ?? '',
  );

  String? userid;
  String? usertype;
  String? currency;
  DateTime? createddate;
  String? balance;
  dynamic hardLimit;
  bool? isHardLimitHit;
  bool? isSoftLimitHit;
  dynamic softLimit;
  int? status;
  String? statustext;
  String? walletid;
  int? withdrawalLimit;
  String? currencySymbol;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'userid': userid == null ? null : userid,
    'usertype': usertype == null ? null : usertype,
    'currency': currency == null ? null : currency,
    'createddate': createddate,
    'balance': balance == null ? null : balance,
    'hard_limit': hardLimit,
    'is_hard_limit_hit': isHardLimitHit,
    'is_soft_limit_hit': isSoftLimitHit,
    'soft_limit': softLimit,
    'status': status,
    'statustext': statustext,
    'walletid': walletid,
    'withdrawal_limit': withdrawalLimit,
    'currency_symbol': currencySymbol,
  };
}

class WalletEarningDatum {
  WalletEarningDatum({
    this.balance,
    this.createddate,
    this.status,
    this.statustext,
    this.userid,
    this.usertype,
    this.walletearningid,
  });

  factory WalletEarningDatum.fromJson(Map<String, dynamic> json) =>
      WalletEarningDatum(
        balance:
        json['balance'] == null ? null : json['balance'] as String? ?? '',
        createddate: json['createddate'] == null
            ? null
            : DateTime.parse(json['createddate'] as String? ?? ''),
        status: json['status'] == null ? null : json['status'] as int? ?? 0,
        statustext: json['statustext'] == null
            ? null
            : json['statustext'] as String? ?? '',
        userid: json['userid'] == null ? null : json['userid'] as String? ?? '',
        usertype:
        json['usertype'] == null ? null : json['usertype'] as String? ?? '',
        walletearningid: json['walletearningid'] == null
            ? null
            : json['walletearningid'] as String? ?? '',
      );

  String? balance;
  DateTime? createddate;
  int? status;
  String? statustext;
  String? userid;
  String? usertype;
  String? walletearningid;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'balance': balance,
    'createddate': createddate,
    'status': status,
    'statustext': statustext,
    'userid': userid,
    'usertype': usertype,
    'walletearningid': walletearningid,
  };
}