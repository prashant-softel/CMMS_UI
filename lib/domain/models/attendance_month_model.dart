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
        attendance: json["attendance"] != null
            ? List<Employee>.from(
                json["attendance"].map((x) => Employee.fromJson(x)),
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        "facility_id": facility_id,
        "facility_name": facility_name,
        "attendance": attendance != null
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
        employeeId: json["employee_id"],
        employeeName: json["employee_name"],
        dateOfJoining: json["date_of_joining"],
        dateOfExit: json["date_of_exit"],
        workingStatus: json["working_status"],
        details: json["details"] != null
            ? List<Details>.from(
                json["details"].map((x) => Details.fromJson(x)),
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        "employee_id": employeeId,
        "employee_name": employeeName,
        "date_of_joining": dateOfJoining,
        "date_of_exit": dateOfExit,
        "working_status": workingStatus,
        "details": details != null
            ? List<dynamic>.from(
                details!.map((x) => x.toJson()),
              )
            : null,
      };
}

class Details {
  String? date;
  String? status;
  String? inTime;
  String? outTime;

  Details({
    this.date,
    this.status,
    this.inTime,
    this.outTime,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        date: json["date"],
        status: json["status"],
        inTime: json["in_time"],
        outTime: json["out_time"],
      );
  Map<String, dynamic> toJson() => {
        "date": date,
        "status": status,
        "in_time": inTime,
        "out_time": outTime,
      };
}
