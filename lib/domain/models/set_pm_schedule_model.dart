import 'dart:convert';

import 'package:flutter/material.dart';

import '../../app/utils/utility.dart';

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
    List<FrequencyDates> frequencyDates = [];
    List<FrequencyDates> frequencyDatesBuffer =
        list.map((i) => FrequencyDates.fromJson(i)).toList() ?? [];
    for (var i = 1; i < 16; i++) {
      FrequencyDates freq = frequencyDatesBuffer.firstWhere(
        (e) => e.frequency_id == i,
        orElse: () => FrequencyDates(
            schedule_date_value_controller: TextEditingController(),
            frequency_id: i),
      );
      frequencyDates.add(freq);
    }
    // for (var i = frequencyDates.length; i < 15; i++) {
    //   frequencyDates.add(FrequencyDates(
    //       schedule_date_value_controller: TextEditingController()));
    // }

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
  TextEditingController? schedule_date_value_controller;

  FrequencyDates({
    this.schedule_date,
    this.schedule_id,
    this.frequency_id,
    this.frequency_name,
    this.schedule_date_value_controller,
  });

  factory FrequencyDates.fromJson(Map<String, dynamic> parsedJson) {
    return FrequencyDates(
        schedule_date: parsedJson['schedule_date'],
        schedule_id: parsedJson['schedule_id'],
        frequency_id: parsedJson['frequency_id'],
        frequency_name: parsedJson['frequency_name'],
        schedule_date_value_controller: TextEditingController(
          text: Utility.getFormatedyearMonthDay(parsedJson['schedule_date']),
        ));
  }

  Map<String, dynamic> toJson() => {
        "schedule_date": schedule_date,
        "schedule_id": schedule_id,
        "frequency_id": frequency_id,
        "frequency_name": frequency_name,
      };
}
