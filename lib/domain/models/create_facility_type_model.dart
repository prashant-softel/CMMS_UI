import 'dart:convert';

class CreateFacilityType {
  String title;
  String address;
  String city;
  String state;
  String country;
  String pin;
  String description;

  CreateFacilityType({
    required this.title,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.pin,
    required this.description,
  });

  factory CreateFacilityType.fromJson(Map<String, dynamic> json) =>
      CreateFacilityType(
        title: json['name'],
        address: json['address'],
        city: json['city'],
        state: json['state'],
        country: json['country'],
        pin: json['pin'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'name': title,
        'address': address,
        'city': city,
        'state': state,
        'country': country,
        'pin': pin,
        'description': description,
      };
}
