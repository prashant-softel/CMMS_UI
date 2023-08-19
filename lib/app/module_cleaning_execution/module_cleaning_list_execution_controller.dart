import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/module_cleaning_execution/module_cleaning_list_execution_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/comment_model.dart';

import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/mc_task_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ModuleCleaningListExecutionController extends GetxController {
  ModuleCleaningListExecutionController(
    this.moduleCleaningListExecutionPresenter,
  );
  ModuleCleaningListExecutionPresenter moduleCleaningListExecutionPresenter;
  final HomeController homecontroller = Get.find();

  TextEditingController commentTextFieldCtrlr = TextEditingController();


  ///MC task list
  RxList<MCTaskListModel?> mcTaskList = <MCTaskListModel?>[].obs;
  RxList<MCTaskListModel?> filteredData = <MCTaskListModel>[].obs;

  MCTaskListModel? mcTaskModelList;
  RxList<String> mcTaskListTableColumns = <String>[].obs;

  ///Date Range
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  bool openFromDateToStartDatePicker = false;
  String get formattedFromdate =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  String get formattedTodate => DateFormat('yyyy-MM-dd').format(toDate.value);

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<String> selectedBlock = ''.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      getMCTaskList(facilityId, formattedTodate, formattedFromdate, true);
      super.onInit();
    });
  }

  Future<void> getFacilityList({bool? isLoading}) async {
    facilityList.value = <FacilityModel>[];
    List<FacilityModel?>? _facilityList = <FacilityModel?>[];

    _facilityList =
        await moduleCleaningListExecutionPresenter.getFacilityList();
    if (_facilityList != null && _facilityList.isNotEmpty) {
      facilityList.value = _facilityList;
    }
    if (facilityList.isNotEmpty) {
      selectedBlock.value = facilityList[0]?.name ?? '';
    }
  }

 

  // Future<void> abandonExecutionButton({int? id}) async {
  //   String _Comment = commentTextFieldCtrlr.text.trim();

  //   CommentModel commentAbandonModel =
  //         CommentModel(id: id, comment: _Comment);

  //     var abandoneJsonString = commentAbandonModel.toJson();

  //   final _abandonExecutionBtn = await moduleCleaningListExecutionPresenter.abandonExecutionButton(
  //    abandoneJsonString: abandoneJsonString,
  //       isLoading: true,
  //   );
  //   // showAlertPermitApproveDialog();
  //   // print('abandon Button Data:${_Comment}');
  //   // print('abandon id Button Data:${id}');
  // }

   void abandonExecutionButton({int? id}) async {
    {
      String _comment = commentTextFieldCtrlr.text.trim();

      CommentModel commentAbandonModel =
          CommentModel(id: id, comment: _comment);

      var abandoneJsonString = commentAbandonModel.toJson();
      // print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
      Map<String, dynamic>? response = await moduleCleaningListExecutionPresenter.abandonExecutionButton(
        abandoneJsonString: abandoneJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      mcTaskList.value = filteredData;
      return;
    }

    mcTaskList.value = filteredData
        .where((item) =>
            item!.responsibility!.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
    update(['mc_task_list']);
  }

  Future<void> getMCTaskList(int facilityId, dynamic startDate, dynamic endDate,
      bool isLoading) async {
    mcTaskList.value = <MCTaskListModel>[];

    final list = await moduleCleaningListExecutionPresenter.getMCTaskList(
        isLoading: isLoading,
        start_date: startDate, //// "2020-01-01",
        end_date: endDate,
        facility_id: facilityId);

    for (var mc_task_list in list) {
      mcTaskList.add(mc_task_list);
    }

    if (list != null) {
      mcTaskList.value = list;
      filteredData.value = mcTaskList.value;
      paginationController = PaginationController(
        rowCount: mcTaskList.length,
        rowsPerPage: 10,
      );
      if (filteredData != null && filteredData.isNotEmpty) {
        mcTaskModelList = filteredData[0];
        var mcTaskListJson = mcTaskModelList?.toJson();
        mcTaskListTableColumns.value = <String>[];
        for (var key in mcTaskListJson?.keys.toList() ?? []) {
          mcTaskListTableColumns.add(key);
        }
      }
    }

    update(['mc_task_list']);
  }

  void getMCListByDate() {
    getMCTaskList(facilityId, formattedFromdate, formattedTodate, false);
  }

  Future<void> viewMCExecution({int? id}) async {
    Get.toNamed(Routes.viewModuleCleaningExecutionScreen, arguments: id);
    print('Argument$id');
  }

   
  Future<void> StartEndMCExecution({Map<String, dynamic>? dataList}) async {
    Get.toNamed(Routes.addModuleCleaningExecutionContentWeb, arguments: dataList, );
    // Get.toNamed(Routes.addModuleCleaningExecutionContentWeb, arguments: planId,);

    print('Argument$dataList');
  }
}
