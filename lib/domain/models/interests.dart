// To parse this JSON data, do
//
//     final interests = interestsFromJson(jsonString);

import 'dart:convert';

Interests interestsFromJson(String str) =>
    Interests.fromJson(json.decode(str) as Map<String, dynamic>);

String interestsToJson(Interests data) => json.encode(data.toJson());

class Interests {
  Interests({
    this.message,
    this.data,
    this.totalCount,
  });

  factory Interests.fromJson(Map<String, dynamic> json) => Interests(
        message: json['message'] as String? ?? '',
        data: json['data'] == null
            ? []
            : List<InterestData>.from((json['data'] as List<dynamic>)
                .map<dynamic>((dynamic x) =>
                    InterestData.fromJson(x as Map<String, dynamic>))),
        totalCount: json['totalCount'] as int? ?? 0,
      );

  String? message;
  List<InterestData>? data;
  int? totalCount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
        'totalCount': totalCount,
      };
}

class InterestData {
  InterestData({
    this.id,
    this.interest,
    this.createdOnTimestamp,
    this.ordering,
    this.createdOnDate,
    this.iconUrl,
  });

  factory InterestData.fromJson(Map<String, dynamic> json) => InterestData(
        id: json['_id'] as String? ?? '',
        interest: json['interest'] as String? ?? '',
        // interest: Interest.fromJson(json['interest'] as Map<String, dynamic>),
        createdOnTimestamp: json['createdOnTimestamp'] as int? ?? 0,
        ordering: json['ordering'] as int? ?? 0,
        createdOnDate: json['createdOnDate'] as String? ?? '',
        iconUrl: json['iconUrl'] as String? ?? '',
      );

  String? id;
  String? interest;
  int? createdOnTimestamp;
  int? ordering;
  String? createdOnDate;
  String? iconUrl;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'interest': interest,
        'createdOnTimestamp': createdOnTimestamp,
        'ordering': ordering,
        'createdOnDate': createdOnDate,
        'iconUrl': iconUrl,
      };
}

class Interest {
  Interest({
    this.en,
  });

  factory Interest.fromJson(Map<String, dynamic> json) => Interest(
        en: json['en'] as String? ?? '',
      );

  String? en;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'en': en,
      };
}
