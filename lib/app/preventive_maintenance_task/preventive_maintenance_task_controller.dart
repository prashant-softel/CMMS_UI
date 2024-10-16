import 'dart:async';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/preventive_maintenance_task/preventive_maintenance_task_presenter.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../domain/models/new_permit_list_model.dart';
import '../../domain/models/pm_task_model.dart';
import '../home/home_controller.dart';

class PreventiveMaintenanceTaskController extends GetxController {
  ///
  PreventiveMaintenanceTaskController(
    this.preventiveMaintenanceTaskPresenter,
  );
  PreventiveMaintenanceTaskPresenter preventiveMaintenanceTaskPresenter;
  final HomeController homecontroller = Get.find();

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  // For sorting
  RxString currentSortColumn = ''.obs;
  RxBool isAscending = true.obs;
  RxList<PmTaskListModel?> pmTaskList = <PmTaskListModel?>[].obs;
  RxList<PmTaskListModel?> filteredData = <PmTaskListModel>[].obs;
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
  PmTaskListModel? pmTaskListModel;
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
  RxString idFilterText = ''.obs;
  RxString titleFilterText = ''.obs;
  RxString lastDoneDateFilterText = ''.obs;
  RxString dueDateFilterText = ''.obs;
  RxString doneDateFilterText = ''.obs;

  RxString frequencyFilterText = ''.obs;
  RxString assignFilterText = ''.obs;
  RxString ptwFilterText = ''.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "PM Task Id": true,
    "PM Task Title": true,
    "Last Done Date": true,
    "Due Date": true,
    "Done Date": true,
    "Order Frequency": true,
    "Assigned To": true,
    "PTW": true,
  });
  Rx<int> pmTaskId = 0.obs;

  final Map<String, double> columnwidth = {
    "PM Task Id": 200,
    "PM Task Title": 300,
    "Last Done Date": 200,
    "Due Date": 200,
    "Done Date": 200,
    "Order Frequency": 200,
    "Assigned To": 150,
    "PTW": 150,
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    // print({"updated columnVisibility": columnVisibility});
  }

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    this.filterText = {
      "PM Task Id": idFilterText,
      "PM Task Title": titleFilterText,
      "Last Done Date": lastDoneDateFilterText,
      "Due Date": dueDateFilterText,
      "Done Date": doneDateFilterText,
      "Order Frequency": frequencyFilterText,
      "Assigned To": assignFilterText,
      "PTW": ptwFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      if (facilityId > 0) {
        getPmTaskList(facilityId, formattedTodate1, formattedFromdate1, false,false);
      }

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

    List<PmTaskListModel?> filteredList = filteredData
        .where((item) =>
            (item?.name?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false) ||
            (item?.last_done_date
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.due_date?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.done_date?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.assigned_to_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.permit_code
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.task_code?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.id?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.frequency_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    pmTaskList.value = filteredList;

    // pmTaskList.value = filteredData
    //     .where((item) => item!.maintenance_order_number!
    //         .toLowerCase()
    //         .contains(keyword.toLowerCase()))
    //     .toList();
  }

  Future<void> getPmTaskList(int facilityId, dynamic startDate, dynamic endDate,
      bool? isExport, bool self_view) async {
    pmTaskList.value = <PmTaskListModel>[];
    // pmTaskList?.clear();

      bool selfview = varUserAccessModel.value.access_list!
            .where((e) =>
                e.feature_id == UserAccessConstants.kPmTaskFeatureId &&
                e.selfView == UserAccessConstants.kHaveSelfViewAccess)
            .length >
        0;


    final _pmTaskList = await preventiveMaintenanceTaskPresenter.getPmTaskList(
      facilityId: facilityId,
      isLoading: isLoading.value,
      startDate: startDate,
      endDate: endDate,
      isExport: isExport,
       self_view: selfview,
    );
    if (_pmTaskList != null) {
      pmTaskList.value = _pmTaskList;
      filteredData.value = pmTaskList.value;
      isLoading.value = false;
    }
  }

  void getPmTaskListByDate() {
    getPmTaskList(facilityId, formattedTodate1, formattedFromdate1, false,false);
  }

  void clearStoreData() {
    preventiveMaintenanceTaskPresenter.clearValue();
  }

  void clearStoreDatatype() {
    preventiveMaintenanceTaskPresenter.clearValuetype();
  }

  void isDeleteDialog({String? task_id, String? task}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the task: ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: task,
                    style: TextStyle(
                      color: ColorValues.orangeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
          ),
        ]),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('NO'),
              ),
              TextButton(
                onPressed: () {
                  deletePmTask(task_id).then((value) {
                    Get.back();
                    getPmTaskList(facilityId, formattedTodate1,
                        formattedFromdate1, false,false);
                  });
                },
                child: Text('YES'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> deletePmTask(String? task_id) async {
    {
      await preventiveMaintenanceTaskPresenter.deletePmTask(
        task_id,
        facilityId,
        isLoading: true,
      );
    }
  }

  void export() {
    getPmTaskList(facilityId, formattedTodate1, formattedFromdate1, true,true);
  }
  //

  void sortData(String columnName) {
    if (currentSortColumn.value == columnName) {
      isAscending.value = !isAscending.value;
    } else {
      currentSortColumn.value = columnName;
      isAscending.value = true;
    }

    switch (columnName) {
      case 'PM Task Id':
        pmTaskList.sort((a, b) => isAscending.value
            ? (a?.id ?? 0).compareTo(b?.id ?? 0)
            : (b?.id ?? 0).compareTo(a?.id ?? 0));
        break;
      case 'PM Task Title':
        pmTaskList.sort((a, b) => isAscending.value
            ? (a?.name ?? '').compareTo(b?.name ?? '')
            : (b?.name ?? '').compareTo(a?.name ?? ''));
        break;
      case 'Last Done Date':
        pmTaskList.sort((a, b) => isAscending.value
            ? (a?.last_done_date ?? '').compareTo(b?.last_done_date ?? '')
            : (b?.last_done_date ?? '').compareTo(a?.last_done_date ?? ''));
        break;
      case 'Due Date':
        pmTaskList.sort((a, b) => isAscending.value
            ? (a?.due_date ?? '').compareTo(b?.due_date ?? '')
            : (b?.due_date ?? '').compareTo(a?.due_date ?? ''));
        break;
      case 'Done Date':
        pmTaskList.sort((a, b) => isAscending.value
            ? (a?.done_date ?? '').compareTo(b?.done_date ?? '')
            : (b?.done_date ?? '').compareTo(a?.done_date ?? ''));
        break;
      case 'Order Frequency':
        pmTaskList.sort((a, b) => isAscending.value
            ? (a?.frequency_name ?? '').compareTo(b?.frequency_name ?? '')
            : (b?.frequency_name ?? '').compareTo(a?.frequency_name ?? ''));
        break;
      case 'Assigned To':
        pmTaskList.sort((a, b) => isAscending.value
            ? (a?.assigned_to_name ?? '').compareTo(b?.assigned_to_name ?? '')
            : (b?.assigned_to_name ?? '').compareTo(a?.assigned_to_name ?? ''));
        break;
      case 'PTW':
        pmTaskList.sort((a, b) => isAscending.value
            ? (a?.permit_code ?? '').compareTo(b?.permit_code ?? '')
            : (b?.permit_code ?? '').compareTo(a?.permit_code ?? ''));
        break;
      default:
        break;
    }
    update();
  }
}
