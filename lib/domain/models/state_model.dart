// import 'dart:convert';
//
// List<StateModel> stateFromJson(String str) =>
//     List<StateModel>.from(json.decode(str).map(StateModel.fromJson));
//
// String facilityListToJson(List<StateModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class StateModel {
//   factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
//         id: json['id'],
//         name: json['name'],
//         // input: json['input'],
//       );
//   StateModel({
//     this.id,
//     this.name,
//     // this.input,
//   });
//
//   int? id;
//   String? name;
//   // int? input;
//
//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'name': name,
//         // 'input': input,
//       };
// }



import 'dart:convert';

List<StateModel?>? stateFromJson(String str) => json.decode(str) == null
    ? []
    : List<StateModel?>.from(
    json.decode(str)!.map((x) => StateModel.fromJson(x)));

String stateToJson(List<StateModel?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class StateModel {
  StateModel({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
