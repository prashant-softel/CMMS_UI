import 'dart:convert';

List<FacilityModel> facilityListFromJson(String str) =>
    List<FacilityModel>.from(json.decode(str).map(FacilityModel.fromJson));

String facilityListToJson(List<FacilityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FacilityModel {
  factory FacilityModel.fromJson(Map<String, dynamic> json) => FacilityModel(
        id: json['id'],
        name: json['name'],
        address: json['address'] ?? '',
        city: json['city'] ?? '',
        state: json['state'] ?? '',
        country: json['country'] ?? '',
        pincode: json['pin'],
      );
  FacilityModel({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    this.pincode,
  });

  int id;
  String name;
  String? address;
  String city;
  String state;
  String country;
  dynamic pincode;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'city': city,
        'state': state,
        'country': country,
        'pin': pincode,
      };
}
