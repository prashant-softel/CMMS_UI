import 'dart:convert';

import 'package:cmms/domain/models/designation_model.dart';

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
  String? company_name;
  int? company_id;
  int? designation_id;
  String? designation_name;

  // List<FacilityModel>? plant_list;
  List<PlantAccess>? plant_list;
  List<DesignationModel>? responsibility;

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
      this.responsibility,
      this.joiningDate,
      this.landline_number,
      this.photoId,
      this.photoPath,
      this.plant_list,
      this.role_id,
      this.secondaryEmail,
      this.status,
      this.company_name,
      this.company_id,
      this.designation_id,
      this.designation_name,
      this.zipcode});

  factory UserDetailsModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['plant_list'] as List;
    var list1 = parsedJson['responsibility'] as List;
    List<PlantAccess> plantList =
        list.map((i) => PlantAccess.fromJson(i)).toList();
    List<DesignationModel> responsibility =
        list1.map((i) => DesignationModel.fromJson(i)).toList();

    return UserDetailsModel(
        city_id: parsedJson['city_id'],
        company_name: parsedJson['company_name'],
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
        company_id: parsedJson['company_id'],
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
        plant_list: plantList,
        designation_id: parsedJson['designation_id'],
        designation_name: parsedJson['designation'],
        responsibility: responsibility);
  }
}

class PlantAccess {
  int? id;
  String? name;
  int? spv_id;
  bool isEmployees;
  String? spv;
  String? location;

  PlantAccess({
    this.id,
    this.name,
    this.spv_id,
    required this.isEmployees,
    this.spv,
    this.location,
  });

  factory PlantAccess.fromJson(Map<String, dynamic> parsedJson) {
    return PlantAccess(
      id: parsedJson['id'],
      name: parsedJson['name'],
      spv_id: parsedJson['spv_id'],
      isEmployees: parsedJson['isEmployees'],
      spv: parsedJson['spv'],
      location: parsedJson['location'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'spv_id': this.spv_id,
        'isEmployees': this.isEmployees,
        'spv': this.spv,
        'location': this.location,
      };
}

// class Responsibility {
//   int? id;
//   int? userId;
//   String? responsibility;
//   String? sinceWhen;

//   Responsibility({this.id, this.userId, this.responsibility, this.sinceWhen});

//   factory Responsibility.fromJson(Map<String, dynamic> json) {
//     return Responsibility(
//       id: json['id'],
//       userId: json['user_id'],
//       responsibility: json['responsibility'],
//       sinceWhen: Utility.getFormatedyearMonthDay(json['since_when']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['responsibility'] = this.responsibility;
//     data['since_when'] = this.sinceWhen;
//     return data;
//   }
// }
