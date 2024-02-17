import 'dart:convert';

List<FacilityModel> facilityListFromJson(String str) =>
    List<FacilityModel>.from(json.decode(str).map(FacilityModel.fromJson));

String facilityListToJson(List<FacilityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FacilityModel {
  factory FacilityModel.fromJson(Map<String, dynamic> json) => FacilityModel(
        id: json['id'],
        plant_id: json['plant_id'],
        plant_name: json['plant_name'],
        name: json['name'],
        address: json['address'] ?? '',
        city: json['city'] ?? '',
        state: json['state'] ?? '',
        country: json['country'] ?? '',
        pincode: json['pin'],
      );
  FacilityModel(
      {required this.id,
      required this.name,
      required this.address,
      required this.city,
      required this.state,
      required this.country,
      this.pincode,
      this.plant_id,
      this.plant_name});

  int id;
  int? plant_id;
  String? plant_name;
  String name;
  String? address;
  String city;
  String state;
  String country;
  dynamic pincode;

  Map<String, dynamic> toJson() => {
        'id': id,
        'plant_id': plant_id,
        'plant_name': plant_name,
        'name': name,
        'address': address,
        'city': city,
        'state': state,
        'country': country,
        'pin': pincode,
      };
}
