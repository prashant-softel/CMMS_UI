import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<ScheduleCourseListModel> scheduleCourseListFromJson(String str) =>
    List<ScheduleCourseListModel>.from(
      json.decode(str).map(
            (x) => ScheduleCourseListModel.fromJson(x),
          ),
    );

String scheduleCourseListToJson(List<ScheduleCourseListModel> data) =>
    json.encode(
      List<dynamic>.from(
        data.map((x) => x.toJson()),
      ),
    );

class ScheduleCourseListModel {
  int? scheduleID;
  int? courseID;
  String? scheduleDate;
  String? trainingCompany;
  String? trainer;
  String? mode;
  String? venue;
  int? traningCategoryId;
  int? noOfDays;
  int? targetedGroupId;
  int? durationInMinutes;
  String? courseCategory;
  String? targetedGroup;

  ScheduleCourseListModel(
      {this.scheduleID,
      this.courseID,
      this.scheduleDate,
      this.trainingCompany,
      this.trainer,
      this.mode,
      this.venue,
      this.traningCategoryId,
      this.noOfDays,
      this.targetedGroupId,
      this.durationInMinutes,
      this.courseCategory,
      this.targetedGroup});

  factory ScheduleCourseListModel.fromJson(Map<String, dynamic> json) {
    return ScheduleCourseListModel(
      scheduleID: json['scheduleID'],
      courseID: json['courseID'],
      scheduleDate: json['scheduleDate'] != null
          ? Utility.getFormattedYearMonthDayTime(json['scheduleDate'])
          : "",
      trainingCompany: json['trainingCompany'],
      trainer: json['trainer'],
      mode: json['mode'],
      venue: json['venue'],
      traningCategoryId: json['traning_category_id'],
      noOfDays: json['no_Of_Days'],
      targetedGroupId: json['targeted_Group_Id'],
      durationInMinutes: json['duration_In_Minutes'],
      courseCategory: json['course_Category'],
      targetedGroup: json['targeted_Group'],
    );
  }
  Map<String, dynamic> toJson() => {
        'scheduleID': scheduleID,
        'courseID': courseID,
        'scheduleDate': scheduleDate,
        'trainingCompany': trainingCompany,
        'trainer': trainer,
        'mode': mode,
        'venue': venue,
        'traning_category_id': traningCategoryId,
        'no_Of_Days': noOfDays,
        'targeted_Group_Id': targetedGroupId,
        'duration_In_Minutes': durationInMinutes,
        'course_Category': courseCategory,
        'targeted_Group': targetedGroup,
      };
}
