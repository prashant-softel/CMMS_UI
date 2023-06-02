import 'dart:async';

import 'package:cmms/app/preventive_maintenance_task/preventive_maintenance_task_presenter.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../domain/models/pm_task_model.dart';
import '../../domain/models/update_pm_task_execution_model.dart';
import '../home/home_controller.dart';
import '../navigators/app_pages.dart';

class PreventiveMaintenanceTaskController extends GetxController {
  ///
  PreventiveMaintenanceTaskController(
    this.preventiveMaintenanceTaskPresenter,
  );
  PreventiveMaintenanceTaskPresenter preventiveMaintenanceTaskPresenter;
  final HomeController homecontroller = Get.find();

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<PmTaskListModel?>? pmTaskList = <PmTaskListModel?>[].obs;
  PmTaskListModel? pmTaskListModel;
  RxList<String> pmTaskListTableColumns = <String>[].obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  String get formattedTodate => DateFormat('yyyy-MM-dd').format(toDate.value);
  PmTaskListModel? selectedItem;
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      // Future.delayed(Duration(seconds: 2), () async {
      // });
    });
    await Future.delayed(Duration(seconds: 2), () async {
      getPmTaskList(facilityId, false);
    });

    super.onInit();
  }

  Future<void> getPmTaskList(int facilityId, bool isLoading) async {
    pmTaskList?.value = <PmTaskListModel>[];
    // pmTaskList?.clear();
    final _pmTaskList = await preventiveMaintenanceTaskPresenter.getPmTaskList(
        facilityId: facilityId, isLoading: isLoading);
    if (_pmTaskList != null) {
      pmTaskList!.value = _pmTaskList;
      paginationController = PaginationController(
        rowCount: pmTaskList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (pmTaskList != null && pmTaskList!.isNotEmpty) {
        pmTaskListModel = pmTaskList![0];
        var calibrationListJson = pmTaskListModel?.toJson();
        pmTaskListTableColumns.value = <String>[];
        for (var key in calibrationListJson?.keys.toList() ?? []) {
          pmTaskListTableColumns.add(key);
        }
      }
    }
  }
}
