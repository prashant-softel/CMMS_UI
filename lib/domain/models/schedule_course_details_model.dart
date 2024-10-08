import 'package:cmms/app/app.dart';
import 'package:get/get.dart';

class ScheduleCourseDetails {
  int? scheduleId;
  int? facility_id;
  String? date_of_Training;
  String? training_course;
  String? trainer;
  String? mode;
  int? status;
  String? short_status;
  String? course_name;
  int? hfeEmployeeId;
  String? venue;
  String? training_agency;
  String? hfe_Employee;
  List<Employee>? internal_employee;
  List<Employee>? external_employee;

  ScheduleCourseDetails({
    this.scheduleId,
    this.facility_id,
    this.date_of_Training,
    this.training_course,
    this.hfeEmployeeId,
    this.course_name,
    this.trainer,
    this.mode,
    this.status,
    this.short_status,
    this.venue,
    this.training_agency,
    this.hfe_Employee,
    this.internal_employee,
    this.external_employee,
  });

  factory ScheduleCourseDetails.fromJson(Map<String, dynamic> json) =>
      ScheduleCourseDetails(
        scheduleId: json["scheduleID"],
        facility_id: json["facility_id"],
        date_of_Training: json["date_of_Trainig"] != null
            ? Utility.getFormattedYearMonthDayTime(json["date_of_Trainig"])
            : "",
        training_course: json["training_course"],
        course_name: json["course_name"],
        trainer: json["trainer"],
        hfeEmployeeId: json["hfeEmployeeId"],
        mode: json["mode"],
        status: json["status"],
        short_status: json["short_status"],
        venue: json["venue"],
        training_agency: json["training_Agency"],
        hfe_Employee: json["hfE_Epmloyee"],
        internal_employee: json["internal_employee"] != null
            ? List<Employee>.from(
                json["internal_employee"].map((x) => Employee.fromJson(x)))
            : [],
        external_employee: json["external_employee"] != null
            ? List<Employee>.from(
                json["external_employee"].map((x) => Employee.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        'scheduleID': scheduleId,
        'facility_id': facility_id,
        'date_of_Trainig': date_of_Training,
        'training_course': training_course,
        'course_name': course_name,
        'trainer': trainer,
        'hfeEmployeeId': hfeEmployeeId,
        'mode': mode,
        'status': status,
        'short_status': short_status,
        'venue': venue,
        'training_Agency': training_agency,
        'hfE_Epmloyee': hfe_Employee,
        'internal_employee': internal_employee?.map((e) => e.toJson()).toList(),
        'external_employee': external_employee?.map((e) => e.toJson()).toList(),
      };
}

class Employee {
  int? id;
  String? name;
  String? email;
  String? mobile; // Change mobile to String to accommodate larger numbers
  RxBool? attendend; // Corrected field name to 'attendend'
  String? designation;
  String? rsvp;
  String? notes;

  Employee({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.attendend,
    this.designation,
    this.rsvp,
    this.notes,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["employee_id"], // Change key from "id" to "employee_id"
        name: json["name"] ??
            json[
                "employeeName"], // Check for "name", fallback to "employeeName"
        email: json["email"] ??
            json[
                "employeeEmail"], // Check for "email", fallback to "employeeEmail"
        mobile: json["mobile"] ??
            json["employeeNumber"].toString(), // Adjusted mobile to string
        attendend: RxBool(json["attendend"] == 1), // Use 'attendend' from JSON
        designation: json["designation"],
        rsvp: json["rsvp"],
        notes: json["notes"],
      );

  Map<String, dynamic> toJson() => {
        'employee_id': id,
        'name': name,
        'email': email,
        'mobile': mobile,
        'attendend':
            attendend?.value == true ? 1 : 0, // Handle null and RxBool properly
        'designation': designation,
        'rsvp': rsvp,
        'notes': notes,
      };
}
