import 'dart:convert';

CreateOccupationalModel CreateOccupationalModelFromJson(String str) =>
    CreateOccupationalModel.fromJson(json.decode(str));

class CreateOccupationalModel {
  int ? id;
  // String? date;
  int? NoOfHealthExamsOfNewJoiner;
  int? PeriodicTests;
  int? OccupationalIllnesses;
  int? month_id;
  int? year;
  // int? CreatedBy;

  

  CreateOccupationalModel({
    this.id,
    this.NoOfHealthExamsOfNewJoiner,
    this.PeriodicTests,
    this.OccupationalIllnesses,
    this.month_id,
    this.year,
    // this.CreatedBy,
    // this.date,
  
  });

  factory CreateOccupationalModel.fromJson(Map<String, dynamic> json) {
    return CreateOccupationalModel(

      NoOfHealthExamsOfNewJoiner: json['NoOfHealthExamsOfNewJoiner'],
      PeriodicTests: json['PeriodicTests'],
      OccupationalIllnesses: json['OccupationalIllnesses'],
      // CreatedBy: json['CreatedBy'],
      id: json['id'],
      // date: json['Date'],
      month_id: json['month_id'],
      year: json['year'],
    );
  }
  Map<String, dynamic> toJson() => {
        "NoOfHealthExamsOfNewJoiner": NoOfHealthExamsOfNewJoiner,
        "PeriodicTests": PeriodicTests,
        "OccupationalIllnesses": OccupationalIllnesses,
        // "CreatedBy": CreatedBy,
        "id": id,
        // "Date": date,
        "month_id": month_id,
        "year": year,
      };
}
