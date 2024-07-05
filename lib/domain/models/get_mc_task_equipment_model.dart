import 'dart:convert';

List<GetMCTaskEquipmentList> equipmentTaskListModelFromJson(String str) =>
    List<GetMCTaskEquipmentList>.from(
        json.decode(str).map((x) => GetMCTaskEquipmentList.fromJson(x)));

String equipmentTaskListModelToJson(List<GetMCTaskEquipmentList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetMCTaskEquipmentList {
  int? invId;
  String? invName;
  int? moduleQuantity;
  List<SMBS> smbs;
  bool isExpanded;
  String? selectedDay;
  bool? isAbandonedChecked;
  bool? isCleanedChecked;

  GetMCTaskEquipmentList({
    this.invId,
    this.invName,
    this.moduleQuantity,
    this.smbs = const [],
    this.isExpanded = false,
    this.isAbandonedChecked = false,
    this.isCleanedChecked = false,
    this.selectedDay,
  });

  factory GetMCTaskEquipmentList.fromJson(Map<String, dynamic> json) =>
      GetMCTaskEquipmentList(
        invId: json["invId"],
        invName: json["invName"],
        moduleQuantity: json["moduleQuantity"],
        smbs: json["smbs"] != null
            ? List<SMBS>.from(json["smbs"].map((x) => SMBS.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "invId": invId,
        "invName": invName,
        "moduleQuantity": moduleQuantity,
        "smbs": List<dynamic>.from(smbs.map((x) => x)),
      };
}

class SMBS {
  SMBS({
    this.parentId,
    this.smbId,
    this.smbName,
    this.moduleQuantity,
    this.isPending,
    this.scheduledAt,
    this.scheduledDay,
    this.isCleaned,
    this.cleanedAt,
    this.executedDay,
    this.isAbandoned,
    this.abandonedAt,
    this.isCleanedSmbCheck = false,
    this.isAbandonSmbCheck = false,
  });

  int? parentId;
  int? smbId;
  String? smbName;
  int? moduleQuantity;
  int? isPending;
  String? scheduledAt;
  int? scheduledDay;
  int? isCleaned;
  String? cleanedAt;
  int? executedDay;
  int? isAbandoned;
  String? abandonedAt;
  bool? isCleanedSmbCheck;
  bool? isAbandonSmbCheck;

  factory SMBS.fromJson(Map<String, dynamic> json) => SMBS(
        parentId: json["parentId"],
        smbId: json['smbId'],
        smbName: json['smbName'],
        moduleQuantity: json['moduleQuantity'],
        isPending: json["isPending"],
        scheduledAt: json["scheduledAt"],
        scheduledDay: json["scheduledDay"],
        isCleaned: json["isCleaned"],
        isCleanedSmbCheck: json["isCleaned"] == 1 ? true : false,
        isAbandonSmbCheck: json["isAbandoned"] == 1 ? true : false,
        cleanedAt: json["cleanedAt"],
        executedDay: json["executedDay"],
        isAbandoned: json["isAbandoned"],
        abandonedAt: json["abandonedAt"],
      );

  Map<String, dynamic> toJson() => {
        "parentId": parentId,
        "smbId": smbId,
        "smbName": smbName,
        "moduleQuantity": moduleQuantity,
        "isPending": isPending,
        "scheduledAt": scheduledAt,
        "scheduledDay": scheduledDay,
        "isCleaned": isCleaned,
        "cleanedAt": cleanedAt,
        "executedDay": executedDay,
        "isAbandoned": isAbandoned,
        "abandonedAt": abandonedAt,
      };
}

String smbModelToJson(SMBS data) => json.encode(data.toJson());
