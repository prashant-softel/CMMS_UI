// class TypeModel {
//   final String name;
//   final String id;

//   TypeModel({required this.name, required this.id});
// }

import 'dart:convert';

class TypeModel {
  final String name;
  final String? id;

  TypeModel({required this.name, this.id});

  TypeModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }
}

// class TypeModel {
//   final String name;
//   final String id;

//   TypeModel({required this.name, required this.id});
// }

class GenderModel {
  final String name;
  final int? id;

  GenderModel({required this.name, this.id});

  GenderModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }
}

class StatusModel {
  final String name;
  final int? id;

  StatusModel({required this.name, this.id});

  StatusModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }
}

List<StatusModel> StatusModelFromJson(String str) => List<StatusModel>.from(
    json.decode(str).map((x) => StatusModel.fromJson(x)));

String StatusModelToJson(List<StatusModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MonthModel {
  final String name;
  final String? id;

  MonthModel({required this.name, this.id});

  MonthModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }
}
