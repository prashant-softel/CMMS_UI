import 'dart:convert';

List<Cumulativereport> facilityListFromJson(String str) =>
    List<Cumulativereport>.from(
        json.decode(str).map(Cumulativereport.fromJson));

String facilityListToJson(List<Cumulativereport> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cumulativereport {
  Cumulativereport(
      {this.site_name,
      this.Created,
      this.Closed,
      this.ClosedOnTimeCreate,
      this.Cancelled,
      this.ClosedOnTime,
      this.ClosedWithExtension,
      this.NotStarted,
      this.Ongoing,
      this.abandoned,
      this.actualQuantity,
      this.cleaningType,
      this.deviation,
      this.remark,
      this.scheduledQuantity,
      this.timeTaken,
      this.waterUsed});

  dynamic site_name;
  int? Created;
  int? Closed;
  int? Cancelled;
  int? NotStarted;
  int? Ongoing;
  dynamic? ClosedOnTime;
  int? ClosedWithExtension;
  dynamic ClosedOnTimeCreate;
  dynamic cleaningType;
  dynamic waterUsed;
  dynamic scheduledQuantity;
  dynamic actualQuantity;
  dynamic abandoned;
  dynamic remark;
  dynamic deviation;
  dynamic timeTaken;
  factory Cumulativereport.fromJson(Map<String, dynamic> json) =>
      Cumulativereport(
        site_name: json["site_name"] == null ? "" : json["site_name"],
        Created: json["created"] == null ? 0 : json["created"],
        Closed: json["closed"] == null ? 0 : json["closed"],
        Cancelled: json["cancelled"] == null ? 0 : json["cancelled"],
        NotStarted: json["notStarted"] == null ? 0 : json["notStarted"],
        Ongoing: json["ongoing"] == null ? 0 : json["ongoing"],
        ClosedOnTime: json["closedOnTime"] == null ? 0 : json["closedOnTime"],
        ClosedWithExtension: json["closedWithExtension"] == null
            ? 0
            : json["closedWithExtension"],
        ClosedOnTimeCreate: json["closedOnTimeCreate"] == null
            ? ""
            : json["closedOnTimeCreate"],
        timeTaken: json["timeTaken"],
        deviation: json["deviation"],
        remark: json["remark"],
        abandoned: json["abandoned"],
        actualQuantity: json["actualQuantity"],
        scheduledQuantity: json["scheduledQuantity"],
        waterUsed: json["waterUsed"],
        cleaningType: json["cleaningType"],
      );
  Map<String, dynamic> toJson() => {
        'cleaningType': cleaningType,
        'waterUsed': waterUsed,
        'scheduledQuantity': scheduledQuantity,
        'actualQuantity': actualQuantity,
        'abandoned': abandoned,
        'remark': remark,
        'deviation': deviation,
        'timeTaken': timeTaken,
        'site_name': site_name,
        'created': Created,
        'closed': Closed,
        'cancelled': Cancelled,
        'notStarted': NotStarted,
        'ongoing': Ongoing,
        'closedOnTime': ClosedOnTime,
        'closedWithExtension': ClosedWithExtension,
        'closedOnTimeCreate': ClosedOnTimeCreate,
      };
}
