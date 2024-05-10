import "package:get/get.dart";

class AttendaceModel {
  String? date;
  List<HFEEmployeeAttendance?>? hfeAttendance;
  ContractLabourAttendance? contractAttendance;

  AttendaceModel({
    this.date,
    this.hfeAttendance,
    this.contractAttendance,
  });

  factory AttendaceModel.fromJson(Map<String, dynamic> json) => AttendaceModel(
        date: json["date"],
        hfeAttendance: json["hfeAttendance"]!= null
           ? [HFEEmployeeAttendance.fromJson(json["hfeAttendance"])]
            : [],
        contractAttendance: json["contractAttendance"]!= null
           ? ContractLabourAttendance.fromJson(json["contractAttendance"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "hfeAttendance": hfeAttendance?.map((e) => e?.toJson()).toList(),
        "contractAttendance": contractAttendance?.toJson(),
      };
}

class HFEEmployeeAttendance {
  int? id;
  String? name;
  RxBool present;
  String? date;
  String? inTime;
  String? outTime;

  HFEEmployeeAttendance({
    this.id,
    this.name,
    required this.present,
    this.date,
    this.inTime,
    this.outTime,
  });

  factory HFEEmployeeAttendance.fromJson(Map<String, dynamic> json) =>
      HFEEmployeeAttendance(
        id: json["id"],
        name: json["name"],
        present: json["present"],
        date: json["date"],
        inTime: json["inTime"],
        outTime: json["outTime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "present": present,
        "date": date,
        "inTime": inTime,
        "outTime": outTime,
      };
}

class ContractLabourAttendance {
  int? lessThan35;
  int? between35to50;
  int? greaterThan50;
  String? purpose;

  ContractLabourAttendance({
    this.lessThan35,
    this.between35to50,
    this.greaterThan50,
    this.purpose,
  });

  factory ContractLabourAttendance.fromJson(Map<String, dynamic> json) =>
      ContractLabourAttendance(
        lessThan35: json["lessThan35"],
        between35to50: json["between35to50"],
        greaterThan50: json["greaterThan50"],
        purpose: json["purpose"],
      );

  Map<String, dynamic> toJson() => {
        "lessThan35": lessThan35,
        "between35to50": between35to50,
        "greaterThan50": greaterThan50,
        "purpose": purpose,
      };
}