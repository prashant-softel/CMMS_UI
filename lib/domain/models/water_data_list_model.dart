import 'dart:convert';

List<WaterDataList> MrsModelFromJson(String str) => List<WaterDataList>.from(
    json.decode(str).map((x) => WaterDataList.fromJson(x)));

String WaterDataListToJson(List<WaterDataList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WaterDataList {
  int? facilityID;
  String? facilityName;

  List<PeriodData> periods;

  List<MasterList> master_list;

  WaterDataList(
      {required this.periods,
      this.facilityID,
      this.facilityName,
      required this.master_list});

  factory WaterDataList.fromJson(Map<String, dynamic> parsedJson) {
    var list = (parsedJson['period'] ?? []) as List;
    print(list.runtimeType);
    List<PeriodData> periods = list.map((i) => PeriodData.fromJson(i)).toList();
    List<MasterList> master_list = ((parsedJson['master_list'] ?? []) as List)
        .map((i) => MasterList.fromJson(i))
        .toList();

    return WaterDataList(
      facilityID: parsedJson['facilityID'],
      facilityName: parsedJson['facilityName'],
      periods: periods ?? [],
      master_list: master_list ?? [],
    );
  }
  Map<String, dynamic> toJson() => {
        "facilityID": facilityID,
        "facilityName": facilityName,
        "period": List<dynamic>.from(periods.map((x) => x.toJson())),
        "master_list": List<dynamic>.from(periods.map((x) => x.toJson())),
      };
}

class PeriodData {
  String monthName;
  int month_id;

  int year;

  List<DetailData> details;

  PeriodData({
    required this.monthName,
    required this.year,
    required this.month_id,
    required this.details,
  });

  factory PeriodData.fromJson(Map<String, dynamic> json) {
    List<DetailData> details = [];
    for (var detailJson in json['details']) {
      details.add(DetailData.fromJson(detailJson));
    }
    return PeriodData(
      month_id: json['month_id'],
      monthName: "${json['month_name']}",
      year: json['year'] ?? -1,
      details: details,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'month_name': monthName,
      'month_id': month_id,
      'year': year,
      'details': details.map((detail) => detail.toJson()).toList(),
    };
  }
}

class MasterList {
  String water_type;
  int show_opening;

  MasterList({
    required this.show_opening,
    required this.water_type,
  });

  factory MasterList.fromJson(Map<String, dynamic> json) {
    return MasterList(
      water_type: "${json['water_type']}",
      show_opening: json['show_opening'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'water_type': water_type,
      'show_opening': show_opening,
    };
  }
}

class DetailData {
  String waterType;
  double opening;
  double procuredQty;
  double consumedQty;
  double closingQty;
  int show_opening;

  DetailData({
    required this.waterType,
    required this.opening,
    required this.procuredQty,
    required this.consumedQty,
    required this.closingQty,
    required this.show_opening,
  });

  factory DetailData.fromJson(Map<String, dynamic> json) {
    return DetailData(
      waterType: "${json['water_type']}",
      opening: json['opening_qty'] ?? 0.0,
      procuredQty: json['procured_qty'] ?? 0.0,
      consumedQty: json['consumed_qty'] ?? 0.0,
      closingQty: json['closing_qty'] ?? 0.0,
      show_opening: json['show_opening'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'water_type': waterType,
      'opening': opening,
      'procured_qty': procuredQty,
      'consumed_qty': consumedQty,
      'closing_qty': closingQty,
      'show_opening': show_opening,
    };
  }
}
