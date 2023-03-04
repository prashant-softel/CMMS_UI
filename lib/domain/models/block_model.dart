import 'dart:convert';

///
List<BlockModel> blockModelFromJson(String str) =>
    List<BlockModel>.from(json.decode(str).map((x) => BlockModel.fromJson(x)));

String blockModelToJson(List<BlockModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlockModel {
  BlockModel({
    this.id,
    this.name,
    this.address,
    this.city,
    this.state,
    this.country,
    this.pin,
  });

  int? id;
  String? name;
  String? address;
  String? city;
  String? state;
  String? country;
  int? pin;

  factory BlockModel.fromJson(Map<String, dynamic> json) => BlockModel(
        id: json["id"] == null ? 0 : json['id'],
        name: json["name"] == null ? '' : json['name'],
        address: json["address"] == null ? '' : json['address'],
        city: json["city"] == null ? '' : json['city'],
        state: json["state"] == null ? '' : json['state'],
        country: json["country"] == null ? '' : json['country'],
        pin: json["pin"] == null ? 0 : json['pin'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "city": city,
        "state": state,
        "country": country,
        "pin": pin,
      };

  ///
}
