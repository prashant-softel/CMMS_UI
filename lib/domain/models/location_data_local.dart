// coverage:ignore-file
/// A chunk of location details needed
class LocationDataLocal {
  LocationDataLocal({
    required this.placeName,
    required this.addressLine1,
    required this.addressLine2,
    required this.area,
    required this.city,
    required this.postalCode,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  final String placeName;
  final String addressLine1;
  final String addressLine2;
  final String area;
  final String city;
  final String postalCode;
  final String country;
  final double latitude;
  final double longitude;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LocationDataLocal &&
              runtimeType == other.runtimeType &&
              placeName == other.placeName &&
              addressLine1 == other.addressLine1 &&
              addressLine2 == other.addressLine2 &&
              area == other.area &&
              city == other.city &&
              postalCode == other.postalCode &&
              country == other.country &&
              latitude == other.latitude &&
              longitude == other.longitude;

  @override
  int get hashCode =>
      placeName.hashCode ^
      addressLine1.hashCode ^
      addressLine2.hashCode ^
      area.hashCode ^
      city.hashCode ^
      postalCode.hashCode ^
      country.hashCode ^
      latitude.hashCode ^
      longitude.hashCode;

  @override
  String toString() =>
      'LocationData{placeName: $placeName, addressLine1: $addressLine1,'
          ' addressLine2: $addressLine2, area: $area, city: $city, postalCode:'
          ' $postalCode, country: $country, latitude: $latitude,'
          ' longitude: $longitude}';
}
