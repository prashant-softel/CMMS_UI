import 'dart:convert';

List<UserListModel> userListModelFromJson(String str) =>
    List<UserListModel>.from(
        json.decode(str).map((x) => UserListModel.fromJson(x)));

String userListModelToJson(List<UserListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserListModel {
  int? id;
  String? full_name;
  String? user_name;
  String? role_name;
  String? contact_no;

  UserListModel(
      {this.id,
      this.contact_no,
      this.full_name,
      this.role_name,
      this.user_name});

  factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
        id: json['id'],
        full_name: json['full_name'],
        contact_no: json['contact_no'],
        role_name: json['role_name'],
        user_name: json['user_name'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": user_name,
        "full_name": full_name,
        "contact_no": contact_no,
        "role_name": role_name,
      };
}
