// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

List<EmployeeModel> employeeModelFromJson(String str) =>
    List<EmployeeModel>.from(
        json.decode(str).map((x) => EmployeeModel.fromJson(x)));

String employeeModelToJson(List<EmployeeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeModel {
  EmployeeModel({
    this.id,
    this.loginId,
    this.name,
    this.birthdate,
    this.gender,
    this.mobileNumber,
    this.city,
    this.state,
    this.country,
    this.pin,
    this.responsibility,
  });

  int? id;
  String? loginId;
  String? name;
  DateTime? birthdate;
  String? gender;
  String? mobileNumber;
  String? city;
  String? state;
  String? country;
  int? pin;
  String? responsibility;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"] == null ? null : json["id"],
        loginId: json["login_id"] == null ? null : json["login_id"],
        name: json["name"],
        birthdate: (json["birthdate"] == null)
            ? null
            : DateTime.parse(json["birthdate"] as String),
        gender: json["gender"] == null ? null : json["gender"],
        mobileNumber: json["mobileNumber"],
        city: json["city"],
        state: json["state"],
        country: json["country"]!,
        pin: json["pin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "login_id": loginId ?? 0,
        "name": name,
        "birthdate": birthdate?.toIso8601String(),
        "gender": genderValues.reverse[gender],
        "mobileNumber": mobileNumber,
        "city": city,
        "state": state,
        "country": country,
        "pin": pin,
      };
}

enum Gender { MALE, FEMALE }

final genderValues = EnumValues({"male": Gender.MALE, "female": Gender.FEMALE});

class EnumValues<T> {
  Map<String, T>? map;
  late Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map?.map((k, v) => MapEntry(v, k));
    return reverseMap ?? Map<T, String>();
  }
}

class EmployeeRow {
  EmployeeRow({
    required this.employeeName,
    required this.responsibilities,
  });

  final String employeeName;
  final TextEditingController responsibilities;
}
