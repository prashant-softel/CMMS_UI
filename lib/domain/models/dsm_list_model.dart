import 'dart:convert';

List<DSMData> dsmDataFromJson(String str) =>
    List<DSMData>.from(json.decode(str).map((x) => DSMData.fromJson(x)));

String dsmDataToJson(List<DSMData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DSMData {
  String? fy;
  String? month;
  String? state;
  String? spv;
  String? site;
  String? dsmtype;
  String? forcasterName;
  String? category;
  double? dsmPenalty;
  double? scheduleKwh;
  double? actualKwh;
  double? dsmPer;

  DSMData({
    this.fy,
    this.month,
    this.state,
    this.spv,
    this.site,
    this.dsmtype,
    this.forcasterName,
    this.category,
    this.dsmPenalty,
    this.scheduleKwh,
    this.actualKwh,
    this.dsmPer,
  });

  factory DSMData.fromJson(Map<String, dynamic> json) => DSMData(
        fy: json["fy"],
        month: json["month"],
        state: json["state"],
        spv: json["spv"],
        site: json["site"],
        dsmtype: json["dsmtype"],
        forcasterName: json["forcasterName"],
        category: json["category"],
        dsmPenalty: json["dsmPenalty"],
        scheduleKwh: json["scheduleKwh"],
        actualKwh: json["actualKwh"],
        dsmPer: json["dsmPer"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "fy": fy,
        "month": month,
        "state": state,
        "spv": spv,
        "site": site,
        "dsmtype": dsmtype,
        "forcasterName": forcasterName,
        "category": category,
        "dsmPenalty": dsmPenalty,
        "scheduleKwh": scheduleKwh,
        "actualKwh": actualKwh,
        "dsmPer": dsmPer,
      };
}
