import 'dart:async';

import 'package:cmms/app/pm_plan_list/pm_plan_list_presenter.dart';
import 'package:cmms/domain/models/pm_plan_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../domain/models/new_permit_list_model.dart';
import '../../domain/models/pm_task_model.dart';
import '../home/home_controller.dart';

class PmPlanListController extends GetxController {
  ///
  PmPlanListController(
    this.pmPlanListPresenter,
  );
  PmPlanListPresenter pmPlanListPresenter;
  final HomeController homecontroller = Get.find();

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<PmPlanListModel?> pmTaskList = <PmPlanListModel?>[].obs;
  RxList<PmPlanListModel?> filteredData = <PmPlanListModel>[].obs;
  bool openFromDateToStartDatePicker = false;
  RxList<NewPermitModel?>? permitList = <NewPermitModel>[].obs;
  var permitDropdownValues = <String?>[].obs;

  final selectedPermit = Rx<NewPermitModel?>(null);
  Rx<int?> selectedPermitId = 0.obs;
  Rx<bool> isPermitLinked = false.obs;
  int permitValuesCount = 6;
  var permitValues;
  late List<TextEditingController> textControllers;
  RxString responseMessage = ''.obs;
  int permitscheduleId = 0;
  PmPlanListModel? pmTaskListModel;
  RxList<String> pmTaskListTableColumns = <String>[].obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  PmTaskListModel? selectedItem;

  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        getPmPlanList(facilityId, formattedTodate1, formattedFromdate1, false);
      });
      // isDataLoading.value = false;

      // Future.delayed(Duration(seconds: 2), () async {
      // });
    });

    super.onInit();
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      pmTaskList.value = filteredData;
      return;
    }

    // pmTaskList.value = filteredData
    //     .where((item) => item!.maintenance_order_number!
    //         .toLowerCase()
    //         .contains(keyword.toLowerCase()))
    //     .toList();
  }

  Future<void> getPmPlanList(int facilityId, dynamic startDate, dynamic endDate,
      bool isLoading) async {
    pmTaskList.value = <PmPlanListModel>[];
    // pmTaskList?.clear();
    final _pmTaskList = await pmPlanListPresenter.getPmPlanList(
        facilityId: facilityId,
        isLoading: isLoading,
        startDate: startDate,
        endDate: endDate);
    if (_pmTaskList != null) {
      pmTaskList.value = _pmTaskList;
      filteredData.value = pmTaskList.value;

      paginationController = PaginationController(
        rowCount: filteredData.length,
        rowsPerPage: 10,
      );

      if (filteredData != null && filteredData.isNotEmpty) {
        pmTaskListModel = filteredData[0];
        var calibrationListJson = pmTaskListModel?.toJson();
        pmTaskListTableColumns.value = <String>[];
        for (var key in calibrationListJson?.keys.toList() ?? []) {
          pmTaskListTableColumns.add(key);
        }
      }
    }
  }

  void getPmPlanListByDate() {
    getPmPlanList(facilityId, formattedTodate1, formattedFromdate1, false);
  }
}
