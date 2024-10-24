import 'dart:convert';

CreatePermitModel addCreatePermitModelFromJson(String str) =>
    CreatePermitModel.fromJson(json.decode(str));

String addCreatePermitModelToJson(CreatePermitModel data) =>
    json.encode(data.toJson());

class CreatePermitModel {
  int? permit_id;
  int? facility_id;
  int? blockId;
  int? job_type_id;
  int? lotoId;
  int? latitude;
  int? longitude;
  int? permitTypeId;
  int? sop_type_id;
  int? issuer_id;
  int? approver_id;
  int? user_id;
  bool? is_loto_required;
  bool? resubmit;

  String? start_datetime;
  String? end_datetime;
  String? description;
  String? comment;
  String? title;
  List<LotoList>? Loto_list;
  List<LotoOtherDetails>? lotoOtherDetails;

  List<Employeelist?>? employee_list;
  List<Safetyquestionlist>? safety_question_list;
  List<int?>? block_ids;
  List<int?>? category_ids;
  List<dynamic>? uploadfile_ids;
  List<dynamic>? uploadfile_tbt;
  List<int?>? isolated_category_ids;
  int? TBT_Done_by;
  String? TBT_Done_at;
  String? PHYSICAL_ISO_REMARK;
  bool? is_physical_iso_required;

  CreatePermitModel(
      {this.permit_id,
      this.Loto_list,
      this.lotoOtherDetails,
      this.approver_id,
      this.blockId,
      this.block_ids,
      this.latitude,
      this.longitude,
      this.category_ids,
      this.uploadfile_ids,
      this.description,
      this.title,
      this.employee_list,
      this.end_datetime,
      this.facility_id,
      this.is_loto_required,
      this.resubmit,
      this.isolated_category_ids,
      this.issuer_id,
      this.lotoId,
      this.safety_question_list,
      this.sop_type_id,
      this.start_datetime,
      this.permitTypeId,
      this.user_id,
      this.job_type_id,
      this.TBT_Done_by,
      this.TBT_Done_at,
      this.PHYSICAL_ISO_REMARK,
      this.uploadfile_tbt,
      this.is_physical_iso_required,
      this.comment});

  factory CreatePermitModel.fromJson(Map<String, dynamic> json) =>
      CreatePermitModel(
        permit_id: json['permit_id'],
        uploadfile_tbt: json['uploadfile_tbt'],
        approver_id: json["approver_id"],
        issuer_id: json["issuer_id"],
        comment: json["comment"],
        lotoOtherDetails: json["lotoOtherDetails"] != null
            ? List<LotoOtherDetails>.from(json["lotoOtherDetails"]
                ?.map((x) => LotoOtherDetails.fromJson(x)))
            : [],
        facility_id: json["facility_id"],
        blockId: json["blockId"],
        job_type_id: json["job_type_id"],
        latitude: json['latitude'] ?? '',
        longitude: json['longitude'] ?? '',
        lotoId: json["lotoId"],
        permitTypeId: json["permitTypeId"],
        sop_type_id: json["sop_type_id"],
        user_id: json["user_id"],
        start_datetime: json["start_datetime"] ?? json['startDate'],
        end_datetime: json["end_datetime"] ?? json['tillDate'],
        TBT_Done_at: json['TBT_Done_at'],
        description: json["description"],
        title: json["title"],
        is_loto_required: json["is_loto_required"],
        resubmit: json['resubmit'],
        Loto_list: json["Loto_list"] != null
            ? List<LotoList>.from(
                json["Loto_list"]?.map((x) => LotoList.fromJson(x)))
            : [],
        employee_list: json["employee_list"] != null
            ? List<Employeelist>.from(
                json["employee_list"].map((x) => Employeelist.fromJson(x)))
            : [],
        safety_question_list: json["safety_question_list"] != null
            ? List<Safetyquestionlist>.from(json["safety_question_list"]
                .map((x) => Safetyquestionlist.fromJson(x)))
            : [],
        block_ids: json["block_ids"] != null
            ? List<int>.from(json["block_ids"].map((x) => x))
            : [],
        isolated_category_ids: json["isolated_category_ids"] != null
            ? List<int>.from(json["isolated_category_ids"].map((x) => x))
            : [],
        category_ids: json["category_ids"] != null
            ? List<int>.from(json["category_ids"].map((x) => x))
            : [],
        uploadfile_ids: json["uploadfile_ids"] != null
            ? List<int>.from(json["uploadfile_ids"].map((x) => x))
            : [],
        TBT_Done_by: json['TBT_Done_by'],
        PHYSICAL_ISO_REMARK: json['PHYSICAL_ISO_REMARK'],
        is_physical_iso_required: json['is_physical_iso_required'] ?? true,
      );

