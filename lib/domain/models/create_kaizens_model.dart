import 'dart:convert';

CreateKaizensModel CreateKaizensModelFromJson(String str) =>
    CreateKaizensModel.fromJson(json.decode(str));

class CreateKaizensModel {
  int ? id;
  int? KaizensImplemented;
  int? CostForImplementation;
  int? CostSavedFromImplementation;
  int? month_id;
  int? year;


  CreateKaizensModel({
    this.id,
  this.KaizensImplemented,
  this.CostForImplementation,
  this.CostSavedFromImplementation,
  this.month_id,
  this.year,

  });

  factory CreateKaizensModel.fromJson(Map<String, dynamic> json) {
    return CreateKaizensModel(

      KaizensImplemented: json['KaizensImplemented'],
      CostForImplementation: json['CostForImplementation'],
      CostSavedFromImplementation: json['CostSavedFromImplementation'],
      id: json['id'],
      month_id: json['month_id'],
      year: json['year'],
    );
  }
  Map<String, dynamic> toJson() => {
        "KaizensImplemented": KaizensImplemented,
        "CostForImplementation": CostForImplementation,
        "CostSavedFromImplementation": CostSavedFromImplementation,
        "id": id,
        "month_id": month_id,
        "year": year,
      };
}
