// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

List<EmployeeModel> employeeModelFromJson(String str) =>
    List<EmployeeModel>.from(
        json.decode(str).map((x) => EmployeeModel.fromJson(x)));

String employeeModelToJson(List<EmployeeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeModel {
  EmployeeModel({
    required this.id,
    this.loginId,
    required this.name,
    required this.birthdate,
    required this.gender,
    required this.mobileNumber,
    required this.city,
    required this.state,
    required this.country,
    required this.pin,
  });

  int id;
  dynamic loginId;
  String name;
  DateTime birthdate;
  Gender gender;
  String mobileNumber;
  String city;
  String state;
  Country country;
  int pin;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"],
        loginId: json["login_id"],
        name: json["name"],
        birthdate: DateTime.parse(json["birthdate"]),
        gender: genderValues.map[json["gender"]]!,
        mobileNumber: json["mobileNumber"],
        city: json["city"],
        state: json["state"],
        country: countryValues.map[json["country"]]!,
        pin: json["pin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "login_id": loginId,
        "name": name,
        "birthdate": birthdate.toIso8601String(),
        "gender": genderValues.reverse[gender],
        "mobileNumber": mobileNumber,
        "city": city,
        "state": state,
        "country": countryValues.reverse[country],
        "pin": pin,
      };
}

enum Country { INDIA }

final countryValues = EnumValues({"India": Country.INDIA});

enum Gender { MALE, GENDER_MALE }

final genderValues =
    EnumValues({"Male": Gender.GENDER_MALE, "male": Gender.MALE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
