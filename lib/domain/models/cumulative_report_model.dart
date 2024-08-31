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
        Created: json["Created"] == null ? 0 : json["Created"],
        Closed: json["Closed"] == null ? 0 : json["Closed"],
        Cancelled: json["Cancelled"] == null ? 0 : json["Cancelled"],
        NotStarted: json["NotStarted"] == null ? 0 : json["NotStarted"],
        Ongoing: json["Ongoing"] == null ? 0 : json["Ongoing"],
        ClosedOnTime: json["ClosedOnTime"] == null ? 0 : json["ClosedOnTime"],
        ClosedWithExtension: json["ClosedWithExtension"] == null
            ? 0
            : json["ClosedWithExtension"],
        ClosedOnTimeCreate: json["ClosedOnTimeCreate"] == null
            ? ""
            : json["ClosedOnTimeCreate"],
      );
  Map<String, dynamic> toJson() => {
        'site_name': site_name,
        'Created': Created,
        'Closed': Closed,
        'Cancelled': Cancelled,
        'NotStarted': NotStarted,
        'Ongoing': Ongoing,
        'ClosedOnTime': ClosedOnTime,
        'ClosedWithExtension': ClosedWithExtension,
        'ClosedOnTimeCreate': ClosedOnTimeCreate,
      };
}
