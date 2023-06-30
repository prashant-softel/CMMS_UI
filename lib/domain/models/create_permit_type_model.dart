import 'dart:convert';

List<CreatePermitTypeModel> CreateModuleListModelFromJson(String str) =>
    List<CreatePermitTypeModel>.from(
        json.decode(str).map((x) => CreatePermitTypeModel.fromJson(x)));

String CreateModuleListModelToJson(List<CreatePermitTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreatePermitTypeModel {

  String? title;
  String? description;
  int? facilityId;
  int? status;

  CreatePermitTypeModel({
    // this.id,
    this.title,
    this.description,
    this.facilityId,
    this.status,
  });

  factory CreatePermitTypeModel.fromJson(Map<String, dynamic> json) =>
      CreatePermitTypeModel(
        // id: json['id'],
        title: json['title'],
        description: json['description'],
        facilityId: json['facilityId'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
    // "id": id,
    "title": title,
    "description": description,
    "facilityId": facilityId,
    "status": status
  };
}
