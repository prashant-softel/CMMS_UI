// To parse this JSON data, do
//
//     final faqResponse = faqResponseFromJson(jsonString);

import 'dart:convert';

FaqResponse faqResponseFromJson(String str) =>
    FaqResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String faqResponseToJson(FaqResponse data) => json.encode(data.toJson());

class FaqResponse {
  FaqResponse({
    this.message,
    this.data,
  });

  factory FaqResponse.fromJson(Map<String, dynamic> json) => FaqResponse(
        message:
            json['message'] == null ? null : json['message'] as String? ?? '',
        data: json['data'] == null
            ? null
            : List<FAQDatum>.from((json['data'] as List<dynamic>).map<dynamic>(
                (dynamic x) => FAQDatum.fromJson(x as Map<String, dynamic>))),
      );

  String? message;
  List<FAQDatum>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'data': data == null
            ? null
            : List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
      };
}

class FAQDatum {
  FAQDatum({
    this.id,
    this.title,
    this.htmlContent,
    this.hasSubPoint,
    this.subPointsCount,
    this.link,
  });

  factory FAQDatum.fromJson(Map<String, dynamic> json) => FAQDatum(
        id: json['_id'] == null ? null : json['_id'] as String? ?? '',
        title: json['title'] == null ? null : json['title'] as String? ?? '',
        htmlContent: json['htmlContent'] == null
            ? null
            : json['htmlContent'] as String? ?? '',
        hasSubPoint: json['hasSubPoint'] == null
            ? null
            : json['hasSubPoint'] as bool? ?? false,
        subPointsCount: json['subPointsCount'] == null
            ? null
            : json['subPointsCount'] as int? ?? 0,
        link: json['link'] == null ? null : json['link'] as String? ?? '',
      );

  String? id;
  String? title;
  String? htmlContent;
  bool? hasSubPoint;
  int? subPointsCount;
  String? link;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id == null ? null : id,
        'title': title == null ? null : title,
        'htmlContent': htmlContent == null ? null : htmlContent,
        'hasSubPoint': hasSubPoint == null ? null : hasSubPoint,
        'subPointsCount': subPointsCount == null ? null : subPointsCount,
        'link': link == null ? null : link,
      };
}
