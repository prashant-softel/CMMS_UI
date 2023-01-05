// coverage:ignore-file

import 'dart:convert';

/// To parse this JSON data, do
///
///     final termsAndPolicyResponse = termsAndPolicyResponseFromJson(jsonString);
TermsAndPolicyResponse termsAndPolicyResponseFromJson(String str) =>
    TermsAndPolicyResponse.fromJson(json.decode(str) as Map<String, dynamic>);

class TermsAndPolicyResponse {
  TermsAndPolicyResponse({
    required this.message,
    required this.data,
  });

  factory TermsAndPolicyResponse.fromJson(Map<String, dynamic> json) =>
      TermsAndPolicyResponse(
        message: json['message'] as String? ?? '',
        data: json['data'] != null
            ? TermsData.fromJson(json['data'] as Map<String, dynamic>)
            : TermsData(),
      );

  final String message;
  final TermsData? data;
}

class TermsData {
  TermsData({
    this.id,
    this.pageContent,
  });

  factory TermsData.fromJson(Map<String, dynamic> json) => TermsData(
        id: json['_id'] as String? ?? '',
        pageContent: json['pageContent'] as String? ?? '',
      );

  final String? id;
  final String? pageContent;
}
