import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/schedule_course_list/schedule_course_list_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/schedule_course_list_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ScheduleCourseListController extends GetxController {
  ScheduleCourseListController(this.scheduleCourseListPresenter);

  ScheduleCourseListPresenter scheduleCourseListPresenter;
  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Schedule Id": true,
    "Course Id": true,
    "Training Date": true,
    "Training Company": true,
    "Trainer": true,
    "Mode": true,
    "Venue": true,
  });
  final Map<String, double> columnwidth = {
    "Schedule Id": 150,
    "Course Id": 150,
    "Training Date": 190,
    "Training Company": 250,
    "Trainer": 200,
    "Mode": 130,
    "Venue": 180,
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  HomeController homeController = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  StreamSubscription<String>? facilityNameStreamSubscription;
  RxInt facilityId = 0.obs;
  RxList<ScheduleCourseListModel?> scourseList =
      <ScheduleCourseListModel>[].obs;
  RxList<ScheduleCourseListModel?> filteredData =
      <ScheduleCourseListModel>[].obs;
  RxList<String> scheduleCourseListTableColumns = <String>[].obs;
  PaginationController scheduleListPaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  Rx<bool> isSelectedCourse = true.obs;
  bool openFromDateToStartDatePicker = false;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 70)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  String get formattedTodate => DateFormat('yyyy-MM-dd').format(toDate.value);
  int selectedCorseId = 1;
  Rx<String> selectedcourse = ''.obs;
  RxBool isLoading = true.obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<String> selectedBlock = ''.obs;
  RxString ScheduleIdFilterText = ''.obs;
  RxString CourseIdFilterText = ''.obs;
  RxString ScheduledateFilterText = ''.obs;
  RxString TrainingcompanyFilterText = ''.obs;
  RxString trainerFilterText = ''.obs;
  RxString modeFilterText = ''.obs;
  RxString venueFilterText = ''.obs;
  RxString statusFilterText = ''.obs;
  RxString ActionFilterText = ''.obs;

  void search(String keyword) {
    // if (keyword.isEmpty) {
    //   scourseList.value = filteredData;
    //   return;
    // }
    // List<ScheduleCourseListModel?> filteredList = filteredData
    //     .where((item) => (item?.scheduleID.toString().toLowerCase().contains(
    //                   keyword.toLowerCase(),
    //                 ) ??
    //             false)
    //             ||
    //         (item?.name?.toString().toLowerCase().contains(
    //                   keyword.toLowerCase(),
    //                 ) ??
    //             false) ||
    //         (item?.groupId?.toString().toLowerCase().contains(
    //                   keyword.toLowerCase(),
    //                 ) ??
    //             false) ||
    //         (item?.categoryId?.toString().toLowerCase().contains(
    //                   keyword.toLowerCase(),
    //                 ) ??
    //             false) ||
    //         (item?.description?.toString().toLowerCase().contains(
    //                   keyword.toLowerCase(),
    //                 ) ??
    //             false) ||
    //         (item?.max_cap?.toString().toLowerCase().contains(
    //                   keyword.toLowerCase(),
    //                 ) ??
    //             false) ||
    //         (item?.duration?.toString().toLowerCase().contains(
    //                   keyword.toLowerCase(),
    //                 ) ??
    //             false) ||
    //         (item?.number_of_days?.toString().toLowerCase().contains(
    //                   keyword.toLowerCase(),
    //                 ) ??
    //             false),
    //         )
    //     .toList();
    // scourseList.value = filteredList;
    update(['schedule_list']);
  }

  // RxList<TrainingCourse?> courseDetail = <TrainingCourse>[
  //   TrainingCourse(
  //       id: 1,
  //       topic: "Test",
  //       description: "Test",
  //       category: "Test",
  //       targetGroup: "Test",
  //       duration: "Test",
  //       maxCapacity: '60'),
  // ].obs;

  void onInit() async {
    try {
      this.filterText = {
        "Schedule Id": ScheduleIdFilterText,
        "Course Id": CourseIdFilterText,
        "Training Date": ScheduledateFilterText,
        "Training Company": TrainingcompanyFilterText,
        "Trainer": trainerFilterText,
        "Mode": modeFilterText,
        "Venue": venueFilterText,
      };
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId.value = event;
        Future.delayed(Duration(seconds: 1), () {
          getScheduleCourseList(
            facilityId: facilityId.value,
            startDate: formattedFromdate,
            endDate: formattedTodate,
          );
        });
      });
    } catch (e) {
      print(e);
    }
    super.onInit();
  }

  void geScheduleCourseListByDate() {
    getScheduleCourseList(
      facilityId: facilityId.value,
      startDate: formattedFromdate,
      endDate: formattedTodate,
    );
  }

  Future<void> getScheduleCourseList({
    required int facilityId,
    String? startDate,
    String? endDate,
  }) async {
    scourseList.value = <ScheduleCourseListModel>[];
    final _getscheduleList =
        await scheduleCourseListPresenter.getScheduleCourseList(
      facilityId: facilityId,
      start_date: startDate,
      end_date: endDate,
      isLoading: isLoading.value,
    );

    if (_getscheduleList != null) {
      scourseList.value = _getscheduleList;
      filteredData.value = scourseList;
      isLoading.value = false;
      if (scourseList.isNotEmpty) {
        ScheduleCourseListModel? scheduleCourse =
            scourseList.firstWhere((element) => element?.scheduleID != 0);
        var scheduleCourseListJson = scheduleCourse?.toJson();
        scheduleCourseListTableColumns.value = <String>[];
        for (var key in scheduleCourseListJson?.keys.toList() ?? []) {
          scheduleCourseListTableColumns.add(key);
        }
      }
    }
    scheduleListPaginationController = PaginationController(
      rowCount: scourseList.length,
      rowsPerPage: 10,
    );
    update(['schedule_list']);
  }

  void clearStoreData() {
    scheduleCourseListPresenter.clearValue();
  }
}
