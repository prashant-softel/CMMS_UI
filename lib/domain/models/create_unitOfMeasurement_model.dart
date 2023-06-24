import 'dart:convert';

List<CreateUnitOfMeasurementModel> unitOfMeasurementModelFromJson(String str) =>
    List<CreateUnitOfMeasurementModel>.from(
        json.decode(str).map((x) => CreateUnitOfMeasurementModel.fromJson(x)));

String unitOfMeasurementModelToJson(List<CreateUnitOfMeasurementModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateUnitOfMeasurementModel {
  String? name;
  int? decimal_status;
  int? spare_multi_selection;

  CreateUnitOfMeasurementModel({
    this.name,
    this.decimal_status,
    this.spare_multi_selection,
  });

  factory CreateUnitOfMeasurementModel.fromJson(Map<String, dynamic> json) =>
      CreateUnitOfMeasurementModel(
        name: json['name'],
        decimal_status: json['decimal_status'],
        spare_multi_selection: json['spare_multi_selection'],
        
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "decimal_status": decimal_status,
        "spare_multi_selection": spare_multi_selection,
      };
}
