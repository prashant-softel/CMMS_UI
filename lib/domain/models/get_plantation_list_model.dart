import 'dart:convert';

List<GetPlantationList> GetPlantationListModelFromJson(String str) =>
    List<GetPlantationList>.from(
        json.decode(str).map(GetPlantationList.fromJson));

String GetPlantationListModelToJson(List<GetPlantationList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetPlantationList {
  int? id;
  String? date;
  String? month_name;
  int? month_id;
  int? saplingsPlanted;
  int? saplingsSurvived;
  int? saplingsDied;
  int? status;
  int? createdBy;
  String? createdAt;
  int? updatedBy;
  String? updatedAt;
  int? year;
  String? submited_by;

  int? upsaplingsSurviveddBy;
  GetPlantationList({
    this.id,
    this.date,
    this.month_name,
    this.month_id,
    this.saplingsPlanted,
    this.saplingsSurvived,
    this.saplingsDied,
    this.status,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
    this.year,
    this.submited_by,
  });

  factory GetPlantationList.fromJson(Map<String, dynamic> json) {
    return GetPlantationList(
      id: json['id'],
      date: json['date'],
      month_name: json['month_name'],
      month_id: json['month_id'],
      saplingsPlanted: json['saplingsPlanted'],
      saplingsSurvived: json['saplingsSurvived'],
      saplingsDied: json['saplingsDied'],
      status: json['status'],
      createdBy: json['createdBy'],
      createdAt: json['createdAt'],
      updatedBy: json['updatedBy'],
      updatedAt: json['updatedAt'],
      submited_by: json['submited_by'],
      year: json['year'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'month_name': month_name,
        'month_id': month_id,
        'saplingsPlanted': saplingsPlanted,
        'saplingsSurvived': saplingsSurvived,
        'saplingsDied': saplingsDied,
        'status': status,
        'createdBy': createdBy,
        'createdAt': createdAt,
        'updatedBy': updatedBy,
        'updatedAt': updatedAt,
        'submited_by': submited_by,
        'year': year,
      };
}
