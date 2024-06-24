class UpdateVegExecution {
  int? scheduleId;
  int? executionId;
  int? cleaningDay;
  String? remark;
  List<int>? cleanedEquipmentIds;
  List<int>? abandonedEquipmentIds;

  UpdateVegExecution({
    this.scheduleId,
    this.executionId,
    this.cleaningDay,
    this.remark,
    this.cleanedEquipmentIds,
    this.abandonedEquipmentIds,
  });

  factory UpdateVegExecution.fromJson(Map<String, dynamic> json) =>
      UpdateVegExecution(
        scheduleId: json['scheduleId'],
        executionId: json['executionId'],
        cleaningDay: json['cleaningDay'],
        remark: json['remark'],
        cleanedEquipmentIds: json["cleanedEquipmentIds"] != null
            ? List<int>.from(json["cleanedEquipmentIds"].map((x) => x))
            : [],
        abandonedEquipmentIds: json["abandonedEquipmentIds"] != null
            ? List<int>.from(json["abandonedEquipmentIds"].map((x) => x))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "scheduleId": scheduleId,
        "executionId": executionId,
        "cleaningDay": cleaningDay,
        "remark": remark,
        "cleanedEquipmentIds": List<dynamic>.from(
          cleanedEquipmentIds!.map((x) => x),
        ),
        "abandonedEquipmentIds": List<dynamic>.from(
          abandonedEquipmentIds!.map((x) => x),
        ),
      };
}
