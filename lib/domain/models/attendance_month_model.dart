import 'package:cmms/app/utils/utility.dart';

class AttendanceMonthModel {
  int? facility_id;
  String? facility_name;
  List<Employee>? attendance;

  AttendanceMonthModel({
    this.facility_id,
    this.facility_name,
    this.attendance,
  });

  factory AttendanceMonthModel.fromJson(Map<String, dynamic> json) =>
      AttendanceMonthModel(
        facility_id: json["facility_id"],
        facility_name: json["facility_name"],
        attendance: json["result"] != null
            ? List<Employee>.from(
                json["result"].map((x) => Employee.fromJson(x)),
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        "facility_id": facility_id,
        "facility_name": facility_name,
        "result": attendance != null
            ? List<dynamic>.from(
                attendance!.map((x) => x.toJson()),
              )
            : null,
      };
}

class Employee {
  int? employeeId;
  String? employeeName;
  String? dateOfJoining;
  String? dateOfExit;
  String? workingStatus;
  List<Details>? details;

  Employee({
    this.employeeId,
    this.employeeName,
    this.dateOfJoining,
    this.dateOfExit,
    this.workingStatus,
    this.details,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        employeeId: json["employeeId"],
        employeeName: json["employeeName"],
        dateOfJoining: Utility.getFormatedyearMonthDay(json["dateOfJoining"]),
        dateOfExit: Utility.getFormatedyearMonthDay(json["dateofExit"]),
        workingStatus: json["workingStatus"],
        details: json["details"] != null
            ? List<Details>.from(
                json["details"].map((x) => Details.fromJson(x)),
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        "employeeId": employeeId,
        "employeeName": employeeName,
        "dateOfJoining": dateOfJoining,
        "dateofExit": dateOfExit,
        "workingStatus": workingStatus,
        "details": details != null
            ? List<dynamic>.from(
                details!.map((x) => x.toJson()),
              )
            : null,
      };
}

class Details {
  int? emp_id;
  String? date;
  String? status;
  String? inTime;
  String? outTime;

  Details({
    this.emp_id,
    this.date,
    this.status,
    this.inTime,
    this.outTime,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        emp_id: json["emp_id"],
        date: Utility.getFormatedayMonthYear(json["date"]),
        status: json["status"] == 1 ? "P" : "A",
        inTime: json["inTime"],
        outTime: json["outTime"],
      );
  Map<String, dynamic> toJson() => {
        "emp_id": emp_id,
        "date": date,
        "status": status,
        "inTime": inTime,
        "outTime": outTime,
      };
}
