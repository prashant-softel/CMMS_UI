import 'dart:async';

import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/pm_plan_list/pm_plan_list_presenter.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/pm_plan_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../domain/models/new_permit_list_model.dart';
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
  RxList<PmPlanListModel?> pmPlanList = <PmPlanListModel?>[].obs;
  RxList<PmPlanListModel?> filteredData = <PmPlanListModel>[].obs;
  bool openFromDateToStartDatePicker = false;
  RxList<NewPermitModel?>? permitList = <NewPermitModel>[].obs;
  var permitDropdownValues = <String?>[].obs;
  // For sorting
  RxString currentSortColumn = ''.obs;
  RxBool isAscending = true.obs;
  final selectedPermit = Rx<NewPermitModel?>(null);
  Rx<int?> selectedPermitId = 0.obs;
  Rx<bool> isPermitLinked = false.obs;
  int permitValuesCount = 6;
  var permitValues;
  late List<TextEditingController> textControllers;
  RxString responseMessage = ''.obs;
  int permitscheduleId = 0;
  PmPlanListModel? pmPlanListModel;
  RxList<String> pmPlanListTableColumns = <String>[].obs;
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

  RxString idFilterText = ''.obs;
  RxString tittleFilterText = ''.obs;
  RxString lastDoneDateFilterText = ''.obs;
  RxString nextScheduleDateFilterText = ''.obs;
  RxString frequencyFilterText = ''.obs;
  RxString createdByFilterText = ''.obs;

  Rx<int> pmPlanId = 0.obs;
  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Plan ID": true,
    "Plan Title": true,
    "Start Date": true,
    "Next Schedule Date": true,
    "Frequency ": true,
    "Created By": true,
  });

  final Map<String, double> columnwidth = {
    "Plan ID": 180,
    "Plan Title": 250,
    "Start Date": 180,
    "Next Schedule Date": 230,
    "Frequency ": 150,
    "Created By": 150,
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
      "Plan ID": idFilterText,
      "Plan Title": tittleFilterText,
      "Start Date": lastDoneDateFilterText,
      "Next Schedule Date": nextScheduleDateFilterText,
      "Frequency ": frequencyFilterText,
      "Created By": createdByFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      if (facilityId > 0) {
        //Future.delayed(Duration(seconds: 2), () async {
        getPmPlanList(facilityId, formattedTodate1, formattedFromdate1, false
        // ,
        // false
        );
        //   });
      }

      // isDataLoading.value = false;

      // Future.delayed(Duration(seconds: 2), () async {
      // });
    });

    super.onInit();
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      pmPlanList.value = filteredData.value;
      return;
    }
    List<PmPlanListModel?> filteredList = filteredData
        .where((item) =>
            (item?.plan_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.created_at
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.updated_at
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.plan_freq_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.created_by_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.status_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    pmPlanList.value = filteredList;
  }

  void export() {
    getPmPlanList(facilityId, formattedTodate1, formattedFromdate1, true,
    // true,
        isExportOnly: true);
  }

  Future<void> getPmPlanList(
      int facilityId, dynamic startDate, dynamic endDate, bool? isExport,
      // bool self_view,
      {bool isExportOnly = false}) async {
    if (!isExportOnly) {
      pmPlanList.value = <PmPlanListModel>[];
      filteredData.value = <PmPlanListModel>[];
    }
      // bool selfview = varUserAccessModel.value.access_list!
      //       .where((e) =>
      //           e.feature_id == UserAccessConstants.kPmPlanFeatureId &&
      //           e.selfView == UserAccessConstants.kHaveSelfViewAccess)
      //       .length >
      //   0;


    final _pmPlanList = await pmPlanListPresenter.getPmPlanList(
        facilityId: facilityId,
        isLoading: isLoading.value,
        startDate: startDate,
        endDate: endDate,
        //  self_view: selfview,
        isExport: isExport);

    if (_pmPlanList != null && !isExportOnly) {
      pmPlanList.value = _pmPlanList;
      filteredData.value = pmPlanList.value;
      isLoading.value = false;

      paginationController = PaginationController(
        rowCount: filteredData.length,
        rowsPerPage: 10,
      );

      if (filteredData.isNotEmpty) {
        pmPlanListModel = filteredData[0];
        var calibrationListJson = pmPlanListModel?.toJson();
        pmPlanListTableColumns.value = <String>[];
        for (var key in calibrationListJson?.keys.toList() ?? []) {
          pmPlanListTableColumns.add(key);
        }
      }
    }

    update(['pmPlan_list']);
  }

  void getPmPlanListByDate() {
    getPmPlanList(facilityId, formattedTodate1, formattedFromdate1, false,
    // false
    );
  }

  void isDeleteDialog({String? planId, String? planName}) {
    Get.dialog(
      AlertDialog(
        content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Delete Plan", style: Styles.blackBold16),
              Divider(
                color: ColorValues.appLightGreyColor,
              ),
              Dimens.boxHeight5,
              RichText(
                text: TextSpan(
                    text: 'Are you sure you want to delete the PM Plan ',
                    style: Styles.blackBold16,
                    children: [
                      TextSpan(
                        text: "${planName}",
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
              CustomElevatedButton(
                  backgroundColor: ColorValues.appRedColor,
                  onPressed: () {
                    Get.back();
                  },
                  text: 'No'),
              CustomElevatedButton(
                  backgroundColor: ColorValues.appGreenColor,
                  onPressed: () {
                    deletePmPlan(planId).then((value) {
                      Get.back();
                      getPmPlanList(facilityId, formattedTodate1,
                          formattedFromdate1, false,
                          // false
                          );
                    });
                  },
                  text: 'Yes'),
            ],
          )
        ],
      ),
    );
  }

  Future<void> deletePmPlan(String? planId) async {
    {
      await pmPlanListPresenter.deletePmPlan(
        planId,
        isLoading: true,
      );
    }
  }

  void clearStoreData() {
    pmPlanListPresenter.clearValue();
  }

  void sortData(String columnName) {
    if (currentSortColumn.value == columnName) {
      isAscending.value = !isAscending.value;
    } else {
      currentSortColumn.value = columnName;
      isAscending.value = true;
    }
    switch (columnName) {
      case 'Plan ID':
        pmPlanList.sort((a, b) => isAscending.value
            ? (a?.plan_id ?? 0).compareTo(b?.plan_id ?? 0)
            : (b?.plan_id ?? 0).compareTo(a?.plan_id ?? 0));
        break;
      case 'Plan Title':
        pmPlanList.sort((a, b) => isAscending.value
            ? (a?.plan_name ?? '').compareTo(b?.plan_name ?? '')
            : (b?.plan_name ?? '').compareTo(a?.plan_name ?? ''));
        break;
      case 'Start Date':
        pmPlanList.sort((a, b) => isAscending.value
            ? (a?.plan_date ?? '').compareTo(b?.plan_date ?? '')
            : (b?.plan_date ?? '').compareTo(a?.plan_date ?? ''));
        break;
      case 'Next Schedule Date':
        pmPlanList.sort((a, b) => isAscending.value
            ? (a?.next_schedule_date ?? '')
                .compareTo(b?.next_schedule_date ?? '')
            : (b?.next_schedule_date ?? '')
                .compareTo(a?.next_schedule_date ?? ''));
        break;
      case 'Frequency':
        pmPlanList.sort((a, b) => isAscending.value
            ? (a?.plan_freq_name ?? '').compareTo(b?.plan_freq_name ?? '')
            : (b?.plan_freq_name ?? '').compareTo(a?.plan_freq_name ?? ''));
        break;

      case 'Created By':
        pmPlanList.sort((a, b) => isAscending.value
            ? (a?.created_by_name ?? '').compareTo(b?.created_by_name ?? '')
            : (b?.created_by_name ?? '').compareTo(a?.created_by_name ?? ''));
        break;
      default:
        break;
    }
    update();
  }
}

