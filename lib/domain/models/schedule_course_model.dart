class ScheduleTrainingCourse {
  ScheduleTrainingCourse({
    this.courseId,
    this.courseName,
    this.comment,
    this.dateOfTraining,
    this.trainerName,
    this.trainingAgencyId,
    this.hfeEmployeeId,
    this.mode,
    this.venue,
    this.internalEmployees,
    this.externalEmployees,
    this.uploadfile_ids,
    this.facility_id,
  });

  int? courseId;
  String? courseName;
  String? comment;
  int? trainingAgencyId;
  String? dateOfTraining;
  String? venue;
  String? trainerName;
  int? hfeEmployeeId;
  String? mode;
  List<InternalEmployee>? internalEmployees;
  List<ExternalEmployees>? externalEmployees;
  List<dynamic>? uploadfile_ids;
  int? facility_id;

  factory ScheduleTrainingCourse.fromJson(Map<String, dynamic> json) =>
      ScheduleTrainingCourse(
        courseId: json["courseId"],
        courseName: json["courseName"],
        comment: json["comment"],
        dateOfTraining: json["date_of_training"],
        trainerName: json["trainerName"],
        trainingAgencyId: json["trainingAgencyId"],
        venue: json["venue"],
        mode: json['mode'],
        hfeEmployeeId: json["hfeEmployeeId"],
        facility_id: json['facility_id'],
        internalEmployees: json["internalEmployees"] != null
            ? List<InternalEmployee>.from(
                json["internalEmployees"].map(
                  (x) => InternalEmployee.fromJson(x),
                ),
              )
            : [],
        externalEmployees: json["externalEmployees"] != null
            ? List<ExternalEmployees>.from(
                json["externalEmployees"].map(
                  (x) => ExternalEmployees.fromJson(x),
                ),
              )
            : [],
      );

  Map<String, dynamic> toJson() => {
        "courseId": courseId,
        "courseName": courseName,
        "comment": comment,
        "date_of_training": dateOfTraining,
        "trainerName": trainerName,
        "trainingAgencyId": trainingAgencyId,
        "hfeEmployeeId": hfeEmployeeId,
        "venue": venue,
        'mode': mode,
        "facility_id": facility_id,
        "internalEmployees": internalEmployees,
        "externalEmployees": externalEmployees,
        "uploadfile_ids": uploadfile_ids,
      };
}

class InternalEmployee {
  int? empId;
  String? empName;
  String? empEmail;
  String? empNumber;
  String? empDesignation;

  InternalEmployee({
    this.empId,
    this.empName,
    this.empEmail,
    this.empNumber,
    this.empDesignation,
  });

  factory InternalEmployee.fromJson(Map<String, dynamic> json) =>
      InternalEmployee(
        empId: json["empId"],
        empName: json["empName"],
        empEmail: json["empEmail"],
        empNumber: json["empNumber"],
        empDesignation: json["empDesignation"],
      );

  Map<String, dynamic> toJson() => {
        "empId": empId,
        "empName": empName,
        "empEmail": empEmail,
        "empNumber": empNumber,
        "empDesignation": empDesignation,
      };
}

class ExternalEmployees {
  String? employeeName;
  String? employeeEmail;
  String? employeeNumber;
  String? designation;
  String? companyName;

  ExternalEmployees({
    this.employeeName,
    this.employeeEmail,
    this.employeeNumber,
    this.designation,
    this.companyName,
  });

  factory ExternalEmployees.fromJson(Map<String, dynamic> json) =>
      ExternalEmployees(
        employeeName: json["employeeName"],
        employeeEmail: json["employeeEmail"],
        employeeNumber: json["employeeNumber"],
        designation: json["designation"],
        companyName: json["companyName"],
      );

  Map<String, dynamic> toJson() => {
        "employeeName": employeeName,
        "employeeEmail": employeeEmail,
        "employeeNumber": employeeNumber,
        "designation": designation,
        "companyName": companyName,
      };
}
