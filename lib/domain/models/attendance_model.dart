import "package:get/get.dart";

class AttendaceModel {
  int? attendence_Id;
  String? date;
  int? facilityId;
  List<HFEEmployeeAttendance?>? hfeAttendance;
  ContractLabourAttendance? contractAttendance;

  AttendaceModel({
    this.attendence_Id,
    this.date,
    this.facilityId,
    this.hfeAttendance,
    this.contractAttendance,
  });

  factory AttendaceModel.fromJson(Map<String, dynamic> json) => AttendaceModel(
        attendence_Id: json["attendence_Id"],
        date: json["date"],
        facilityId: json["facility_id"],
        hfeAttendance: json["hfeAttendance"] != null
            ? List<HFEEmployeeAttendance>.from(json["hfeAttendance"]
                .map((x) => HFEEmployeeAttendance.fromJson(x)))
            : [],
        contractAttendance: json["contractAttendances"] != null
            ? ContractLabourAttendance.fromJson(json["contractAttendances"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "attendence_Id": attendence_Id,
        "date": date,
        "facility_id": facilityId,
        "hfeAttendance": hfeAttendance?.map((e) => e?.toJson()).toList(),
        "contractAttendance": contractAttendance?.toJson(),
      };
}

class HFEEmployeeAttendance {
  int? Attendence_Id;
  int? id;
  String? name;
  RxBool present;
  String? inTime;
  String? outTime;

  HFEEmployeeAttendance({
    this.Attendence_Id,
    this.id,
    this.name,
    required this.present,
    this.inTime,
    this.outTime,
  });

  factory HFEEmployeeAttendance.fromJson(Map<String, dynamic> json) =>
      HFEEmployeeAttendance(
        Attendence_Id: json["attendence_Id"],
        id: json["employee_id"],
        name: json["name"],
        present: RxBool(json["present"]),
        inTime: json["in_Time"],
        outTime: json["out_Time"],
      );

  Map<String, dynamic> toJson() => {
        "Attendence_Id": Attendence_Id,
        "employee_id": id,
        "name": name,
        "present": present.value,
        "inTime": inTime,
        "outTime": outTime,
      };
}

class ContractLabourAttendance {
  int? Id;
  int? lessThan35;
  int? between35to50;
  int? greaterThan50;
  String? purpose;

  ContractLabourAttendance({
    this.Id = 0,
    this.lessThan35,
    this.between35to50,
    this.greaterThan50,
    this.purpose,
  });

  factory ContractLabourAttendance.fromJson(Map<String, dynamic> json) =>
      ContractLabourAttendance(
        Id: json["Id"],
        lessThan35: json["age_Less_Than35"],
        between35to50: json["age_Between_35And50"],
        greaterThan50: json["age_Greater50"],
        purpose: json["purpose"],
      );

  Map<String, dynamic> toJson() => {
        "Id": Id,
        "lessThan35": lessThan35,
        "between35to50": between35to50,
        "greaterThan50": greaterThan50,
        "purpose": purpose,
      };
}
