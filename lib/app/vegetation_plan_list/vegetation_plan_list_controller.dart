// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/vegetation_plan_list/vegetation_plan_list_presenter.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/vegetation_list_plan_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class VegetationPlanListController extends GetxController {
  VegetationPlanListController(this.vegetationPlanListPresenter);

  VegetationPlanListPresenter vegetationPlanListPresenter;
  final HomeController homeController = Get.find();

  RxList<VegetationPlanListModel> vegetationPlanList =
      <VegetationPlanListModel>[].obs;
  VegetationPlanListModel? vegPlan;
  RxList<VegetationPlanListModel> filteredData =
      <VegetationPlanListModel>[].obs;
  RxString currentSortColumn = ''.obs;
  RxBool isAscending = true.obs;

  Rx<int> PlanId = 0.obs;
  RxString planIdFilterText = ''.obs;
  RxString planTitleFilterText = ''.obs;
  RxString noOfDaysFilterText = ''.obs;
  RxString createdByFilterText = ''.obs;
  RxString frequencyFilterText = ''.obs;
  RxString statusFilterText = ''.obs;

  bool openStartDatePicker = false;
  var startDateTimeCtrlr = TextEditingController();

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  final columnVisibility = ValueNotifier<Map<String, bool>>({
    'Plan Id': true,
    'Plan Title': true,
    'No of Days': true,
    'Created By': true,
    'Frequency': true,
    // 'Status': true,
    // "search": true,
  });

  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  VegetationPlanListModel? vegetationPlanListModel;
  RxList<String> vegetationPlanListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    this.filterText = {
      'Plan Id': planIdFilterText,
      'Plan Title': planTitleFilterText,
      'No of Days': noOfDaysFilterText,
      'Created By': createdByFilterText,
      'Frequency': frequencyFilterText,
      //"Status": statusFilterText,
    };
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      if (facilityId > 0) {
        Future.delayed(Duration(seconds: 0), () async {
          getVegetationPlanList(facilityId, false);
        });
        print("get plan called");
      }
    });

    super.onInit();
  }

  void export() {
    getVegetationPlanList(facilityId, true, isExportOnly: true);
  }

  Future<void> getVegetationPlanList(int facilityId, bool isExport,
      {bool isExportOnly = false}) async {
    if (!isExportOnly) {
      vegetationPlanList.value = <VegetationPlanListModel>[];
      filteredData.value = <VegetationPlanListModel>[];
    }

    final _vegetationPlanList =
        await vegetationPlanListPresenter.getVegetationPlanList(
            isLoading: isLoading.value,
            facility_id: facilityId,
            isExport: isExport);

    if (!isExportOnly) {
      vegetationPlanList.value = _vegetationPlanList;
      isLoading.value = false;
      if (vegetationPlanList.isNotEmpty) {
        filteredData.value = vegetationPlanList.value;
        vegetationPlanListModel = vegetationPlanList[0];
        var vegetationPlanListJson = vegetationPlanListModel?.toJson();
        vegetationPlanListTableColumns.value = <String>[];
        for (var key in vegetationPlanListJson?.keys.toList() ?? []) {
          vegetationPlanListTableColumns.add(key);
        }
      }
      paginationController = PaginationController(
        rowCount: vegetationPlanList.length,
        rowsPerPage: 10,
      );
    }
  }

  void clearStoreData() {
    vegetationPlanListPresenter.clearValue();
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      vegetationPlanList.value = filteredData.value;
      return;
    }
    List<VegetationPlanListModel> filteredList = filteredData
        .where((item) =>
            (item.title
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.noOfCleaningDays
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.createdBy
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.frequency
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.statusShort
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.planId
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    vegetationPlanList.value = filteredList;
  }

  Future<void> deleteVegPlan(int? planId) async {
    await vegetationPlanListPresenter.deleteVegPlan(
        planId: planId ?? 0, isLoading: true, facilityId: facilityId);
  }

  void getVegListByDate() {
    getVegetationPlanList(facilityId, false);
  }

  void isDeleteDialog({int? planId, String? planName}) {
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
                    text:
                        'Are you sure you want to delete the Vegetation Plan ',
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
                text: 'No',
              ),
              CustomElevatedButton(
                backgroundColor: ColorValues.appGreenColor,
                onPressed: () {
                  deleteVegPlan(planId).then((value) {
                    Get.back();
                    getVegetationPlanList(facilityId, false);
                  });
                },
                text: 'Yes',
              ),
            ],
          )
        ],
      ),
    );
  }

  void sortData(String columnName) {
    if (currentSortColumn.value == columnName) {
      isAscending.value = !isAscending.value;
    } else {
      currentSortColumn.value = columnName;
      isAscending.value = true;
    }

    switch (columnName) {
      case 'Plan Id':
        vegetationPlanList.sort((a, b) => isAscending.value
            ? a.planId!.compareTo(b.planId!)
            : b.planId!.compareTo(a.planId!));
        break;
      case 'Plan Title':
        vegetationPlanList.sort((a, b) => isAscending.value
            ? a.title!.compareTo(b.title!)
            : b.title!.compareTo(a.title!));
        break;
      case 'No of Days':
        vegetationPlanList.sort((a, b) => isAscending.value
            ? a.noOfCleaningDays!.compareTo(b.noOfCleaningDays!)
            : b.noOfCleaningDays!.compareTo(a.noOfCleaningDays!));
        break;
      case 'Created By':
        vegetationPlanList.sort((a, b) => isAscending.value
            ? a.createdBy!.compareTo(b.createdBy!)
            : b.createdBy!.compareTo(a.createdBy!));
        break;
      case 'Frequency':
        vegetationPlanList.sort((a, b) => isAscending.value
            ? a.frequency!.compareTo(b.frequency!)
            : b.frequency!.compareTo(a.frequency!));
        break;
      default:
        break;
    }

    update(); // Trigger UI update after sorting
  }
  void sortData(String columnName) {
    if (currentSortColumn.value == columnName) {
      isAscending.value = !isAscending.value;
    } else {
      currentSortColumn.value = columnName;
      isAscending.value = true;
    }

    switch (columnName) {
      case 'Plan Id':
        vegetationPlanList.sort((a, b) => isAscending.value
            ? (a.planId ?? 0).compareTo(b.planId ?? 0)
            : (b.planId ?? 0).compareTo(a.planId ?? 0));
        break;
      case 'Plan Title':
        vegetationPlanList.sort((a, b) => isAscending.value
            ? (a.title ?? '').compareTo(b.title ?? '')
            : (b.title ?? '').compareTo(a.title ?? ''));
        break;
      case 'No of Days':
        vegetationPlanList.sort((a, b) => isAscending.value
            ? (a.noOfCleaningDays ?? 0).compareTo(b.noOfCleaningDays ?? 0)
            : (b.noOfCleaningDays ?? 0).compareTo(a.noOfCleaningDays ?? 0));
        break;
      case 'Created By':
        vegetationPlanList.sort((a, b) => isAscending.value
            ? (a.createdBy ?? '').compareTo(b.createdBy ?? '')
            : (b.createdBy ?? '').compareTo(a.createdBy ?? ''));
        break;
      case 'Frequency':
        vegetationPlanList.sort((a, b) => isAscending.value
            ? (a.frequency ?? '').compareTo(b.frequency ?? '')
            : (b.frequency ?? '').compareTo(a.frequency ?? ''));
        break;
      default:
        break;
    }
    update();
  }
}
