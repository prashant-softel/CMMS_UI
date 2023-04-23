import 'dart:convert';

List<GetPmScheduleListModel> getPmScheduleListModelFromJson(String str) =>
    List<GetPmScheduleListModel>.from(
        json.decode(str).map((x) => GetPmScheduleListModel.fromJson(x)));
String getPmScheduleListModelToJson(GetPmScheduleListModel data) =>
    json.encode(data.toJson());

class GetPmScheduleListModel {
  int? asset_id;
  String? asset_name;
  int? category_id;
  String? category_name;
  List<FrequencyDates>? frequency_dates;

  GetPmScheduleListModel(
      {this.category_id,
      this.category_name,
      this.asset_id,
      this.asset_name,
      this.frequency_dates});

  factory GetPmScheduleListModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['frequency_dates'] as List;
    print(list.runtimeType);
    List<FrequencyDates> frequencyDates =
        list.map((i) => FrequencyDates.fromJson(i)).toList();

    return GetPmScheduleListModel(
      category_id: parsedJson['category_id'],
      category_name: parsedJson['category_name'],
      frequency_dates: frequencyDates,
      asset_id: parsedJson['asset_id'],
      asset_name: parsedJson['asset_name'],
    );
  }
  Map<String, dynamic> toJson() => {
        "category_id": category_id,
        "category_name": category_name,
        "asset_id": asset_id,
        "asset_name": asset_name,
        "frequency_dates":
            List<dynamic>.from(frequency_dates?.map((x) => x.toJson()) ?? []),
      };
}

class FrequencyDates {
  int? schedule_id;
  String? frequency_name;
  int? frequency_id;
  String? schedule_date;

  FrequencyDates(
      {this.schedule_date,
      this.schedule_id,
      this.frequency_id,
      this.frequency_name});

  factory FrequencyDates.fromJson(Map<String, dynamic> parsedJson) {
    return FrequencyDates(
        schedule_date: parsedJson['schedule_date'],
        schedule_id: parsedJson['schedule_id'],
        frequency_id: parsedJson['frequency_id'],
        frequency_name: parsedJson['frequency_name']);
  }

  Map<String, dynamic> toJson() => {
        "schedule_date": schedule_date,
        "schedule_id": schedule_id,
        "frequency_id": frequency_id,
        "frequency_name": frequency_name,
      };
}
