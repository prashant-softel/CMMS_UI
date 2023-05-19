import 'dart:convert';

import '../../app/utils/utility.dart';

UserDetailsModel userDetailsModelFromJson(String str) =>
    UserDetailsModel.fromJson(json.decode(str));

class UserDetailsModel {
  String? first_name;
  String? last_name;
  String? gender_name;
  String? dob;
  String? country_name;
  String? state_name;
  String? city_name;
  String? full_name;
  String? user_name;
  String? role_name;
  String? contact_no;
  int? gender_id;
  int? country_id;
  int? state_id;
  int? city_id;
  int? id;

  UserDetailsModel(
      {this.city_id,
      this.role_name,
      this.city_name,
      this.contact_no,
      this.country_id,
      this.country_name,
      this.dob,
      this.first_name,
      this.full_name,
      this.gender_id,
      this.gender_name,
      this.last_name,
      this.state_id,
      this.state_name,
      this.user_name,
      this.id});

  factory UserDetailsModel.fromJson(Map<String, dynamic> parsedJson) {
    return UserDetailsModel(
      city_id: parsedJson['city_id'],
      role_name: parsedJson['role_name'],
      city_name: parsedJson['city_name'],
      contact_no: parsedJson['contact_no'],
      country_id: parsedJson['country_id'],
      country_name: parsedJson['country_name'],
      dob: Utility.getFormatedyearMonthDay(parsedJson['dob']),
      first_name: parsedJson['first_name'],
      full_name: parsedJson['full_name'],
      state_id: parsedJson['state_id'],
      last_name: parsedJson['last_name'],
      gender_id: parsedJson['gender_id'],
      state_name: parsedJson['state_name'],
      user_name: parsedJson['user_name'],
      gender_name: parsedJson['gender_name'],
      id: parsedJson['id'],
    );
  }
}
