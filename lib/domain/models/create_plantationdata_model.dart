import 'dart:convert';

CreatePlantationDataModel CreatePlantationDataModelFromJson(String str) =>
    CreatePlantationDataModel.fromJson(json.decode(str));

class CreatePlantationDataModel {
  int? id;
  int? SaplingsPlanted;
  int? SaplingsSurvived;
  int? SaplingsDied;
  int? month_id;
  int? year;

  CreatePlantationDataModel({
    this.id,
    this.SaplingsPlanted,
    this.SaplingsSurvived,
    this.SaplingsDied,
    this.month_id,
    this.year,
  });

  factory CreatePlantationDataModel.fromJson(Map<String, dynamic> json) {
    return CreatePlantationDataModel(
      SaplingsPlanted: json['SaplingsPlanted'],
      SaplingsSurvived: json['SaplingsSurvived'],
      SaplingsDied: json['SaplingsDied'],
      id: json['id'],
      month_id: json['month_id'],
      year: json['year'],
    );
  }
  Map<String, dynamic> toJson() => {
        "SaplingsPlanted": SaplingsPlanted,
        "SaplingsSurvived": SaplingsSurvived,
        "SaplingsDied": SaplingsDied,
        "id": id,
        "month_id": month_id,
        "year": year,
      };
}
