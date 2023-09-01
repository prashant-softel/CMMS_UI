class UpdateMcExecutionModel {
  
  int? scheduleId;
  int? cleaningDay;
  int? waterUsed;
  String? remark;
  List<int?>? cleanedEquipmentIds;
  List<int?>? abandonedEquipmentIds;

  UpdateMcExecutionModel({
    
    this.scheduleId,
    this.cleaningDay,
    this.waterUsed,
    this.remark,
    this.cleanedEquipmentIds,
    this.abandonedEquipmentIds,
  });

  factory UpdateMcExecutionModel.fromJson(Map<String, dynamic> json) => UpdateMcExecutionModel(
        scheduleId: json["scheduleId"],
        cleaningDay: json["cleaningDay"],
        waterUsed: json['waterUsed'],
        remark: json['remark'],
        cleanedEquipmentIds:json["cleanedEquipmentIds"]!=null? List<int>.from(json["cleanedEquipmentIds"].map((x) => x)):[],
        abandonedEquipmentIds:json["abandonedEquipmentIds"]!=null? List<int>.from(json["abandonedEquipmentIds"].map((x) => x)):[],

      );

  Map<String, dynamic> toJson() => {
        "scheduleId": scheduleId,
        "cleaningDay": cleaningDay,
        "waterUsed": waterUsed,
        "remark": remark,
        "cleanedEquipmentIds": List<dynamic>.from(cleanedEquipmentIds!.map((x) => x)),
        "abandonedEquipmentIds": List<dynamic>.from(abandonedEquipmentIds!.map((x) => x)),
      };
}
