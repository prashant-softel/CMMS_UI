import 'dart:convert';

List<GetOccupationalList> GetOccupationalListModelFromJson(String str) =>
    List<GetOccupationalList>.from(
        json.decode(str).map(GetOccupationalList.fromJson));

String GetOccupationalListModelToJson(List<GetOccupationalList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetOccupationalList {
  int? id;
  int? noOfHealthExamsOfNewJoiner;
  int? status;
  String? updatedAt;
  String? createdAt;
  int? createdBy;
  String? date;
  int? periodicTests;
  int? occupationalIllnesses;
  int? updatedBy;
  int? month_id;
  String? month_name;

  GetOccupationalList({
    this.id,
    this.noOfHealthExamsOfNewJoiner,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.date,
    this.periodicTests,
    this.occupationalIllnesses,
    this.updatedBy,
    this.month_id,
    this.month_name,
  });

  factory GetOccupationalList.fromJson(Map<String, dynamic> json) {
    return GetOccupationalList(
      id: json['id'],
      noOfHealthExamsOfNewJoiner: json['noOfHealthExamsOfNewJoiner'],
      status: json['status'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
      date: json['date'],
      periodicTests: json['periodicTests'],
      occupationalIllnesses: json['occupationalIllnesses'],
      updatedBy: json['updatedBy'],
      month_id: json['month_id'],
      month_name: json['month_name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'noOfHealthExamsOfNewJoiner': noOfHealthExamsOfNewJoiner,
        'status': status,
        'updatedAt': updatedAt,
        'createdAt': createdAt,
        'date': date,
        'periodicTests': periodicTests,
        'occupationalIllnesses': occupationalIllnesses,
        'updatedBy': updatedBy,
        'month_id': month_id,
        'month_name': month_name,
      };
}
