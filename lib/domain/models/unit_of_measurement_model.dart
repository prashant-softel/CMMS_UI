import 'dart:convert';

List<UnitOfMeasurementModel> unitOfMeasurementModelFromJson(String str) =>
    List<UnitOfMeasurementModel>.from(
        json.decode(str).map((x) => UnitOfMeasurementModel.fromJson(x)));

String unitOfMeasurementModelToJson(List<UnitOfMeasurementModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnitOfMeasurementModel {
  int? id;
  String? name;
  int? flag;
  int? decimal_status;
  int? spare_multi_selection;

  UnitOfMeasurementModel({
    this.id,
    this.name,
    this.flag,
    this.decimal_status,
    this.spare_multi_selection,
  });

  factory UnitOfMeasurementModel.fromJson(Map<String, dynamic> json) =>
      UnitOfMeasurementModel(
        id: json['id'],
        name: json['name'],
        flag: json['flag'],
        decimal_status: json['decimal_status'],
        spare_multi_selection: json['spare_multi_selection'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "flag": flag,
        "decimal_status": decimal_status,
        "spare_multi_selection": spare_multi_selection,
      };
}
