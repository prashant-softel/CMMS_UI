import 'dart:convert';

List<CityModel> facilityListFromJson(String str) =>
    List<CityModel>.from(json.decode(str).map(CityModel.fromJson));

String facilityListToJson(List<CityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityModel {
  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json['id'],
        name: json['name'],
        // input: json['input'],
      );
  CityModel({
    this.id,
    this.name,
    // this.input,
  });

  int? id;
  String? name;
  // int? input;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        // 'input': input,
      };
}
