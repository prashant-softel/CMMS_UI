// coverage:ignore-file

import 'dart:convert';

/// To parse this JSON data, do
///
///     final configResponse = configResponseFromJson(jsonString);
ConfigResponse configResponseFromJson(String str) =>
    ConfigResponse.fromJson(json.decode(str) as Map<String, dynamic>);

class ConfigResponse {
  ConfigResponse({
    required this.message,
    required this.data,
  });

  factory ConfigResponse.fromJson(Map<String, dynamic> json) => ConfigResponse(
        message: json['message'] as String,
        data: json['data'] != null
            ? ConfigData.fromJson(json['data'] as Map<String, dynamic>)
            : null,
      );

  final String message;
  final ConfigData? data;
}

class ConfigData {
  ConfigData({
    this.imageBucket,
    this.priceForBookingForIn15Min,
    this.priceForBookingForUk15Min,
    this.defaultLan,
    this.copyrightText,
    this.supportMail,
    this.baseUrl,
    this.imageBaseUrl,
    this.extensionPlanForIn,
    this.extensionPlanForUk,
    this.videoCallAppId,
    this.countryCodeName,
    this.currencySymbol,
    this.defaultCurrency,
    this.razorpayId,
    this.instantClassRequestTimeout,
    this.taxPercentage,
  });

  factory ConfigData.fromJson(Map<String, dynamic> json) => ConfigData(
        defaultLan: json['defaultLan'] as String? ?? '',
        copyrightText: json['copyrightText'] as String? ?? '',
        imageBucket: json['imageBucket'] as String? ?? '',
        instantClassRequestTimeout:
            json['instantClassRequestTimeout'] as num? ?? 0,
        supportMail: json['supportMail'] as String? ?? '',
        baseUrl: json['baseUrl'] as String? ?? '',
        imageBaseUrl: json['imageBaseUrl'] as String? ?? '',
        videoCallAppId: json['videoCallAppId'] as String? ?? '',
        razorpayId: json['razorpayId'] as String? ?? '',
        countryCodeName: json['countryCodeName'] as String? ?? '',
        currencySymbol: json['currencySymbol'] as String? ?? '',
        defaultCurrency: json['defaultCurrency'] as String? ?? '',
        taxPercentage: json['taxPercentage'] as num? ?? 0,
        priceForBookingForIn15Min: json['priceForBookingForIn15Min'] == null
            ? null
            : PriceForBookingFor.fromJson(
                json['priceForBookingForIn15Min'] as Map<String, dynamic>),
        priceForBookingForUk15Min: json['priceForBookingForUk15Min'] == null
            ? null
            : PriceForBookingFor.fromJson(
                json['priceForBookingForUk15Min'] as Map<String, dynamic>),
        extensionPlanForIn: json['extensionPlanForIn'] == null
            ? []
            : List<ExtensionPlanFor>.from(
                (json['extensionPlanForIn'] as List<dynamic>).map<dynamic>(
                    (dynamic x) =>
                        ExtensionPlanFor.fromJson(x as Map<String, dynamic>))),
        extensionPlanForUk: json['extensionPlanForIn'] == null
            ? []
            : List<ExtensionPlanFor>.from(
                (json['extensionPlanForUk'] as List<dynamic>).map<dynamic>(
                    (dynamic x) =>
                        ExtensionPlanFor.fromJson(x as Map<String, dynamic>))),
      );

  final String? defaultLan;
  final String? copyrightText;
  final String? supportMail;
  final String? baseUrl;
  final String? imageBaseUrl;
  final String? imageBucket;
  final String? videoCallAppId;
  final num? instantClassRequestTimeout;
  final List<ExtensionPlanFor>? extensionPlanForIn;
  final List<ExtensionPlanFor>? extensionPlanForUk;
  final String? razorpayId;
  final String? countryCodeName;
  final String? currencySymbol;
  final String? defaultCurrency;
  final PriceForBookingFor? priceForBookingForIn15Min;
  final PriceForBookingFor? priceForBookingForUk15Min;
  final num? taxPercentage;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'defaultLan': defaultLan,
        'copyrightText': copyrightText,
        'supportMail': supportMail,
        'baseUrl': baseUrl,
        'imageBaseUrl': imageBaseUrl,
        'imageBucket': imageBucket,
        'instantClassRequestTimeout': instantClassRequestTimeout,
        'videoCallAppId': videoCallAppId,
        'taxPercentage': taxPercentage,
        'priceForBookingForIn15Min': priceForBookingForIn15Min!.toJson(),
        'priceForBookingForUk15Min': priceForBookingForUk15Min!.toJson(),
        'extensionPlanForIn': List<dynamic>.from(
            extensionPlanForIn!.map<dynamic>((x) => x.toJson())),
        'extensionPlanForUk': List<dynamic>.from(
            extensionPlanForUk!.map<dynamic>((x) => x.toJson())),
        'razorpayId': razorpayId,
        'countryCodeName': countryCodeName,
        'currencySymbol': currencySymbol,
        'defaultCurrency': defaultCurrency,
      };
}

class ExtensionPlanFor {
  ExtensionPlanFor({
    this.min,
    this.price,
    this.taxAmount,
    this.totalPrice,
  });

  factory ExtensionPlanFor.fromJson(Map<String, dynamic> json) =>
      ExtensionPlanFor(
        min: json['min'] as num? ?? 0,
        price: json['price'] as num? ?? 0,
        taxAmount: json['taxAmount'] as num? ?? 0,
        totalPrice: json['totalPrice'] as num? ?? 0,
      );

  final num? min;
  final num? price;
  final num? taxAmount;
  final num? totalPrice;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'min': min,
        'price': price,
        'taxAmount': taxAmount,
        'totalPrice': totalPrice,
      };
}

class PriceForBookingFor {
  factory PriceForBookingFor.fromJson(Map<String, dynamic> json) =>
      PriceForBookingFor(
        min: json['min'] as num? ?? 0,
        price: json['price'] as num? ?? 0,
        taxAmount: json['taxAmount'] as num? ?? 0,
        totalPrice: json['totalPrice'] as num? ?? 0,
      );
  PriceForBookingFor({
    this.min,
    this.price,
    this.taxAmount,
    this.totalPrice,
  });

  final num? min;
  final num? price;
  final num? taxAmount;
  final num? totalPrice;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'min': min,
        'price': price,
        'taxAmount': taxAmount,
        'totalPrice': totalPrice,
      };
}
