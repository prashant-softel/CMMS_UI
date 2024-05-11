import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<UserListModel> userListModelFromJson(String str) =>
    List<UserListModel>.from(
        json.decode(str).map((x) => UserListModel.fromJson(x)));

String userListModelToJson(List<UserListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserListModel {
  int? id;
  String? full_name;
  String? name;
  String? role_name;
  String? contact_no;
  String? created_at;
  String? updated_at;
  int? role_id;
  String? status;
  int? photoId;
  String? photoPath;
  List<Facility>? facilities;

  UserListModel(
      {this.id,
      this.contact_no,
      this.full_name,
      this.role_name,
      this.created_at,
      this.updated_at,
      this.name,
      this.photoId,
      this.photoPath,
      this.role_id,
      this.status,
      this.facilities,
  });

  factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
        id: json['id'],
        full_name: json['full_name'],
        contact_no: json['contact_no'],
        role_name: json['role_name'],
        created_at: json['createdAt'],
        updated_at: json['updatedAt'],
        name: json['user_name'],
        photoId: json['photoId'],
        photoPath: json['photoPath'],
        role_id: json['role_id'],
        status: json['status'],
        facilities: json['facilities'] != null
            ? List<Facility>.from(
                json['facilities'].map((x) => Facility.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": name,
        "full_name": full_name,
        "contact_no": contact_no,
        "role_name": role_name,
        "CreatedAt": created_at,
        "updatedAt": updated_at,
        "photoId": photoId,
        "photoPath": photoPath != null
            ? "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
            : "https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        "role_id": role_id,
        "status": status,
        "facilities": facilities != null
            ? List<dynamic>.from(facilities!.map((x) => x.toJson()))
            : null,
      };
}

class Facility {
  String? name;

  Facility({this.name});

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
