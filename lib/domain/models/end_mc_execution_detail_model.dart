import 'dart:convert';



EndMCExecutionDetailsModel endMCExecutionDetailsModelFromJson(String str) =>
    EndMCExecutionDetailsModel.fromJson(json.decode(str));

String endMCExecutionDetailsModelToJson(EndMCExecutionDetailsModel data) => json.encode(data.toJson());


class EndMCExecutionDetailsModel {
  int? id;
  int? executionId;
  String? title;
  String? description;
  String? frequency;
  int? noOfDays;
  String? plannedBy;
  String? plannedAt;
  String? startedBy;
  String? startedAt;
  String? abandonedBy;
  String? abandonedAt; 
  int? status;
  String? status_short;
  String? status_long;
  // List<Equipments?>? equipments;
 

   EndMCExecutionDetailsModel(
       {
      this.id,
      this.executionId,
      this.title,
      this.description,
      this.frequency,
      this.noOfDays,
      this.plannedBy,
      this.plannedAt,
      this.startedBy,
      this.startedAt,
      this.abandonedBy,
      this.abandonedAt,
      this.status,
      this.status_short,
      this.status_long,
      // this.equipments,
       });

  factory EndMCExecutionDetailsModel.fromJson(Map<String, dynamic> json) =>
      EndMCExecutionDetailsModel(
        id: json['id'],
        executionId: json["executionId"],
        title: json['title'],
        description: json['description'] ?? '',
        frequency: json['frequency'],
        noOfDays: json["noOfDays"],
        plannedBy: json['plannedBy'],
        plannedAt: json['plannedAt'],
        startedBy: json['startedBy'],
        startedAt: json['startedAt'],
        abandonedBy: json["abandonedBy"] ?? '',
        abandonedAt: json["abandonedAt"],
        status: json['status'],
        status_short: json['status_short'],
        status_long: json['status_long'],
        // equipments: json["equipments"]!=null? List<Equipments>.from(
        //     json["equipments"].map((x) => Equipments.fromJson(x))):[],
        
       
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "executionId": executionId,
        "title": title,
        "description": description,
        "frequency": frequency,
        "noOfDays": noOfDays,
        "plannedBy": plannedBy,
        "plannedAt": plannedAt,
        "startedBy": startedBy,
        "startedAt": startedAt,
        "abandonedBy": abandonedBy,
        "abandonedAt": abandonedAt,
        "status": status,
        "status_short": status_short,
        "status_long": status_long,
        // "equipments": List<dynamic>.from(equipments!.map((x) => x)),

      };
}



// class Equipments {
//   Equipments({
//     this.id,
    
//   });

//   int? id;


//   factory Equipments.fromJson(Map<String, dynamic> json) => Equipments(
//         id: json["id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//       };
// }




// String endExecutionModelToJson(Equipments data) => json.encode(data.toJson());

