import 'dart:convert';

CommonResponseModel commonResponseModelFromJson(String str) =>
    CommonResponseModel.fromJson(json.decode(str));

String commonResponseModelToJson(CommonResponseModel data) =>
    json.encode(data.toJson());

class CommonResponseModel {
  CommonResponseModel({
    this.id,
    this.message,
  });

  int? id;
  String? message;

  factory CommonResponseModel.fromJson(Map<String, dynamic> json) =>
      CommonResponseModel(
        id: json["id"] as int? ?? 0,
        message: json["message"] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
      };
}
