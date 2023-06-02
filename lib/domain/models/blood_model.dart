import 'dart:convert';

List<BloodModel> facilityListFromJson(String str) =>
    List<BloodModel>.from(json.decode(str).map(BloodModel.fromJson));

String facilityListToJson(List<BloodModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BloodModel {
  factory BloodModel.fromJson(Map<String, dynamic> json) => BloodModel(
        id: json['id'],
        name: json['name'],
        // input: json['input'],
      );
  BloodModel({
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
