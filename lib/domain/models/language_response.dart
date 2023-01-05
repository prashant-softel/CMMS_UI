// To parse this JSON data, do
//
//     final languageResponse = languageResponseFromJson(jsonString);

import 'dart:convert';

LanguageResponse languageResponseFromJson(String str) =>
    LanguageResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String languageResponseToJson(LanguageResponse data) =>
    json.encode(data.toJson());

class LanguageResponse {
  LanguageResponse({
    this.message,
    this.data,
  });

  factory LanguageResponse.fromJson(Map<String, dynamic> json) =>
      LanguageResponse(
        message:
            json['message'] == null ? null : json['message'] as String? ?? '',
        data: json['data'] == null
            ? null
            : List<LanguageDatum>.from((json['data'] as List<dynamic>)
                .map<dynamic>((dynamic x) =>
                    LanguageDatum.fromJson(x as Map<String, dynamic>))),
      );

  String? message;
  List<LanguageDatum>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'data': data == null
            ? null
            : List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
      };
}

class LanguageDatum {
  LanguageDatum({
    this.id,
    this.language,
    this.languageCode,
    this.status,
    this.statusMsg,
    this.isRtl,
    this.isDefaultLan,
  });

  factory LanguageDatum.fromJson(Map<String, dynamic> json) => LanguageDatum(
        id: json['_id'] == null ? null : json['_id'] as String? ?? '',
        language:
            json['language'] == null ? null : json['language'] as String? ?? '',
        languageCode: json['languageCode'] == null
            ? null
            : json['languageCode'] as String? ?? '',
        status: json['status'] == null ? null : json['status'] as int? ?? 0,
        statusMsg: json['statusMsg'] == null
            ? null
            : json['statusMsg'] as String? ?? '',
        isRtl: json['isRTL'] == null ? null : json['isRTL'] as String? ?? '',
        isDefaultLan: json['isDefaultLan'] == null
            ? null
            : json['isDefaultLan'] as bool? ?? false,
      );

  String? id;
  String? language;
  String? languageCode;
  int? status;
  String? statusMsg;
  String? isRtl;
  bool? isDefaultLan;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'language': language,
        'languageCode': languageCode,
        'status': status,
        'statusMsg': statusMsg,
        'isRTL': isRtl,
        'isDefaultLan': isDefaultLan,
      };
}
