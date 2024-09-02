import 'dart:convert';

CreateFuelDataModel CreateFuelDataModelFromJson(String str) =>
    CreateFuelDataModel.fromJson(json.decode(str));

class CreateFuelDataModel {
  int ? id;
  int? DieselConsumedForVehicles;
  int? PetrolConsumedForVehicles;
  int? PetrolConsumedForGrassCuttingAndMovers;
  int? DieselConsumedAtSite;
  int? PetrolConsumedAtSite;
  int? month_id;

  CreateFuelDataModel({
    this.id,
    this.DieselConsumedForVehicles,
    this.PetrolConsumedForVehicles,
    this.PetrolConsumedForGrassCuttingAndMovers,
    this.DieselConsumedAtSite,
    this.PetrolConsumedAtSite,
    this.month_id,
  
  });

  factory CreateFuelDataModel.fromJson(Map<String, dynamic> json) {
    return CreateFuelDataModel(

      DieselConsumedForVehicles: json['DieselConsumedForVehicles'],
      PetrolConsumedForVehicles: json['PetrolConsumedForVehicles'],
      PetrolConsumedForGrassCuttingAndMovers: json['PetrolConsumedForGrassCuttingAndMovers'],
      DieselConsumedAtSite: json['DieselConsumedAtSite'],
      id: json['id'],
      PetrolConsumedAtSite: json['PetrolConsumedAtSite'],
      month_id: json['month_id'],
    );
  }
  Map<String, dynamic> toJson() => {
        "DieselConsumedForVehicles": DieselConsumedForVehicles,
        "PetrolConsumedForVehicles": PetrolConsumedForVehicles,
        "PetrolConsumedForGrassCuttingAndMovers": PetrolConsumedForGrassCuttingAndMovers,
        "DieselConsumedAtSite": DieselConsumedAtSite,
        "id": id,
        "PetrolConsumedAtSite": PetrolConsumedAtSite,
        "month_id": month_id,
      };
}
