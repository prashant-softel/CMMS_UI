// To parse this JSON data, do
//
//     final getCountryLink = getCountryLinkFromJson(jsonString);

import 'dart:convert';

GetCountryLink getCountryLinkFromJson(String str) =>
    GetCountryLink.fromJson(json.decode(str) as Map<String, dynamic>);

String getCountryLinkToJson(GetCountryLink data) => json.encode(data.toJson());

class GetCountryLink {
  GetCountryLink({
    this.message,
    this.data,
  });

  factory GetCountryLink.fromJson(Map<String, dynamic> json) => GetCountryLink(
        message: json['message'] as String? ?? '',
        data: CountryLinkData.fromJson(json['data'] as Map<String, dynamic>),
      );

  String? message;
  CountryLinkData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': data!.toJson(),
      };
}

class CountryLinkData {
  CountryLinkData({
    this.data,
    this.totalCount,
  });

  factory CountryLinkData.fromJson(Map<String, dynamic> json) =>
      CountryLinkData(
        data: List<CountryLinkDatum>.from((json['data'] as List).map<dynamic>(
            (dynamic x) =>
                CountryLinkDatum.fromJson(x as Map<String, dynamic>))),
        totalCount: json['totalCount'] as int? ?? 0,
      );

  List<CountryLinkDatum>? data;
  int? totalCount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
        'totalCount': totalCount,
      };
}

class CountryLinkDatum {
  CountryLinkDatum({
    this.id,
    this.countryCode,
    this.pgCommission,
    this.fixedCommission,
    this.payoutAvailable,
    this.bankField,
    this.pgId,
    this.pgName,
    this.identifier,
    this.pgTransactionUrl,
    this.pgWithdrawalUrl,
    this.pgLogUrl,
    this.pgRefundedUrl,
    this.pgIcon,
  });

  factory CountryLinkDatum.fromJson(Map<String, dynamic> json) =>
      CountryLinkDatum(
        id: json['_id'] as String? ?? '',
        countryCode: json['countryCode'] as String? ?? '',
        pgCommission: json['pgCommission'] as double? ?? 0.00,
        fixedCommission: json['fixedCommission'] as double? ?? 0.00,
        payoutAvailable: json['payoutAvailable'] as bool? ?? false,
        bankField: List<BankField>.from((json['bankField'] as List)
            .map<dynamic>(
                (dynamic x) => BankField.fromJson(x as Map<String, dynamic>))),
        pgId: json['pgId'] as String? ?? '',
        pgName: json['pgName'] as String? ?? '',
        identifier: json['identifier'] as String? ?? '',
        pgTransactionUrl: json['pgTransactionUrl'] as String? ?? '',
        pgWithdrawalUrl: json['pgWithdrawalUrl'] as String? ?? '',
        pgLogUrl: json['pgLogUrl'] as String? ?? '',
        pgRefundedUrl: json['pgRefundedUrl'] as String? ?? '',
        pgIcon: json['pgIcon'] as String? ?? '',
      );

  String? id;
  String? countryCode;
  double? pgCommission;
  double? fixedCommission;
  bool? payoutAvailable;
  List<BankField>? bankField;
  String? pgId;
  String? pgName;
  String? identifier;
  String? pgTransactionUrl;
  String? pgWithdrawalUrl;
  String? pgLogUrl;
  String? pgRefundedUrl;
  String? pgIcon;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'countryCode': countryCode,
        'pgCommission': pgCommission,
        'fixedCommission': fixedCommission,
        'payoutAvailable': payoutAvailable,
        'bankField':
            List<dynamic>.from(bankField!.map<dynamic>((x) => x.toJson())),
        'pgId': pgId,
        'pgName': pgName,
        'identifier': identifier,
        'pgTransactionUrl': pgTransactionUrl,
        'pgWithdrawalUrl': pgWithdrawalUrl,
        'pgLogUrl': pgLogUrl,
        'pgRefundedUrl': pgRefundedUrl,
        'pgIcon': pgIcon,
      };
}

class BankField {
  BankField({
    this.fieldId,
    this.fieldName,
    this.fieldType,
    this.isMandatory,
    this.documentCount,
    this.order,
  });

  factory BankField.fromJson(Map<String, dynamic> json) => BankField(
        fieldId: json['fieldId'] as String? ?? '',
        fieldName:
            FieldName.fromJson(json['fieldName'] as Map<String, dynamic>),
        fieldType: json['fieldType'] as String? ?? '',
        isMandatory: json['isMandatory'] as bool? ?? false,
        documentCount: json['documentCount'],
        order: json['order'] as int? ?? 0,
      );

  String? fieldId;
  FieldName? fieldName;
  String? fieldType;
  bool? isMandatory;
  dynamic documentCount;
  int? order;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'fieldId': fieldId,
        'fieldName': fieldName!.toJson(),
        'fieldType': fieldType,
        'isMandatory': isMandatory,
        'documentCount': documentCount,
        'order': order,
      };
}

class FieldName {
  FieldName({
    this.en,
  });

  factory FieldName.fromJson(Map<String, dynamic> json) => FieldName(
        en: json['en'] as String? ?? '',
      );

  String? en;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'en': en,
      };
}
