class WaterDataList {
  List<FacilityData> facilities;

  WaterDataList({
    required this.facilities,
  });

  factory WaterDataList.fromJson(List<dynamic> json) {
    List<FacilityData> facilities = [];
    for (var facilityJson in json) {
      facilities.add(FacilityData.fromJson(facilityJson));
    }
    return WaterDataList(facilities: facilities);
  }

  List<Map<String, dynamic>> toJson() {
    return facilities.map((facility) => facility.toJson()).toList();
  }
}

class FacilityData {
  int facilityId;
  String facilityName;
  List<PeriodData> periods;

  FacilityData({
    required this.facilityId,
    required this.facilityName,
    required this.periods,
  });

  factory FacilityData.fromJson(Map<String, dynamic> json) {
    List<PeriodData> periods = [];
    for (var periodJson in json['period']) {
      periods.add(PeriodData.fromJson(periodJson));
    }
    return FacilityData(
      facilityId: json['facility_id'],
      facilityName: json['facility_name'],
      periods: periods,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'facility_id': facilityId,
      'facility_name': facilityName,
      'period': periods.map((period) => period.toJson()).toList(),
    };
  }
}

class PeriodData {
  String monthName;
  int year;
  List<DetailData> details;

  PeriodData({
    required this.monthName,
    required this.year,
    required this.details,
  });

  factory PeriodData.fromJson(Map<String, dynamic> json) {
    List<DetailData> details = [];
    for (var detailJson in json['details']) {
      details.add(DetailData.fromJson(detailJson));
    }
    return PeriodData(
      monthName: json['month_name'],
      year: json['year'],
      details: details,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'month_name': monthName,
      'year': year,
      'details': details.map((detail) => detail.toJson()).toList(),
    };
  }
}

class DetailData {
  String waterType;
  double opening;
  double procuredQty;
  double consumedQty;
  double closingQty;

  DetailData({
    required this.waterType,
    required this.opening,
    required this.procuredQty,
    required this.consumedQty,
    required this.closingQty,
  });

  factory DetailData.fromJson(Map<String, dynamic> json) {
    return DetailData(
      waterType: json['water_type'],
      opening: json['opening'].toDouble(),
      procuredQty: json['procured_qty'].toDouble(),
      consumedQty: json['consumed_qty'].toDouble(),
      closingQty: json['closing_qty'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'water_type': waterType,
      'opening': opening,
      'procured_qty': procuredQty,
      'consumed_qty': consumedQty,
      'closing_qty': closingQty,
    };
  }
}
