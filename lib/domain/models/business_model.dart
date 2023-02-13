import 'dart:convert';

List<BusinessModel> businessModelFromJson(String str) =>
    List<BusinessModel>.from(
        json.decode(str).map((x) => BusinessModel.fromJson(x)));

String businessModelToJson(List<BusinessModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BusinessModel {
  BusinessModel({
    required this.id,
    required this.name,
    required this.email,
    required this.contactPerson,
    required this.contactNumber,
    required this.website,
    required this.location,
    this.address,
    this.city,
    this.state,
    this.country,
    this.zip,
    required this.type,
    required this.status,
    required this.addedAt,
  });

  int? id;
  String? name;
  String? email;
  String? contactPerson;
  String? contactNumber;
  String? website;
  String? location;
  String? address;
  String? city;
  String? state;
  String? country;
  String? zip;
  int? type;
  int? status;
  String? addedAt;

  factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
        id: json["id"] as int? ?? 0,
        name: json["name"] as String? ?? '',
        email: json["email"] as String? ?? '',
        contactPerson: json["contactPerson"] as String? ?? '',
        contactNumber: json["contactNumber"] as String? ?? '',
        website: json["website"] as String? ?? '',
        location: json["location"] as String? ?? '',
        address: json["address"] as String? ?? '',
        city: json["city"] as String? ?? '',
        state: json["state"] as String? ?? '',
        country: json["country"] as String? ?? '',
        zip: json["zip"] as String? ?? '',
        type: json["type"] as int? ?? 0,
        status: json["status"] as int? ?? 0,
        addedAt: json["addedAt"] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "contactPerson": contactPerson,
        "contactNumber": contactNumber,
        "website": website,
        "location": location,
        "address": address,
        "city": city,
        "state": state,
        "country": country,
        "zip": zip,
        "type": type,
        "status": status,
        "addedAt": addedAt,
      };
}
