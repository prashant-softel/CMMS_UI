// To parse this JSON data, do
//
//     final walletSettingsResponse = walletSettingsResponseFromJson(jsonString);

import 'dart:convert';

WalletSettingsResponse walletSettingsResponseFromJson(String str) =>
    WalletSettingsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String walletSettingsResponseToJson(WalletSettingsResponse data) =>
    json.encode(data.toJson());

class WalletSettingsResponse {
  factory WalletSettingsResponse.fromJson(Map<String, dynamic> json) =>
      WalletSettingsResponse(
        message: json['message'] as String? ?? '',
        data: json['data'] == null
            ? []
            : List<WalletSettingsData>.from((json['data'] as List<dynamic>? ??
                    <dynamic>[])
                .map<dynamic>((dynamic x) =>
                    WalletSettingsData.fromJson(x as Map<String, dynamic>))),
      );
  WalletSettingsResponse({
    this.message,
    this.data,
  });

  String? message;
  List<WalletSettingsData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': data,
      };
}

class WalletSettingsData {
  factory WalletSettingsData.fromJson(Map<String, dynamic> json) =>
      WalletSettingsData(
        id: json['_id'] as String? ?? '',
        amount: json['amount'] as num? ?? 0,
        countryCodeName: json['countryCodeName'] as String? ?? '',
        cashbackType: json['cashbackType'] as String? ?? '',
        createdTs: json['createdTs'] as num? ?? 0,
        value: json['value'] as num? ?? 0,
      );
  WalletSettingsData({
    this.id,
    this.amount,
    this.countryCodeName,
    this.cashbackType,
    this.createdTs,
    this.value,
  });

  String? id;
  num? amount;
  String? countryCodeName;
  String? cashbackType;
  num? createdTs;
  num? value;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'amount': amount,
        'countryCodeName': countryCodeName,
        'cashbackType': cashbackType,
        'createdTs': createdTs,
        'value': value,
      };
}
