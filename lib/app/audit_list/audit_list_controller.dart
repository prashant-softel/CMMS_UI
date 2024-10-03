import 'dart:async';

import 'package:cmms/app/audit_list/audit_list_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/audit_plan_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class AuditListScreenController extends GetxController {
  AuditListScreenController(
    this.auditListPresenter,
  );
  AuditListScreenPresenter auditListPresenter;
  final HomeController homecontroller = Get.find();
  RxList<AuditPlanListModel> auditPlanList = <AuditPlanListModel>[].obs;
  RxList<AuditPlanListModel> filteredData = <AuditPlanListModel>[].obs;
  // Rx<int> Plan Id = 0.obs;
  Rx<int> PlanId = 0.obs;
  RxString planIdFilterText = ''.obs;
  RxString planTitleFilterText = ''.obs;
  RxString noOfDaysFilterText = ''.obs;
  RxString createdByFilterText = ''.obs;
  RxString frequencyFilterText = ''.obs;
  RxString startdateFilterText = ''.obs;

  RxString statusFilterText = ''.obs;

  //Start DateTime
  bool openStartDatePicker = false;
  var startDateTimeCtrlr = TextEditingController();

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    'Plan ID': true,
    'Title': true,
    'Checklist': true,
    'Site Name': true,
    'Start Date': true,
    'Frequency Name': true,
  });
  // final Map<String, double> columnwidth = {
  //   'Plan ID': 153,
  //   'Title': 320,
  //   'Checklist': 220,
  //   'Site Name': 200,
  //   'Start Date': 250,
  //   'Frequency Name': 250,
  // };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> type = 0.obs;

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    await setType();

    this.filterText = {
      'Plan ID': planIdFilterText,
      'Title': planTitleFilterText,
      'Checklist': noOfDaysFilterText,
      'Site Name': createdByFilterText,
      'Start Date': frequencyFilterText,
      'Frequency Name': startdateFilterText,
      "Status": statusFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      if (type.value > 0) {
        Future.delayed(Duration(seconds: 2), () async {
          getAuditPlanList(facilityId, formattedTodate1, formattedFromdate1,
              false, type.value);
        });
      }
    });
    super.onInit();
  }

  void export() {
    getAuditPlanList(
        facilityId, formattedTodate1, formattedFromdate1, true, type.value,
        isExportOnly: true);
  }

  Future<void> getAuditPlanList(int facilityId, dynamic startDate,
      dynamic endDate, bool? isExport, int type,
      {bool isExportOnly = false}) async {
    if (!isExportOnly) {
      auditPlanList.value = <AuditPlanListModel>[];
    }

    final _auditPlanList = await auditListPresenter.getAuditPlanList(
        facilityId: facilityId,
        isLoading: isLoading.value,
        isExport: isExport,
        startDate: startDate,
        endDate: endDate,
        type: type);

    if (_auditPlanList != null && !isExportOnly) {
      auditPlanList.value = _auditPlanList;
      isLoading.value = false;
    }

    update(['pmPlan_list']);
  }

  Future<void> setType() async {
    final String? _type = Get.parameters['type'];
    type.value = int.tryParse(_type ?? "") ?? 0;

    // try {
    //   // Read jobId
    //   String? _type = await auditListPresenter.getValue();
    //   if (_type == null || _type == '' || _type == "null") {
    //     var dataFromPreviousScreen = Get.arguments;

    //     type.value = dataFromPreviousScreen['type'];
    //     auditListPresenter.saveValue(type: type.value.toString());
    //   } else {
    //     type.value = int.tryParse(_type) ?? 0;
    //   }
    // } catch (e) {
    //   print(e.toString() + 'type');
    //   //  Utility.showDialog(e.toString() + 'type');
    // }
  }

  void getAuditListByDate() {
    getAuditPlanList(
        facilityId, formattedTodate1, formattedFromdate1, false, type.value);
  }

  Future<void> clearValue() async {
    auditListPresenter.clearValue();
  }

  void clearStoreIdData() {
    auditListPresenter.clearStoreIdData();
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
                    deleteAuditPlan(planId).then((value) {
                      Get.back();
                      getAuditPlanList(facilityId, formattedTodate1,
                          formattedFromdate1, false, type.value);
                    });
                  },
                  text: 'Yes'),
            ],
          )
        ],
      ),
    );
  }

  Future<void> deleteAuditPlan(String? planId) async {
    {
      await auditListPresenter.deleteAuditPlan(
        planId,
        isLoading: true,
      );
    }
  }
}
