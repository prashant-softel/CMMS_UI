import 'dart:convert';

List<CountryModel> facilityListFromJson(String str) =>
    List<CountryModel>.from(json.decode(str).map(CountryModel.fromJson));

String facilityListToJson(List<CountryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        id: json['id'],
        name: json['name'],
        // input: json['input'],
      );
  CountryModel({
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
