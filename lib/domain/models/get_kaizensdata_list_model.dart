import 'dart:convert';

List<GetKaizensDataList> GetKaizensDataListModelFromJson(String str) =>
    List<GetKaizensDataList>.from(
        json.decode(str).map(GetKaizensDataList.fromJson));

String GetKaizensDataListModelToJson(List<GetKaizensDataList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetKaizensDataList {
  int? id;
  // String? date;
  String? month_name;
  int? month_id;
  int? kaizensImplemented;
  int? costForImplementation;
  int? costSavedFromImplementation;
  int? status;
  int? createdBy;
  String? createdAt;
  int? updatedBy;
  int? year;
  String? updatedAt;
  String? submited_by;
  GetKaizensDataList({
    this.id,
    // this.date,
    this.month_name,
    this.month_id,
    this.kaizensImplemented,
    this.costForImplementation,
    this.costSavedFromImplementation,
    this.status,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
    this.year,
    this.submited_by,
  });

  factory GetKaizensDataList.fromJson(Map<String, dynamic> json) {
    return GetKaizensDataList(
      id: json['id'],
      // // date: json['date'],
      month_name: json['month_name'],
      month_id: json['month_id'],
      kaizensImplemented: json['kaizensImplemented'],
      costForImplementation: json['costForImplementation'],
      costSavedFromImplementation: json['costSavedFromImplementation'],
      status: json['status'],
      createdBy: json['createdBy'],
      createdAt: json['createdAt'],
      updatedBy: json['updatedBy'],
      updatedAt: json['updatedAt'],
      year: json['year'],
      submited_by: json['submited_by'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        // // 'date': date,
        'month_name': month_name,
        'month_id': month_id,
        'kaizensImplemented': kaizensImplemented,
        'costForImplementation': costForImplementation,
        'costSavedFromImplementation': costSavedFromImplementation,
        'status': status,
        'createdBy': createdBy,
        'createdAt': createdAt,
        'updatedBy': updatedBy,
        'updatedAt': updatedAt,
        'year': year,
        'submited_by': submited_by,
      };
}
