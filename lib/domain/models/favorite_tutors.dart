import 'dart:convert';

import 'package:cmms/domain/domain.dart';

FavoriteTutors favoriteTutorsFromJson(String str) =>
    FavoriteTutors.fromJson(json.decode(str) as Map<String, dynamic>);

String favoriteTutorsToJson(FavoriteTutors data) => json.encode(data.toJson());

class FavoriteTutors {
  FavoriteTutors({
    this.message,
    this.data,
  });

  factory FavoriteTutors.fromJson(Map<String, dynamic> json) => FavoriteTutors(
        message: json['message'] as String? ?? '',
        data: json['data'] == null
            ? []
            : List<PreviousTutorr>.from((json['data'] as List<dynamic>)
                .map<dynamic>((dynamic x) =>
                    PreviousTutorr.fromJson(x as Map<String, dynamic>))),
      );

  String? message;
  List<PreviousTutorr>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'data': data,
      };
}
