import 'dart:convert';

List<FacilityModel> facilityListFromJson(String str) =>
    List<FacilityModel>.from(json.decode(str).map(FacilityModel.fromJson));

String facilityListToJson(List<FacilityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FacilityModel {
  factory FacilityModel.fromJson(Map<String, dynamic> json) => FacilityModel(
        id: json['id'] ?? 0,
        name: json['name'],
        address: json['address'] ?? '',
        city: json['city'] ?? '',
        state: json['state'] ?? '',
        country: json['country'] ?? '',
        pincode: json['pin'] ?? '',
        spv: json['spv'] ?? '',
        spv_id: json['spv_id'] ?? 0,
      );
  FacilityModel({
    required this.id,
    required this.name,
    this.address,
    this.city,
    this.state,
    this.country,
    this.spv,
    this.spv_id,
    this.pincode,
  });

  int id;

  String name;
  String? address;
  String? city;
  String? state;
  String? country;
  dynamic pincode;
  int? spv_id;

  String? spv;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'city': city,
        'state': state,
        'country': country,
        'pin': pincode,
        'spv': spv,
        'spv_id': spv_id,
      };
}