  Map<String, dynamic> toJson() => {
        "permit_id": permit_id,
        "uploadfile_tbt": uploadfile_tbt,
        "comment": comment,
        "approver_id": approver_id,
        "issuer_id": issuer_id,
        "facility_id": facility_id,
        "blockId": blockId,
        "latitude": latitude,
        "job_type_id": job_type_id,
        "lotoId": lotoId,
        "permitTypeId": permitTypeId,
        "sop_type_id": sop_type_id,
        "user_id": user_id,
        "start_datetime": start_datetime,
        "end_datetime": end_datetime,
        "TBT_Done_at": TBT_Done_at,
        "description": description,
        "title": title,
        "is_loto_required": is_loto_required,
        "resubmit": resubmit,
        "Loto_list": List<dynamic>.from(Loto_list!.map((x) => x.toJson())),
        "lotoOtherDetails":
            List<dynamic>.from(lotoOtherDetails!.map((x) => x.toJson())),
        "employee_list": List<dynamic>.from(employee_list!.map((x) => x)),
        "safety_question_list":
            List<dynamic>.from(safety_question_list!.map((x) => x)),
        "block_ids": List<dynamic>.from(block_ids!.map((x) => x)),
        "isolated_category_ids":
            List<dynamic>.from(isolated_category_ids!.map((x) => x)),
        "category_ids": List<dynamic>.from(category_ids!.map((x) => x)),
        "uploadfile_ids": List<dynamic>.from(uploadfile_ids!.map((x) => x)),
        "TBT_Done_by": TBT_Done_by,
        "PHYSICAL_ISO_REMARK": PHYSICAL_ISO_REMARK,
        "is_physical_iso_required": is_physical_iso_required,
      };
}

class LotoList {
  LotoList({
    this.Loto_id,
    this.Loto_Key,
    this.Loto_lock_number,
    this.user_id,
  });

  int? Loto_id;
  String? Loto_Key;
  String? Loto_lock_number;
  int? user_id;

  factory LotoList.fromJson(Map<String, dynamic> json) => LotoList(
        Loto_Key: json["Loto_Key"],
        Loto_id: json["Loto_id"],
        Loto_lock_number: json["Loto_lock_number"],
        user_id: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "Loto_Key": Loto_Key,
        "Loto_id": Loto_id,
        "Loto_lock_number": Loto_lock_number,
        "user_id": user_id,
      };
}

class LotoOtherDetails {
  LotoOtherDetails({
    this.employee_name,
    this.contact_number,
    this.responsibility,
  });

  int? contact_number;
  String? employee_name;
  String? responsibility;

  factory LotoOtherDetails.fromJson(Map<String, dynamic> json) =>
      LotoOtherDetails(
          employee_name: json["employee_name"],
          contact_number: json["contact_number"],
          responsibility: json['responsibility']);

  Map<String, dynamic> toJson() => {
        "employee_name": employee_name,
        "contact_number": contact_number,
        "responsibility": responsibility
      };
}

class Employeelist {
  Employeelist({
    this.employeeId,
    this.responsibility,
  });

  int? employeeId;
  // List<Responsibility>? responsibility;
  String? responsibility;

  factory Employeelist.fromJson(Map<String, dynamic> json) => Employeelist(
        responsibility: json["responsibility"],
        // != null
        //     ? List<Responsibility>.from(
        //         json["responsibility"]?.map((x) => Responsibility.fromJson(x)))
        //     : [],
        employeeId: json["employeeId"],
      );

  Map<String, dynamic> toJson() => {
        "responsibility": responsibility,
        // List<dynamic>.from(responsibility!.map((x) => x.toJson())),
        "employeeId": employeeId,
      };
}

class Responsibility {
  Responsibility({
    this.id,
    this.name,
    this.since,
    this.experianceYears,
  });

  int? id;
  String? name;
  String? since;
  int? experianceYears;

  factory Responsibility.fromJson(Map<String, dynamic> json) => Responsibility(
        id: json["id"],
        name: json["name"],
        since: json['since'],
        experianceYears: json['experianceYears'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "since": since,
        "experianceYears": experianceYears
      };
}

class Safetyquestionlist {
  Safetyquestionlist({
    this.safetyMeasureId,
    this.safetyMeasureValue,
    this.ischeck,
  });

  int? safetyMeasureId;
  String? safetyMeasureValue;
  int? ischeck;

  factory Safetyquestionlist.fromJson(Map<String, dynamic> json) =>
      Safetyquestionlist(
        safetyMeasureValue: json["safetyMeasureValue"],
        safetyMeasureId: json["safetyMeasureId"],
        ischeck: json["ischeck"],
      );

  Map<String, dynamic> toJson() => {
        "safetyMeasureValue": safetyMeasureValue,
        "safetyMeasureId": safetyMeasureId,
        "ischeck": ischeck,
      };
}

String addsafetyToJson(Safetyquestionlist data) => json.encode(data.toJson());

String addEmploylistToJson(Employeelist data) => json.encode(data.toJson());

String addLotolistToJson(LotoList data) => json.encode(data.toJson());
