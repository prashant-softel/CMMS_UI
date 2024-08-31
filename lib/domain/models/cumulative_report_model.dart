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
      this.Ongoing});

  dynamic site_name;
  int? Created;
  int? Closed;
  int? Cancelled;
  int? NotStarted;
  int? Ongoing;
  int? ClosedOnTime;
  int? ClosedWithExtension;
  dynamic ClosedOnTimeCreate;
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
      );
  Map<String, dynamic> toJson() => {
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
