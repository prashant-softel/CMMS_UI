// To parse this JSON data, do
//
//     final htmlPage = htmlPageFromJson(jsonString);

import 'dart:convert';

HtmlPage htmlPageFromJson(String str) =>
    HtmlPage.fromJson(json.decode(str) as Map<String, dynamic>);

String htmlPageToJson(HtmlPage data) => json.encode(data.toJson());

class HtmlPage {
  HtmlPage({
    this.message,
    this.data,
  });

  factory HtmlPage.fromJson(Map<String, dynamic> json) => HtmlPage(
        message: json['message'] as String? ?? '',
        data: HtmlPageData.fromJson(json['data'] as Map<String, dynamic>),
      );

  String? message;
  HtmlPageData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': data!.toJson(),
      };
}

class HtmlPageData {
  HtmlPageData({
    this.id,
    this.pageContent,
  });

  factory HtmlPageData.fromJson(Map<String, dynamic> json) => HtmlPageData(
        id: json['_id'] as String? ?? '',
        pageContent: json['pageContent'] as String? ?? '',
      );

  String? id;
  String? pageContent;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'pageContent': pageContent,
      };
}
