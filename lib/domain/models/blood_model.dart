import 'dart:convert';

List<BloodListModel> facilityListFromJson(String str) =>
    List<BloodListModel>.from(json.decode(str).map(BloodListModel.fromJson));

String facilityListToJson(List<BloodListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BloodListModel {
  factory BloodListModel.fromJson(Map<String, dynamic> json) => BloodListModel(
        id: json['id'],
        name: json['name'],
        // input: json['input'],
      );
  BloodListModel({
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
