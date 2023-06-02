import 'dart:convert';

import '../../app/utils/utility.dart';

UserDetailsModel userDetailsModelFromJson(String str) =>
    UserDetailsModel.fromJson(json.decode(str));

class UserDetailsModel {
  String? first_name;
  String? last_name;
  String? secondaryEmail;
  String? landline_number;
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
  int? zipcode;
  int? isEmployee;
  String? joiningDate;
  int? blood_group_id;
  String? blood_group_name;
  int? role_id;
  String? status;
  int? photoId;
  String? photoPath;
  List<PlantList>? plant_list;

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
      this.id,
      this.blood_group_id,
      this.blood_group_name,
      this.isEmployee,
      this.joiningDate,
      this.landline_number,
      this.photoId,
      this.photoPath,
      this.plant_list,
      this.role_id,
      this.secondaryEmail,
      this.status,
      this.zipcode});

  factory UserDetailsModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['plant_list'] as List;
    List<PlantList> plantList = list.map((i) => PlantList.fromJson(i)).toList();

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
        blood_group_id: parsedJson['blood_group_id'],
        blood_group_name: parsedJson['blood_group_name'],
        isEmployee: parsedJson['isEmployee'],
        joiningDate: Utility.getFormatedyearMonthDay(parsedJson['joiningDate']),
        landline_number: parsedJson['landline_number'],
        photoId: parsedJson['photoId'],
        photoPath: parsedJson['photoPath'],
        role_id: parsedJson['role_id'],
        secondaryEmail: parsedJson['secondaryEmail'],
        status: parsedJson['status'],
        zipcode: parsedJson['zipcode'],
        plant_list: plantList);
  }
}

class PlantList {
  int? plant_id;
  String? plant_name;
  int? spv_id;
  String? spv_name;
  PlantList({this.plant_id, this.plant_name, this.spv_id, this.spv_name});

  factory PlantList.fromJson(Map<String, dynamic> parsedJson) {
    return PlantList(
      plant_id: parsedJson['plant_id'],
      plant_name: parsedJson['plant_name'],
      spv_id: parsedJson['spv_id'],
      spv_name: parsedJson['spv_name'],
    );
  }
}
