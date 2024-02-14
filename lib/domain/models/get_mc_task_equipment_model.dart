// import 'dart:convert';

// List<GetMCTaskEquipmentList> equipmentListModelFromJson(String str) =>
//     List<GetMCTaskEquipmentList>.from(
//         json.decode(str).map((x) => GetMCTaskEquipmentList.fromJson(x)));

// String equipmentListModelToJson(List<GetMCTaskEquipmentList> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class GetMCTaskEquipmentList {
//   int? invId;
//   String? invName;
//   int? moduleQuantity;
//   List<SMBS> smbs;
//   bool isExpanded;
//   String? selectedDay;
//   bool? isAbandonedChecked;
//   bool? isCleanedChecked;

//   GetMCTaskEquipmentList({
//     this.invId,
//     this.invName,
//     this.moduleQuantity,
//     this.smbs = const [],
//     this.isExpanded = false,
//     this.isAbandonedChecked = false,
//     this.isCleanedChecked = false,
//     this.selectedDay,
//   });

//   factory GetMCTaskEquipmentList.fromJson(Map<String, dynamic> json) =>
//       GetMCTaskEquipmentList(
//         invId: json["invId"],
//         invName: json["invName"],
//         moduleQuantity: json["moduleQuantity"],
//         smbs: json["smbs"] != null
//             ? List<SMBS>.from(json["smbs"].map((x) => SMBS.fromJson(x)))
//             : [],
//       );

//   Map<String, dynamic> toJson() => {
//         "invId": invId,
//         "invName": invName,
//         "moduleQuantity": moduleQuantity,
//         "smbs": List<dynamic>.from(smbs.map((x) => x)),
//       };
// }

// class SMBS {
//   SMBS(
//       {this.parentId,
//       this.smbId,
//       this.smbName,
//       this.moduleQuantity,
//       this.isPending,
//       this.scheduledAt,
//       this.scheduledDay,
//       this.isCleaned,
//       this.cleanedAt,
//       this.executedDay,
//       this.isAbandoned,
//       this.abandonedAt});

//   int? parentId;
//   int? smbId;
//   String? smbName;
//   String? moduleQuantity;
//   String? isPending;
//   String? scheduledAt;
//   String? scheduledDay;
//   String? isCleaned;
//   String? cleanedAt;
//   String? executedDay;
//   String? isAbandoned;
//   String? abandonedAt;

//   factory SMBS.fromJson(Map<String, dynamic> json) => SMBS(
//         parentId: json["parentId"],
//         smbId: json['smbId'],
//         smbName: json['smbName'],
//         moduleQuantity: json['moduleQuantity'],
//         selectedDay: json["selectedDay"],
//         // status: json['status'],
//         // short_status: json['short_status'],
//         // isCleanedSmbCheck:  json['status'] == 407 ? true : false,
//         // isAbandonSmbCheck: json['status'] == 408 ? true : false
//       );

//   Map<String, dynamic> toJson() => {
//         "parentId": parentId,
//         "smbId": smbId,
//         "smbName": smbName,
//         "moduleQuantity": moduleQuantity,
//         "selectedDay": selectedDay,
//         // "status": status,
//         // "short_status": short_status
//       };
// }

// String smbModelToJson(SMBS data) => json.encode(data.toJson());
