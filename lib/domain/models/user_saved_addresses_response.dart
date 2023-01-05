// To parse this JSON data, do
//
//     final userSavedAddressesResponse = userSavedAddressesResponseFromJson(jsonString);

import 'dart:convert';

UserSavedAddressesResponse userSavedAddressesResponseFromJson(String str) => UserSavedAddressesResponse.fromJson(json.decode(str) as Map<String,dynamic>);

String userSavedAddressesResponseToJson(UserSavedAddressesResponse data) => json.encode(data.toJson());

class UserSavedAddressesResponse {
  UserSavedAddressesResponse({
    this.message,
    this.data,
  });

  factory UserSavedAddressesResponse.fromJson(Map<String, dynamic> json) => UserSavedAddressesResponse(
    message: json['message'] as String? ?? '',
    data: json['data'] != null
        ? List<UserSavedAddressData>.from(
        (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                (dynamic x) =>
                    UserSavedAddressData.fromJson(x as Map<String, dynamic>)))
        : [],
  );

  String? message;
  List<UserSavedAddressData>? data;

  Map<String, dynamic> toJson() => <String,dynamic>{
    'message': message == null ? null : message,
    'data': data,
  };
}

class UserSavedAddressData {
  UserSavedAddressData({
    this.id,
    this.address,
    this.line1,
    this.area,
    this.city,
    this.state,
    this.country,
    this.zipCode,
    this.lat,
    this.long,
    this.note,
    this.isDefault,
  });

  factory UserSavedAddressData.fromJson(Map<String, dynamic> json) => UserSavedAddressData(
    id: json['_id'] as String? ?? '',
    address: json['address'] as String? ?? '',
    line1: json['line1'] as String? ?? '',
    area: json['area'] as String? ?? '',
    city: json['city'] as String? ?? '',
    state: json['state'] as String? ?? '',
    country: json['country'] as String? ?? '',
    zipCode: json['zipCode'] as String? ?? '',
    lat: json['lat'],
    long: json['long'],
    note: json['note']as String? ?? '',
    isDefault: json['isDefault'] as bool? ?? false,
  );

  String? id;
  String? address;
  String? line1;
  String? area;
  String? city;
  String? state;
  String? country;
  String? zipCode;
  dynamic lat;
  dynamic long;
  String? note;
  bool? isDefault;

  Map<String, dynamic> toJson() => <String,dynamic>{
    '_id': id == null ? null : id,
    'address': address == null ? null : address,
    'line1': line1 == null ? null : line1,
    'area': area == null ? null : area,
    'city': city == null ? null : city,
    'state': state == null ? null : state,
    'country': country == null ? null : country,
    'zipCode': zipCode == null ? null : zipCode,
    'lat': lat == null ? null : lat,
    'long': long == null ? null : long,
    'note': note == null ? null : note,
    'isDefault': isDefault == null ? null : isDefault,
  };
}
