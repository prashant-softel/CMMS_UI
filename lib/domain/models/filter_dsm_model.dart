class FilterDSM {
  List<String>? fy;
  List<String>? month;
  List<int>? stateId;
  List<int>? spvId;
  List<int>? siteId;

  FilterDSM({
    this.fy,
    this.month,
    this.stateId,
    this.spvId,
    this.siteId,
  });

  factory FilterDSM.fromJson(Map<String, dynamic> json) => FilterDSM(
        fy: json["fy"] == null ? [] : List<String>.from(json["fy"]),
        month: json["month"] == null ? [] : List<String>.from(json["month"]),
        stateId: json["stateId"] == null ? [] : List<int>.from(json["stateId"]),
        spvId: json["spvId"] == null ? [] : List<int>.from(json["spvId"]),
        siteId: json["siteId"] == null ? [] : List<int>.from(json["siteId"]),
      );

  Map<String, dynamic> toJson() => {
        "fy": fy == null ? [] : List<dynamic>.from(fy!),
        "month": month == null ? [] : List<dynamic>.from(month!),
        "stateId": stateId == null ? [] : List<dynamic>.from(stateId!),
        "spvId": spvId == null ? [] : List<dynamic>.from(spvId!),
        "siteId": siteId == null ? [] : List<dynamic>.from(siteId!),
      };
}
