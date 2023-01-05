// To parse this JSON data, do
//
//     final rateWithParameter = rateWithParameterFromJson(jsonString);

import 'dart:convert';

RateWithParameter rateWithParameterFromJson(String str) =>
    RateWithParameter.fromJson(json.decode(str) as Map<String, dynamic>);

String rateWithParameterToJson(RateWithParameter data) =>
    json.encode(data.toJson());

class RateWithParameter {
  RateWithParameter({
    this.rating,
  });

  factory RateWithParameter.fromJson(Map<String, dynamic> json) =>
      RateWithParameter(
        rating: json['rating'] == null
            ? []
            : List<Rating>.from((json['rating'] as List).map<dynamic>(
                (dynamic x) => Rating.fromJson(x as Map<String, dynamic>))),
      );

  List<Rating>? rating;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'rating': List<dynamic>.from(rating!.map<dynamic>((x) => x.toJson())),
      };
}

class Rating {
  Rating({
    this.parameterId,
    this.rating,
    this.title,
    this.learningObjectiveId,
    this.parameters,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        parameterId: json['parameterId'] as String? ?? '',
        rating: json['rating'] as num? ?? 0.0,
        title: json['title'] as String? ?? '',
        learningObjectiveId: json['learningObjectiveId'] as String? ?? '',
        parameters: json['parameters'] == null
            ? []
            : List<Parameter>.from((json['parameters'] as List).map<dynamic>(
                (dynamic x) => Parameter.fromJson(x as Map<String, dynamic>))),
      );

  String? parameterId;
  num? rating;
  String? title;
  String? learningObjectiveId;
  List<Parameter>? parameters;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'parameterId': parameterId,
        'rating': rating,
        // 'title': title,
        // 'learningObjectiveId': learningObjectiveId,
        // 'parameters': parameters == null
        //     ? <dynamic>[]
        //     : List<dynamic>.from(parameters!.map<dynamic>((x) => x.toJson())),
      };
}

class Parameter {
  factory Parameter.fromJson(Map<String, dynamic> json) => Parameter(
        parameterId: json['parameterId'] as String? ?? '',
        rating: json['rating'] as num? ?? 0.0,
        title: json['title'] as String? ?? '',
      );
  Parameter({
    this.parameterId,
    this.title,
    this.rating,
  });

  String? parameterId;
  String? title;
  num? rating;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'parameterId': parameterId,
        'title': title,
        'rating': rating,
      };
}
