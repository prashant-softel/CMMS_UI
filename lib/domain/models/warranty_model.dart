import 'dart:convert';

List<WarrantyModel> facilityListFromJson(String str) =>
    List<WarrantyModel>.from(json.decode(str).map(WarrantyModel.fromJson));

String facilityListToJson(List<WarrantyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WarrantyModel {
  factory WarrantyModel.fromJson(Map<String, dynamic> json) => WarrantyModel(
        id: json['id'],
        name: json['name'],
        // input: json['input'],
      );
  WarrantyModel({
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
