import 'dart:convert';

Address addressFromJson(String str) =>
    Address.fromJson(json.decode(str) as Map<String, dynamic>);

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  Address({
    this.addressLine1,
    this.addressLine2,
    this.area,
    this.city,
    this.country,
    this.pincode,
    this.addressName,
    this.aptNo,
    this.lat,
    this.long,
    this.state,
    this.zipCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressLine1: json['addressLine1'] as String? ?? '',
        addressLine2: json['addressLine2'] as String? ?? '',
        area: json['area'] as String? ?? '',
        city: json['city'] as String? ?? '',
        country: json['country'] as String? ?? '',
        pincode: json['pincode'] as String? ?? '',
        addressName: json['addressName'] as String? ?? '',
        aptNo: json['aptNo'] as String? ?? '',
        state: json['state'] as String? ?? '',
        zipCode: json['zipCode'] as String? ?? '',
        lat: json['lat'] as double? ?? 0.0,
        long: json['long'] as double? ?? 0.0,
      );

  String? addressLine1;
  String? addressLine2;
  String? area;
  String? city;
  String? country;
  String? pincode;
  String? addressName;
  String? aptNo;

  String? state;

  String? zipCode;
  double? lat;
  double? long;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'addressLine1': addressLine1,
        'addressLine2': addressLine2,
        'area': area,
        'city': city,
        'country': country,
        'pincode': pincode,
        'addressName': addressName,
        'aptNo': aptNo,
        'state': state,
        'zipCode': zipCode,
        'lat': lat,
        'long': long,
      };
}
