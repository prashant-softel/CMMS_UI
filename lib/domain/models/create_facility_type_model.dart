class CreateFacilityType {
  int id;

  String name;
  int ownerId;
  int customerId;
  int operatorId;
  int spvId;
  String address;
  int cityId;
  int stateId;
  int countryId;
  int zipcode;
  String description;
  int photoId;
  double latitude;
  double longitude;
  String timezone;

  CreateFacilityType({
    required this.name,
    required this.ownerId,
    required this.customerId,
    required this.operatorId,
    required this.spvId,
    required this.address,
    required this.cityId,
    required this.id,
    required this.stateId,
    required this.countryId,
    required this.zipcode,
    required this.description,
    required this.photoId,
    required this.latitude,
    required this.longitude,
    required this.timezone,
  });

  factory CreateFacilityType.fromJson(Map<String, dynamic> json) =>
      CreateFacilityType(
        name: json['name'],
        id: json['id'],
        ownerId: json['ownerId'],
        customerId: json['customerId'],
        operatorId: json['operatorId'],
        spvId: json['spvId'],
        address: json['address'],
        cityId: json['cityId'],
        stateId: json['stateId'],
        countryId: json['countryId'],
        zipcode: json['zipcode'],
        description: json['description'],
        photoId: json['photoId'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        timezone: json['timezone'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'ownerId': ownerId,
        'customerId': customerId,
        'operatorId': operatorId,
        'spvId': spvId,
        'address': address,
        'cityId': cityId,
        'stateId': stateId,
        'countryId': countryId,
        'zipcode': zipcode,
        'description': description,
        'photoId': photoId,
        'latitude': latitude,
        'longitude': longitude,
        'timezone': timezone,
      };
}
