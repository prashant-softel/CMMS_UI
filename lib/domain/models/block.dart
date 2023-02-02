// To parse this JSON data, do
//
//     final block = blockFromJson(jsonString);

import 'dart:convert';

List<Block> blockFromJson(String str) =>
    List<Block>.from(json.decode(str).map((x) => Block.fromJson(x)));

String blockToJson(List<Block> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Block {
  Block({
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

  factory Block.fromJson(Map<String, dynamic> json) => Block(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        pin: json["pin"],
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
}
