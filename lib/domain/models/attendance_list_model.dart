import 'dart:convert';

List<AttendanceListModel> AttendanceListModelFromJson(String str) =>
    List<AttendanceListModel>.from(
        json.decode(str).map((x) => AttendanceListModel.fromJson(x)));

class AttendanceListModel {
  int? month_id;
  String? month_name;
  int? year;
  List<MonthData>? month_data;

  AttendanceListModel({
    this.month_id,
    this.month_name,
    this.year,
    this.month_data,
  });

  factory AttendanceListModel.fromJson(Map<String, dynamic> json) =>
      AttendanceListModel(
        month_id: json["month_id"],
        month_name: json["month_name"],
        year: json["year"],
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
    this.date,
    this.hfe_employees,
    this.less_than_35,
    this.between_30_to_50,
    this.greater_than_50,
  });

  factory MonthData.fromJson(Map<String, dynamic> json) => MonthData(
        date: json["date"],
        hfe_employees: json['hfe_employees'],
        less_than_35: json['less_than_35'],
        between_30_to_50: json['between_30_to_50'],
        greater_than_50: json['greater_than_50'],
      );
}
