import 'dart:convert';

List<SupplierNameModel> supplierNameListModelFromJson(String str) =>
    List<SupplierNameModel>.from(
        json.decode(str).map((x) => SupplierNameModel.fromJson(x)));

String supplierNameModelToJson(List<SupplierNameModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SupplierNameModel {
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

  SupplierNameModel(
      {this.id,
      this.name,
      this.email,
      this.contactPerson,
      this.contactNumber,
      this.website,
      this.location,
      this.address,
      this.city,
      this.state,
      this.country,
      this.zip,
      this.type,
      this.status,
      this.addedAt});

  SupplierNameModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    contactPerson = json['contactPerson'];
    contactNumber = json['contactNumber'];
    website = json['website'];
    location = json['location'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zip = json['zip'];
    type = json['type'];
    status = json['status'];
    addedAt = json['addedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['contactPerson'] = this.contactPerson;
    data['contactNumber'] = this.contactNumber;
    data['website'] = this.website;
    data['location'] = this.location;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['zip'] = this.zip;
    data['type'] = this.type;
    data['status'] = this.status;
    data['addedAt'] = this.addedAt;
    return data;
  }
}
