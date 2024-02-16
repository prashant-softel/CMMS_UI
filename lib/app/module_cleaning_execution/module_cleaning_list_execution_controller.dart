import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/module_cleaning_execution/module_cleaning_list_execution_presenter.dart';
import 'package:cmms/domain/models/comment_model.dart';
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
  RxList<MCTaskListModel?> mcTaskList = <MCTaskListModel?>[].obs;
  RxList<MCTaskListModel?> filteredData = <MCTaskListModel>[].obs;

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  MCTaskListModel? mcTaskModelList;
  RxList<String> mcTaskListTableColumns = <String>[].obs;
  RxString mcExecutionFilterText = ''.obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  RxList<String> goodsOrdersListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> Id = 0.obs;
  RxString IDFilterText = ''.obs;
  RxString titleFilterText = ''.obs;

  RxString planIDFilterText = ''.obs;
  RxString responsibilityFilterText = ''.obs;
  RxString frequencyFilterText = ''.obs;
  RxString noOfDaysFilterText = ''.obs;
  RxString startDateFilterText = ''.obs;
  RxString doneDateFilterText = ''.obs;
  RxString statusFilterText = ''.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "ID": true,
    "Title": true,
    "Plan ID": true,

    // "Responsibility": true,
    "Frequency": true,
    "No Of Days": true,
    "Start Date": true,
    "Done Date": true,
    "Status": true,

    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "ID": 100,
    "Title": 150,
    "Plan ID": 100,
    // "Responsibility": 200,
    "Frequency": 163,
    "No Of Days": 153,
    "Start Date": 130,
    "Done Date": 120,
    "Status": 100
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  void getMcExcustionListByDate() {
    getMCTaskList(facilityId, formattedFromdate1, formattedTodate1, false);
  }

  @override
  void onInit() async {
    this.filterText = {
      "ID": IDFilterText,
      "Title": titleFilterText,
      "Plan ID": planIDFilterText,
      // "Responsibility": responsibilityFilterText,
      "Frequency": frequencyFilterText,
      "No Of Days": noOfDaysFilterText,
      "Start Date": startDateFilterText,
      "Done Date": doneDateFilterText,
      "Status": statusFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        await getMCTaskList(
          facilityId,
          formattedTodate1,
          formattedFromdate1,
          false,
        );
      });
    });
    super.onInit();
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      mcTaskList.value = filteredData;
      return;
    }

    List<MCTaskListModel?> filteredList = filteredData
        .where((item) =>
            (item?.id?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false) ||
            (item?.planId?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.title?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.responsibility
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.frequency
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.noOfDays?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.startDate
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.doneDate
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.status?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false))
        .toList();
    mcTaskList.value = filteredList;

    // mcTaskList.value = filteredData
    //     .where((item) =>
    //         item!.responsibility!.toLowerCase().contains(keyword.toLowerCase()))
    //     .toList();
    // update(['mc_task_list']);
  }

  Future<void> abandonExecutionButton({int? id}) async {
    String _Comment = commentTextFieldCtrlr.text.trim();

    CommentModel commentAbandonModel = CommentModel(id: id, comment: _Comment);

    var abandoneJsonString = commentAbandonModel.toJson();

    final _abandonExecutionBtn =
        await moduleCleaningListExecutionPresenter.abandonExecutionButton(
      abandoneJsonString: abandoneJsonString,
      isLoading: true,
    );
    // showAlertPermitApproveDialog();
    // print('abandon Button Data:${_Comment}');
    // print('abandon id Button Data:${id}');
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

    mcTaskList.value = list;
    filteredData.value = mcTaskList.value;
    paginationController = PaginationController(
      rowCount: mcTaskList.length,
      rowsPerPage: 10,
    );
    if (filteredData.isNotEmpty) {
      mcTaskModelList = filteredData[0];
      var mcTaskListJson = mcTaskModelList?.toJson();
      mcTaskListTableColumns.value = <String>[];
      for (var key in mcTaskListJson?.keys.toList() ?? []) {
        mcTaskListTableColumns.add(key);
      }
    }

    update(['mc_task_list']);
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }

  // void getPmTaskListByDate() {
  //   getGoodsOrdersList(facilityId, formattedFromdate1, formattedTodate1, false);
  // }
}

// import 'dart:async';

// import 'package:cmms/app/home/home_controller.dart';
// import 'package:cmms/app/module_cleaning_execution/module_cleaning_list_execution_presenter.dart';
// import 'package:cmms/app/navigators/app_pages.dart';
// import 'package:cmms/domain/models/comment_model.dart';

// import 'package:cmms/domain/models/facility_model.dart';
// import 'package:cmms/domain/models/mc_task_list_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:scrollable_table_view/scrollable_table_view.dart';

