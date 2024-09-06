import 'dart:convert';

List<GetFuelDataList> GetFuelDataListModelFromJson(String str) =>
    List<GetFuelDataList>.from(
        json.decode(str).map(GetFuelDataList.fromJson));

String GetFuelDataListModelToJson(List<GetFuelDataList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetFuelDataList {
  int? id;
  int? dieselConsumedForVehicles;
  int? status;
  String? updatedAt;
  String? createdAt;
  int? createdBy;
  String? date;
  int? petrolConsumedForVehicles;
  int? petrolConsumedForGrassCuttingAndMovers;
  int? dieselConsumedAtSite;
  int? petrolConsumedAtSite;
  int? month_id;
  String? month_name;
  int? updatedBy;
  int? year;
  String? submited_by;
  GetFuelDataList({
    this.id,
    this.dieselConsumedForVehicles,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.date,
    this.petrolConsumedForVehicles,
    this.petrolConsumedForGrassCuttingAndMovers,
    this.dieselConsumedAtSite,
    this.petrolConsumedAtSite,
    this.month_id,
    this.month_name,
    this.updatedBy,
    this.year,
  this.submited_by,
  });

  factory GetFuelDataList.fromJson(Map<String, dynamic> json) {
    return GetFuelDataList(
      id: json['id'],
      dieselConsumedForVehicles: json['dieselConsumedForVehicles'],
      status: json['status'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
      date: json['date'],
      petrolConsumedForVehicles: json['petrolConsumedForVehicles'],
      petrolConsumedForGrassCuttingAndMovers: json['petrolConsumedForGrassCuttingAndMovers'],
      dieselConsumedAtSite: json['dieselConsumedAtSite'],
      petrolConsumedAtSite: json['petrolConsumedAtSite'],
      month_id: json['month_id'],
      month_name: json['month_name'],
      updatedBy: json['updatedBy'],
      year: json['year'],
      submited_by: json['submited_by'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'dieselConsumedForVehicles': dieselConsumedForVehicles,
        'status': status,
        'updatedAt': updatedAt,
        'createdAt': createdAt,
        'date': date,
        'petrolConsumedForVehicles': petrolConsumedForVehicles,
        'petrolConsumedForGrassCuttingAndMovers': petrolConsumedForGrassCuttingAndMovers,
        'dieselConsumedAtSite': dieselConsumedAtSite,
        'petrolConsumedAtSite': petrolConsumedAtSite,
        'month_id': month_id,
        'month_name': month_name,
        'updatedBy': updatedBy,
        'year': year,
        'submited_by': submited_by,
      };
}
