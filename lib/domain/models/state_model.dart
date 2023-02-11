import 'dart:convert';

List<StateModel> facilityListFromJson(String str) =>
    List<StateModel>.from(json.decode(str).map(StateModel.fromJson));

String facilityListToJson(List<StateModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StateModel {
  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        id: json['id'],
        name: json['name'],
        input: json['input'],
      );
  StateModel({
    this.id,
    this.name,
    this.input,
  });

  int? id;
  String? name;
  int? input;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'input': input,
      };
}
