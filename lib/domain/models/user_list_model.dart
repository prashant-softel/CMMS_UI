import 'dart:convert';

List<UserListModel> userListModelFromJson(String str) =>
    List<UserListModel>.from(
        json.decode(str).map((x) => UserListModel.fromJson(x)));

String userListModelToJson(List<UserListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserListModel {
  int? id;
  String? secondaryName;
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? full_name;
  String? gender;
  String? bloodGroup;
  String? mobileNumber;
  String? landlineNumber;
  int? zipcode;
  int? isemployee;
  String? country;
  String? city;
  String? state;
  String? joiningdate;
  String? name;
  String? role_name;
  String? designation;
  String? contact_no;
  String? created_at;
  String? updated_at;
  int? role_id;
  String? status;
  int? photoId;
  String? photoPath;
  List<Facility>? facilities;

  UserListModel({
    this.id,
    this.secondaryName,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.bloodGroup,
    this.mobileNumber,
    this.landlineNumber,
    this.zipcode,
    this.isemployee,
    this.country,
    this.city,
    this.state,
    this.joiningdate,
    this.contact_no,
    this.full_name,
    this.role_name,
    this.designation,
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
        secondaryName: json['secondaryName'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        full_name: json['full_name'],
        dateOfBirth: json['dateOfBirth'],
        gender: json['gender'],
        bloodGroup: json['bloodGroup'],
        mobileNumber: json['mobileNumber'],
        landlineNumber: json['landlineNumber'],
        country: json['country'],
        state: json['state'],
        city: json['city'],
        zipcode: json['zipcodes'],
        isemployee: json['employees'],
        joiningdate: json['joining_dates'],
        contact_no: json['contact_no'],
        role_name: json['role_name'],
        designation: json['designation'],
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
        "secondaryName": secondaryName,
        "firstName": firstName,
        "lastName": lastName,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
        "bloodGroup": bloodGroup,
        "mobileNumber": mobileNumber,
        "landlineNumber": landlineNumber,
        "country": country,
        "state": state,
        "city": city,
        "zipcodes": zipcode,
        "employees": isemployee,
        "joining_dates": joiningdate,
        "contact_no": contact_no,
        "role_name": role_name,
        "designation": designation,
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
