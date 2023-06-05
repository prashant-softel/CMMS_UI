// To parse this JSON data, do
//
//     final state = stateFromJson(jsonString);

import 'dart:convert';

List<CountryState?>? countrystateFromJson(String str) => json.decode(str) == null
    ? []
    : List<CountryState?>.from(
    json.decode(str)!.map((x) => CountryState.fromJson(x)));

String stateToJson(List<CountryState?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class CountryState {
  CountryState({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory CountryState.fromJson(Map<String, dynamic> json) => CountryState(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
