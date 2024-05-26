import 'dart:convert';

List<WasteDataList> wasteDataListFromJson(String str) =>
    List<WasteDataList>.from(
        json.decode(str).map((x) => WasteDataList.fromJson(x)));

String wasteDataListToJson(List<WasteDataList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WasteDataList {
  int? facilityID;
  String? facilityName;
  int? hazardous;
  List<PeriodData> periods;

  List<MasterList> master_list;

  WasteDataList(
      {required this.periods,
      this.hazardous,
      this.facilityID,
      this.facilityName,
      required this.master_list});

  factory WasteDataList.fromJson(Map<String, dynamic> parsedJson) {
    var list = (parsedJson['period'] ?? []) as List;
    print(list.runtimeType);

    List<PeriodData> periods = list.map((i) => PeriodData.fromJson(i)).toList();
    List<MasterList> master_list = ((parsedJson['master_list'] ?? []) as List)
        .map((i) => MasterList.fromJson(i))
        .toList();

    return WasteDataList(
      facilityID: parsedJson['facilityID'],
      hazardous: parsedJson['hazardous'],
      facilityName: parsedJson['facilityName'],
      periods: periods ?? [],
      master_list: master_list ?? [],
    );
  }
  Map<String, dynamic> toJson() => {
        "facilityID": facilityID,
        "hazardous": hazardous,
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
  String waste_type;
  int show_opening;

  MasterList({
    required this.show_opening,
    required this.waste_type,
  });

  factory MasterList.fromJson(Map<String, dynamic> json) {
    return MasterList(
      waste_type: "${json['waste_type']}",
      show_opening: json['show_opening'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'waste_type': waste_type,
      'show_opening': show_opening,
    };
  }
}

class DetailData {
  String waste_type;
  double opening;
  double procuredQty;
  double consumedQty;
  double closingQty;
  int show_opening;

  DetailData({
    required this.waste_type,
    required this.opening,
    required this.procuredQty,
    required this.consumedQty,
    required this.closingQty,
    required this.show_opening,
  });

  factory DetailData.fromJson(Map<String, dynamic> json) {
    return DetailData(
      waste_type: "${json['waste_type']}",
      opening: json['opening_qty'] ?? 0.0,
      procuredQty: json['procured_qty'] ?? 0.0,
      consumedQty: json['consumed_qty'] ?? 0.0,
      closingQty: json['closing_qty'] ?? 0.0,
      show_opening: json['show_opening'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'waste_type': waste_type,
      'opening': opening,
      'procured_qty': procuredQty,
      'consumed_qty': consumedQty,
      'closing_qty': closingQty,
      'show_opening': show_opening,
    };
  }
}
