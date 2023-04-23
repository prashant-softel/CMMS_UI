import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

CreatePermitModel addCreatePermitModelFromJson(String str) =>
    CreatePermitModel.fromJson(json.decode(str));

String addCreatePermitModelToJson(CreatePermitModel data) => json.encode(data.toJson());


class CreatePermitModel {
  int? facility_id;
  int? blockId;
  int? work_type_id;
  int? lotoId;
  int? typeId;
  int? sop_type_id;
  int? issuer_id;
  int? approver_id;
  int? user_id;
  bool? is_isolation_required;
  String? start_datetime;
  String? end_datetime;
  String? description;
  String? title;
  List<LotoList>? Loto_list;
  List<Employeelist?>? employee_list;
  List<Safetyquestionlist>? safety_question_list;
  List<int?>? block_ids;
  List<int?>? category_ids;
  List<int?>? isolated_category_ids;

   CreatePermitModel(
       {
      this.Loto_list,
      this.approver_id,
      this.blockId,
      this.block_ids,
      this.category_ids,
      this.description,
      this.title,
      this.employee_list,
      this.end_datetime,
      this.facility_id,
      this.is_isolation_required,
      this.isolated_category_ids,
      this.issuer_id,
      this.lotoId,
      this.safety_question_list,
      this.sop_type_id,
      this.start_datetime,
      this.typeId,
      this.user_id,
      this.work_type_id
       });

  factory CreatePermitModel.fromJson(Map<String, dynamic> json) =>
      CreatePermitModel(
        approver_id: json["approver_id"],
        issuer_id: json["issuer_id"],
        facility_id: json["facility_id"],
        blockId: json["blockId"],
        work_type_id: json["work_type_id"],
        lotoId: json["lotoId"],
        typeId: json["typeId"],
        sop_type_id: json["sop_type_id"],
        user_id: json["user_id"],
        start_datetime: json["start_datetime"],
        end_datetime: json["end_datetime"],
        description: json["description"],
        title: json["title"],
        is_isolation_required: json["is_isolation_required"],
        Loto_list: List<LotoList>.from(
            json["Loto_list"].map((x) => LotoList.fromJson(x))),
        employee_list: List<Employeelist>.from(
            json["employee_list"].map((x) => Employeelist.fromJson(x))),
        safety_question_list: List<Safetyquestionlist>.from(
            json["safety_question_list"]
                .map((x) => Safetyquestionlist.fromJson(x))),
        block_ids: List<int>.from(json["block_ids"].map((x) => x)),
        isolated_category_ids:
            List<int>.from(json["isolated_category_ids"].map((x) => x)),
        category_ids: List<int>.from(json["category_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "approver_id": approver_id,
        "issuer_id": issuer_id,
        "facility_id": facility_id,
        "block_id": blockId,
        "work_type_id": work_type_id,
        "lotoId": lotoId,
        "typeId": typeId,
        "sop_type_id": sop_type_id,
        "user_id": user_id,
        "start_datetime": start_datetime,
        "end_datetime": end_datetime,
        "description": description,
        "title": title,
        "is_isolation_required": is_isolation_required,
        "Loto_list": List<dynamic>.from(Loto_list!.map((x) => x.toJson())),
        "employee_list": List<dynamic>.from(employee_list!.map((x) => x)),
        "safety_question_list": List<dynamic>.from(safety_question_list!.map((x) => x)),
        "block_ids": List<dynamic>.from(block_ids!.map((x) => x)),
        "isolated_category_ids": List<dynamic>.from(isolated_category_ids!.map((x) => x)),
        "category_ids": List<dynamic>.from(category_ids!.map((x) => x)),



      };
}

class LotoList {
  LotoList({
    this.Loto_id,
    this.Loto_Key,
  });

  int? Loto_id;
  String? Loto_Key;

  factory LotoList.fromJson(Map<String, dynamic> json) => LotoList(
        Loto_Key: json["Loto_Key"],
        Loto_id: json["Loto_id"],
      );

  Map<String, dynamic> toJson() => {
        "Loto_Key": Loto_Key,
        "Loto_id": Loto_id,
      };
}

class Employeelist {
  Employeelist({
    this.employeeId,
    this.responsibility,
  });

  int? employeeId;
  String? responsibility;

  factory Employeelist.fromJson(Map<String, dynamic> json) => Employeelist(
        responsibility: json["responsibility"],
        employeeId: json["employeeId"],
      );

  Map<String, dynamic> toJson() => {
        "responsibility": responsibility,
        "employeeId": employeeId,
      };
}

class Safetyquestionlist {
  Safetyquestionlist({
    this.safetyMeasureId,
    this.safetyMeasureValue,
  });

  int? safetyMeasureId;
  String? safetyMeasureValue;

  factory Safetyquestionlist.fromJson(Map<String, dynamic> json) =>
      Safetyquestionlist(
        safetyMeasureValue: json["safetyMeasureValue"],
        safetyMeasureId: json["safetyMeasureId"],
      );

  Map<String, dynamic> toJson() => {
        "safetyMeasureValue": safetyMeasureValue,
        "safetyMeasureId": safetyMeasureId,
      };
}

String addsafetyToJson(Safetyquestionlist data) => json.encode(data.toJson());

String addEmploylistToJson(Employeelist data) => json.encode(data.toJson());

String addLotolistToJson(LotoList data) => json.encode(data.toJson());
