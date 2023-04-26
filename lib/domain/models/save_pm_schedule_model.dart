class SavePmScheduleModel {
  SavePmScheduleModel({
    required this.facilityId,
    required this.asset_schedules,
  });

  int facilityId;

  List<AssetScheduleList> asset_schedules;

  factory SavePmScheduleModel.fromJson(Map<String, dynamic> json) =>
      SavePmScheduleModel(
        facilityId: json["facility_id"],
        asset_schedules: List<AssetScheduleList>.from(
            json["asset_schedules"].map((x) => AssetScheduleList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "facility_id": facilityId,
        "asset_schedules":
            List<dynamic>.from(asset_schedules.map((x) => x.toJson())),
      };
}

class AssetScheduleList {
  AssetScheduleList({required this.asset_id, required this.frequency_dates});

  int asset_id;
  List<FrequencyDatesList> frequency_dates;

  factory AssetScheduleList.fromJson(Map<String, dynamic> json) =>
      AssetScheduleList(
        asset_id: json["asset_id"],
        frequency_dates: List<FrequencyDatesList>.from(
            json["frequency_dates"].map((x) => FrequencyDatesList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "asset_id": asset_id,
        "frequency_dates":
            List<dynamic>.from(frequency_dates.map((x) => x.toJson())),
      };
}

class FrequencyDatesList {
  FrequencyDatesList({required this.frequency_id, required this.schedule_date});

  int frequency_id;
  String schedule_date;

  factory FrequencyDatesList.fromJson(Map<String, dynamic> json) =>
      FrequencyDatesList(
        frequency_id: json["frequency_id"],
        schedule_date: json["schedule_date"],
      );

  Map<String, dynamic> toJson() => {
        "frequency_id": frequency_id,
        "schedule_date": schedule_date,
      };
}
