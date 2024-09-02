import 'dart:convert';

CreateKaizensModel CreateKaizensModelFromJson(String str) =>
    CreateKaizensModel.fromJson(json.decode(str));

class CreateKaizensModel {
  int ? id;
  int? KaizensImplemented;
  int? CostForImplementation;
  int? CostSavedFromImplementation;
  int? month_id;

  CreateKaizensModel({
    this.id,
  this.KaizensImplemented,
  this.CostForImplementation,
  this.CostSavedFromImplementation,
  this.month_id,

  });

  factory CreateKaizensModel.fromJson(Map<String, dynamic> json) {
    return CreateKaizensModel(

      KaizensImplemented: json['KaizensImplemented'],
      CostForImplementation: json['CostForImplementation'],
      CostSavedFromImplementation: json['CostSavedFromImplementation'],
      id: json['id'],
      month_id: json['month_id'],
    );
  }
  Map<String, dynamic> toJson() => {
        "KaizensImplemented": KaizensImplemented,
        "CostForImplementation": CostForImplementation,
        "CostSavedFromImplementation": CostSavedFromImplementation,
        "id": id,
        "month_id": month_id,
      };
}
