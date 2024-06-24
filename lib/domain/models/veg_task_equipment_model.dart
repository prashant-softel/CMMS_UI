import 'dart:convert';

List<VegTaskEquipmentList> vegTaskEquipmentListFromJson(String str) =>
    List<VegTaskEquipmentList>.from(
        json.decode(str).map((x) => VegTaskEquipmentList.fromJson(x)));

String vegTaskEquipmentListToJson(List<VegTaskEquipmentList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VegTaskEquipmentList {
  int? invId;
  String? invName;
  int? area;
  List<SMB>? smbs;
  bool isExpanded;
  String? selectedDay;
  bool? isAbandonedChecked;
  bool? isCleanedChecked;

  VegTaskEquipmentList({
    this.invId,
    this.invName,
    this.area,
    this.smbs,
    this.selectedDay,
    this.isExpanded = false,
    this.isAbandonedChecked = false,
    this.isCleanedChecked = false,
  });

  factory VegTaskEquipmentList.fromJson(Map<String, dynamic> json) =>
      VegTaskEquipmentList(
        invId: json["invId"],
        invName: json["invName"],
        area: json["area"],
        smbs: json["smbs"] != null
            ? List<SMB>.from(
                json["smbs"].map(
                  (x) => SMB.fromJson(x),
                ),
              )
            : [],
      );

  Map<String, dynamic> toJson() => {
        "invId": invId,
        "invName": invName,
        "area": area,
        "smbs": smbs != null
            ? List<dynamic>.from(smbs!.map((x) => x.toJson()))
            : [],
      };
}

class SMB {
  int? parentId;
  int? smbId;
  String? smbName;
  int? area;
  int? isPending;
  String? scheduleAt;
  int? scheduledDay;
  int? isCleaned;
  String? cleanedAt;
  int? executedDay;
  int? isAbandoned;
  String? abandonedAt;
  bool? isCleanedSmbCheck;
  bool? isAbandonSmbCheck;

  SMB({
    this.parentId,
    this.smbId,
    this.smbName,
    this.area,
    this.isPending,
    this.scheduleAt,
    this.scheduledDay,
    this.isCleaned,
    this.cleanedAt,
    this.executedDay,
    this.isAbandoned,
    this.abandonedAt,
  });

  factory SMB.fromJson(Map<String, dynamic> json) => SMB(
        parentId: json["parentId"],
        smbId: json["smbId"],
        smbName: json["smbName"],
        area: json["area"],
        isPending: json["isPending"],
        scheduleAt: json["scheduleAt"],
        scheduledDay: json["scheduledDay"],
        isCleaned: json["isCleaned"],
        cleanedAt: json["cleanedAt"],
        executedDay: json["executedDay"],
        isAbandoned: json["isAbandoned"],
        abandonedAt: json["abandonedAt"],
      );

  Map<String, dynamic> toJson() => {
        "parentId": parentId,
        "smbId": smbId,
        "smbName": smbName,
        "area": area,
        "isPending": isPending,
        "scheduleAt": scheduleAt,
        "scheduledDay": scheduledDay,
        "isCleaned": isCleaned,
        "cleanedAt": cleanedAt,
        "executedDay": executedDay,
        "isAbandoned": isAbandoned,
        "abandonedAt": abandonedAt,
      };
}
