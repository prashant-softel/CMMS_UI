import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/list_of_occupationalhealth/occupational_list_presenter.dart';
import 'package:cmms/domain/models/get_occupational_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class OccupationalDataListController extends GetxController {
  OccupationalDataListController(
    this.occupationalListPresenter,
  );
  OccupationalListPresenter occupationalListPresenter;
  final HomeController homecontroller = Get.find();
  RxList<GetOccupationalList?> occupationalhealthList =
      <GetOccupationalList?>[].obs;
  Rx<bool> isLoading = true.obs;
  Rx<int> id = 0.obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
   StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  RxString healthexamsFilterText = ''.obs;
  RxString periodictestsFilterText = ''.obs;
  RxString illnessesFilterText = ''.obs;
  RxString monthFilterText = ''.obs;
  RxString createdbyFilterText = ''.obs;
  RxString createdatFilterText = ''.obs;
  RxString actionFilterText = ''.obs;

  Map<String, RxString> filterText = {};

  final ValueNotifier<Map<String, bool>> columnVisibility = ValueNotifier<Map<String, bool>>({
    "no Of Health Exams Of New Joiner": true,
    "periodic Tests": true,
    "occupational Illnesses": true,
    "month name": true,
    "created By": true,
    "created At": true,
    "Action": true,
  });

  final Map<String, double> columnwidth = {
    "no Of Health Exams Of New Joiner": 380,
    "periodic Tests": 220,
    "occupational Illnesses": 250,
    "month name": 200,
    "created By": 150,
    "created At": 150,
    "Action": 100,
  };

  @override
  void onInit() async {
    this.filterText = {
      "no Of Health Exams Of New Joiner": healthexamsFilterText,
      "periodic Tests": periodictestsFilterText,
      "occupational Illnesses": illnessesFilterText,
      "month name": monthFilterText,
      "created By": createdbyFilterText,
      "created At": createdatFilterText,
      "Action": actionFilterText,
    };
 facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getHealthDatalist(true);
      });
    
    });
    super.onInit();
  }

  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
  }

  Future<void> getHealthDatalist(bool isExport) async {
    occupationalhealthList.value = <GetOccupationalList>[];

    final list = await occupationalListPresenter.getHealthDatalist(
        isLoading: isLoading.value, isExport: isExport);

    for (var incident_list in list) {
      occupationalhealthList.add(incident_list);
    }

    occupationalhealthList.value = list;
    isLoading.value = false;
    paginationController = PaginationController(
      rowCount: occupationalhealthList.length,
      rowsPerPage: 10,
    );

    update(['incident_report_list']);
  }

  void clearStoreData() {
    occupationalListPresenter.clearValue();
  }
}