// class ModuleCleaningListExecutionController extends GetxController {
//   ModuleCleaningListExecutionController(
//     this.moduleCleaningListExecutionPresenter,
//   );
//   ModuleCleaningListExecutionPresenter moduleCleaningListExecutionPresenter;
//   final HomeController homecontroller = Get.find();

//   TextEditingController commentTextFieldCtrlr = TextEditingController();

//   ///MC task list
//   RxList<MCTaskListModel?> mcTaskList = <MCTaskListModel?>[].obs;
//   RxList<MCTaskListModel?> filteredData = <MCTaskListModel>[].obs;

//   MCTaskListModel? mcTaskModelList;
//   RxList<String> mcTaskListTableColumns = <String>[].obs;

//   ///Date Range
//   Rx<DateTime> fromDate = DateTime.now().obs;
//   Rx<DateTime> toDate = DateTime.now().obs;
//   bool openFromDateToStartDatePicker = false;
//   String get formattedFromdate =>
//       DateFormat('dd/MM/yyyy').format(fromDate.value);
//   String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);

//   PaginationController paginationController = PaginationController(
//     rowCount: 0,
//     rowsPerPage: 10,
//   );
//   RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
//   Rx<String> selectedBlock = ''.obs;
//   StreamSubscription<int>? facilityIdStreamSubscription;
//   int facilityId = 0;
//   @override
//   void onInit() async {
//     facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
//       facilityId = event;
//       getMCTaskList(facilityId, formattedTodate, formattedFromdate, true);
//       super.onInit();
//     });
//   }

//   Future<void> getFacilityList({bool? isLoading}) async {
//     facilityList.value = <FacilityModel>[];
//     List<FacilityModel?>? _facilityList = <FacilityModel?>[];

//     _facilityList =
//         await moduleCleaningListExecutionPresenter.getFacilityList();
//     if (_facilityList != null && _facilityList.isNotEmpty) {
//       facilityList.value = _facilityList;
//     }
//     if (facilityList.isNotEmpty) {
//       selectedBlock.value = facilityList[0]?.name ?? '';
//     }
//   }

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

//   void abandonExecutionButton({int? id}) async {
//     {
//       String _comment = commentTextFieldCtrlr.text.trim();

//       CommentModel commentAbandonModel =
//           CommentModel(id: id, comment: _comment);

//       var abandoneJsonString = commentAbandonModel.toJson();
//       // print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
//       Map<String, dynamic>? response =
//           await moduleCleaningListExecutionPresenter.abandonExecutionButton(
//         abandoneJsonString: abandoneJsonString,
//         isLoading: true,
//       );
//       if (response == true) {
//         //getCalibrationList(facilityId, true);
//       }
//     }
//   }

//   void search(String keyword) {
//     if (keyword.isEmpty) {
//       mcTaskList.value = filteredData;
//       return;
//     }

//     mcTaskList.value = filteredData
//         .where((item) =>
//             item!.responsibility!.toLowerCase().contains(keyword.toLowerCase()))
//         .toList();
//     update(['mc_task_list']);
//   }

//   Future<void> getMCTaskList(int facilityId, dynamic startDate, dynamic endDate,
//       bool isLoading) async {
//     mcTaskList.value = <MCTaskListModel>[];

//     final list = await moduleCleaningListExecutionPresenter.getMCTaskList(
//         isLoading: isLoading,
//         start_date: startDate, //// "2020-01-01",
//         end_date: endDate,
//         facility_id: facilityId);

//     for (var mc_task_list in list) {
//       mcTaskList.add(mc_task_list);
//     }

//     if (list != null) {
//       mcTaskList.value = list;
//       filteredData.value = mcTaskList.value;
//       paginationController = PaginationController(
//         rowCount: mcTaskList.length,
//         rowsPerPage: 10,
//       );
//       if (filteredData != null && filteredData.isNotEmpty) {
//         mcTaskModelList = filteredData[0];
//         var mcTaskListJson = mcTaskModelList?.toJson();
//         mcTaskListTableColumns.value = <String>[];
//         for (var key in mcTaskListJson?.keys.toList() ?? []) {
//           mcTaskListTableColumns.add(key);
//         }
//       }
//     }

//     update(['mc_task_list']);
//   }

//   // Future<void> viewMCExecution({int? id,  planId}) async {
//   //   Get.toNamed(Routes.viewModuleCleaningExecutionScreen, arguments: {"id": id, "planId": planId});
//   //   print('Argument$id');

//   //   print('Argument$planId');
//   // }

//   // Future<void> StartEndMCExecution({Map<String, dynamic>? dataList}) async {
//   //   Get.toNamed(Routes.addModuleCleaningExecutionContentWeb, arguments: dataList, );
//   //   // Get.toNamed(Routes.addModuleCleaningExecutionContentWeb, arguments: planId,);

//   //   print('Argument$dataList');
//   // }
// }
