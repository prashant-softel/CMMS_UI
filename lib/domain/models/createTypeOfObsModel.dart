//  To parse this JSON

import 'dart:convert';

List<CreateTypeOfObsModel> businessTypeModelFromJson(String str) =>
    List<CreateTypeOfObsModel>.from(
        json.decode(str).map((x) => CreateTypeOfObsModel.fromJson(x)));

String businessTypeModelToJson(List<CreateTypeOfObsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateTypeOfObsModel {
  CreateTypeOfObsModel({
    this.name,
    this.description,
  });

  String? name;
  String? description;

  factory CreateTypeOfObsModel.fromJson(Map<String, dynamic> json) {
    return CreateTypeOfObsModel(
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
    };
  }
}
