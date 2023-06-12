import 'dart:convert';

class CreateFacilityType {
  String title;
  int ownerId;
  int customerId;
  int operatorId;
  int spvId;
  String address;
  int city;
  int state;
  int country;
  int zipcode;
  String description;
  int photoId;
  double latitude;
  double longitude;
  String timezone;

  CreateFacilityType({
    required this.title,
    required this.ownerId,
    required this.customerId,
    required this.operatorId,
    required this.spvId,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.zipcode,
    required this.description,
    required this.photoId,
    required this.latitude,
    required this.longitude,
    required this.timezone,
  });

  factory CreateFacilityType.fromJson(Map<String, dynamic> json) =>
      CreateFacilityType(
        title: json['name'],
        ownerId: json['ownerId'],
        customerId: json['customerId'],
        operatorId: json['operatorId'],
        spvId: json['spvId'],
        address: json['address'],
        city: json['cityId'],
        state: json['stateId'],
        country: json['countryId'],
        zipcode: json['zipcode'],
        description: json['description'],
        photoId: json['photoId'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        timezone: json['timezone'],
      );

  Map<String, dynamic> toJson() => {
        'name': title,
        'ownerId': ownerId,
        'customerId': customerId,
        'operatorId': operatorId,
        'spvId': spvId,
        'address': address,
        'cityId': city,
        'stateId': state,
        'countryId': country,
        'zipcode': zipcode,
        'description': description,
        'photoId': photoId,
        'latitude': latitude,
        'longitude': longitude,
        'timezone': timezone,
      };
}
