import 'dart:convert';

List<AttendanceListModel> AttendanceListModelFromJson(String str) =>
    List<AttendanceListModel>.from(
        json.decode(str).map((x) => AttendanceListModel.fromJson(x)));

class AttendanceListModel {
  int? facility_id;
  int? month_id;
  String? month_name;
  int? year;
  List<MonthData>? month_data;

  AttendanceListModel({
    this.facility_id,
    this.month_id,
    this.month_name,
    this.year,
    this.month_data,
  });

  factory AttendanceListModel.fromJson(Map<String, dynamic> json) =>
      AttendanceListModel(
        facility_id: json["facility_id"],
        month_id: json["month_id"],
        month_name: json["month_name"],
        year: json["years"],
        month_data: json["month_data"] != null
            ? List<MonthData>.from(
                json["month_data"].map(
                  (x) => MonthData.fromJson(x),
                ),
              )
            : [],
      );
}

class MonthData {
  int? date;
  int? hfe_employees;
  int? less_than_35;
  int? between_30_to_50;
  int? greater_than_50;

  MonthData({
    this.date = 0,
    this.hfe_employees = 0,
    this.less_than_35 = 0,
    this.between_30_to_50 = 0,
    this.greater_than_50 = 0,
  });

  factory MonthData.fromJson(Map<String, dynamic> json) => MonthData(
        date: DateTime.parse(json['date']).day,
        hfe_employees: json['hfe_employees'],
        less_than_35: json['age_lessthan_35'],
        between_30_to_50: json['age_Between_35_50'],
        greater_than_50: json['age_Greater_50'],
      );
}
