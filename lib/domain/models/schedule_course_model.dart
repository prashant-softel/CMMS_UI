class ScheduleTrainingCourse {
  ScheduleTrainingCourse({
    this.courseId,
    this.courseName,
    this.comment,
    this.dateOfTraining,
    this.trainerId,
    this.trainerName,
    this.trainingAgency,
    this.venue,
    this.internalEmployees,
    this.externalEmployees,
  });

  int? courseId;
  String? courseName;
  String? comment;
  String? dateOfTraining;
  String? trainerId;
  String? trainerName;
  String? trainingAgency;
  String? venue;
  List<InternalEmployee>? internalEmployees;
  List<ExternalEmployees>? externalEmployees;

  factory ScheduleTrainingCourse.fromJson(Map<String, dynamic> json) =>
      ScheduleTrainingCourse(
        courseId: json["courseId"],
        courseName: json["courseName"],
        comment: json["comment"],
        dateOfTraining: json["dateOfTraining"],
        trainerId: json["trainerId"],
        trainerName: json["trainerName"],
        trainingAgency: json["trainingAgency"],
        venue: json["venue"],
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
        "dateOfTraining": dateOfTraining,
        "trainerId": trainerId,
        "trainerName": trainerName,
        "trainingAgency": trainingAgency,
        "venue": venue,
        "internalEmployees": internalEmployees,
        "externalEmployees": externalEmployees,
      };
}

class InternalEmployee {
  int? empId;
  String? empName;
  String? empDesignation;

  InternalEmployee({
    this.empId,
    this.empName,
    this.empDesignation,
  });

  factory InternalEmployee.fromJson(Map<String, dynamic> json) =>
      InternalEmployee(
        empId: json["empId"],
        empName: json["empName"],
        empDesignation: json["empDesignation"],
      );

  Map<String, dynamic> toJson() => {
        "empId": empId,
        "empName": empName,
        "empDesignation": empDesignation,
      };
}

class ExternalEmployees {
  String? employeeName;
  String? employeeEmail;
  String? employeeNumber;

  ExternalEmployees({
    this.employeeName,
    this.employeeEmail,
    this.employeeNumber,
  });

  factory ExternalEmployees.fromJson(Map<String, dynamic> json) =>
      ExternalEmployees(
        employeeName: json["employeeName"],
        employeeEmail: json["employeeEmail"],
        employeeNumber: json["employeeNumber"],
      );

  Map<String, dynamic> toJson() => {
        "employeeName": employeeName,
        "employeeEmail": employeeEmail,
        "employeeNumber": employeeNumber,
      };
}
