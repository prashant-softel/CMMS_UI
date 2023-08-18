import 'dart:convert';



EndMCExecutionModel addEndMCExecutionModelFromJson(String str) =>
    EndMCExecutionModel.fromJson(json.decode(str));

String endMCExecutionModelToJson(EndMCExecutionModel data) => json.encode(data.toJson());


class EndMCExecutionModel {
  int? scheduleId;
  int? executionId;
  int? cleaningDay;
  int? waterUsed;
  String? remark; 
  List<Equipments?>? equipments;
 

   EndMCExecutionModel(
       {
      this.scheduleId,
      this.executionId,
      this.cleaningDay,
      this.waterUsed,
      this.remark,
      this.equipments,
       });

  factory EndMCExecutionModel.fromJson(Map<String, dynamic> json) =>
      EndMCExecutionModel(
        scheduleId: json['scheduleId'],
        executionId: json["executionId"],
        cleaningDay: json["cleaningDay"],
        waterUsed: json["waterUsed"],
        remark: json["remark"],
        equipments: json["equipments"]!=null? List<Equipments>.from(
            json["equipments"].map((x) => Equipments.fromJson(x))):[],
        
       
      );

  Map<String, dynamic> toJson() => {
        "scheduleId": scheduleId,
        "executionId": executionId,
        "cleaningDay": cleaningDay,
        "waterUsed": waterUsed,
        "remark": remark,
        "equipments": List<dynamic>.from(equipments!.map((x) => x)),

      };
}



class Equipments {
  Equipments({
    this.id,
    
  });

  int? id;


  factory Equipments.fromJson(Map<String, dynamic> json) => Equipments(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}




String endExecutionModelToJson(Equipments data) => json.encode(data.toJson());

