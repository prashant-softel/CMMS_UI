import "package:get/get.dart";

class AttendaceModel {
  String? date;
  int? facilityId;
  List<HFEEmployeeAttendance?>? hfeAttendance;
  ContractLabourAttendance? contractAttendance;

  AttendaceModel({
    this.date,
    this.facilityId,
    this.hfeAttendance,
    this.contractAttendance,
  });

  factory AttendaceModel.fromJson(Map<String, dynamic> json) => AttendaceModel(
        date: json["date"],
        facilityId: json["facility_id"],
        hfeAttendance: json["hfeAttendance"] != null
            ? List<HFEEmployeeAttendance>.from(json["hfeAttendance"]
                .map((x) => HFEEmployeeAttendance.fromJson(x)))
            : [],
        contractAttendance: json["contractAttendance"] != null
            ? ContractLabourAttendance.fromJson(json["contractAttendance"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "facility_id": facilityId,
        "hfeAttendance": hfeAttendance?.map((e) => e?.toJson()).toList(),
        "contractAttendance": contractAttendance?.toJson(),
      };
}

class HFEEmployeeAttendance {
  int? id;
  String? name;
  RxBool present;
  String? inTime;
  String? outTime;

  HFEEmployeeAttendance({
    this.id,
    this.name,
    required this.present,
    this.inTime,
    this.outTime,
  });

  factory HFEEmployeeAttendance.fromJson(Map<String, dynamic> json) =>
      HFEEmployeeAttendance(
        id: json["employee_id"],
        name: json["name"],
        present: RxBool(json["present"]),
        inTime: json["inTime"],
        outTime: json["outTime"],
      );

  Map<String, dynamic> toJson() => {
        "employee_id": id,
        "name": name,
        "present": present.value,
        "inTime": inTime,
        "outTime": outTime,
      };
}

class ContractLabourAttendance {
  int? contractor_id;
  int? lessThan35;
  int? between35to50;
  int? greaterThan50;
  String? purpose;

  ContractLabourAttendance({
    this.contractor_id = 0,
    this.lessThan35,
    this.between35to50,
    this.greaterThan50,
    this.purpose,
  });

  factory ContractLabourAttendance.fromJson(Map<String, dynamic> json) =>
      ContractLabourAttendance(
        contractor_id: json["contractor_id"],
        lessThan35: json["lessThan35"],
        between35to50: json["between35to50"],
        greaterThan50: json["greaterThan50"],
        purpose: json["purpose"],
      );

  Map<String, dynamic> toJson() => {
        "contractor_id": contractor_id,
        "lessThan35": lessThan35,
        "between35to50": between35to50,
        "greaterThan50": greaterThan50,
        "purpose": purpose,
      };
}
