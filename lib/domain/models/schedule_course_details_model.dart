class ScheduleCourseDetails {
  int? scheduleId;
  int? facility_id;
  String? date_of_Training;
  String? training_course;
  String? trainer;
  String? mode;
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
    this.trainer,
    this.mode,
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
        date_of_Training: json["date_of_Trainig"],
        training_course: json["training_course"],
        trainer: json["trainer"],
        mode: json["mode"],
        venue: json["venue"],
        training_agency: json["training_Agency"],
        hfe_Employee: json["hfE_Epmloyee"],
        internal_employee: json["internal_employee"] != null
            ? List<Employee>.from(
                json["internal_employee"].map((x) => Employee.fromJson(x)),
              )
            : [],
        external_employee: json["external_employee"] != null
            ? List<Employee>.from(
                json["external_employee"].map((x) => Employee.fromJson(x)),
              )
            : [],
      );
}

class Employee {
  int? id;
  String? name;
  String? email;
  int? mobile;
  int? attendend;
  String? rsvp;
  String? notes;

  Employee({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.attendend,
    this.rsvp,
    this.notes,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        attendend: json["attendend"],
        rsvp: json["rsvp"],
        notes: json["notes"],
      );
}
