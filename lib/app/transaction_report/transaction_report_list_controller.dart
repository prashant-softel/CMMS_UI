import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/transaction_report/transaction_report_list_presenter.dart';
import 'package:cmms/domain/models/%20%20transaction_report_list_model.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/job_card_model.dart';
import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:cmms/domain/models/user_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class TransactionReportListController extends GetxController {
  TransactionReportListController(
    this.transactionReportListPresenter,
  );
  TransactionReportListPresenter transactionReportListPresenter;
  final HomeController homecontroller = Get.find();
  RxList<TransactionReportListModel?> transactionReportList =
      <TransactionReportListModel?>[].obs;
  RxList<TransactionReportListModel> filteredData =
      <TransactionReportListModel>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;

  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  TransactionReportListModel? transactionReportListModel;
  RxList<String> transactionReportListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<JobCardModel?> jobList = <JobCardModel?>[].obs;
  RxList<BusinessListModel?>? businessNameList = <BusinessListModel?>[].obs;
  Rx<int> fromActorID = 0.obs;
  RxList<TypeModel> actorType = <TypeModel>[
    TypeModel(name: 'Vendor', id: "1"),
    TypeModel(name: 'Store', id: "2"),
    TypeModel(name: 'Task', id: "3"),
    TypeModel(name: 'JobCard', id: "4"),
    TypeModel(name: 'Engineer', id: "5"),
    TypeModel(name: 'Inventory', id: "6"),
  ].obs;
  Rx<bool> isSelectedactorType = true.obs;
  int selectedactorTypeId = 0;
  Rx<String> selectedActorType = ''.obs;

  RxString fromActorIDFilterText = ''.obs;
  RxString fromActorTypeFilterText = ''.obs;
  RxString fromActorNameFilterText = ''.obs;
  RxString toActorTypeFilterText = ''.obs;
  RxString toActorNameFilterText = ''.obs;
  RxString assetItemNameFilterText = ''.obs;
  RxString qtyFilterText = ''.obs;
  RxString lastUpdatedFilterText = ''.obs;
  RxString statusFilterText = ''.obs;

  RxString vendorFilterText = ''.obs;
  RxList<InventoryModel?> inventoryNameList = <InventoryModel>[].obs;

  RxString userDateFilterText = ''.obs;
  RxList<PmTaskListModel?> pmTaskList = <PmTaskListModel?>[].obs;
  Rx<bool> isSelectedpmtask = true.obs;
  int selectedpmtaskId = 0;
  Rx<String> selectedpmtask = ''.obs;
  RxList<FacilityModel?> facilityNameList = <FacilityModel>[].obs;
  RxList<UserListModel?> userList = <UserListModel?>[].obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "From Actor ID": true,
    "From Actor Type": true,
    "From Actor Name": true,
    "To Actor Type": true,
    "To Actor Name": true,
    "Asset Item Name": true,
    "Qty": true,
    "Last Updated": true,
    // "Status": true

    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "From Actor ID": 153,
    "From Actor Type": 220,
    "From Actor Name": 200,
    "To Actor Type": 200,
    "To Actor Name": 223,
    "Asset Item Name": 153,
    "Qty": 130,
    "Last Updated": 120,
    // "Status": 100
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  @override
  void onInit() async {
    selectedActorType.value = actorType[2].name;
    selectedactorTypeId = int.tryParse(actorType[2].id ?? "") ?? 0;

    this.filterText = {
      "From Actor ID": fromActorIDFilterText,
      "From Actor Type": fromActorTypeFilterText,
      "From Actor Name": fromActorNameFilterText,
      "To Actor Type": toActorTypeFilterText,
      "To Actor Name": toActorNameFilterText,
      "Asset Item Name": assetItemNameFilterText,
      "Qty": qtyFilterText,
      "Last Updated": lastUpdatedFilterText,
      // "Status": statusFilterText
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () async {
        if (selectedactorTypeId == 3) {
          getPmTaskList(
              facilityId, formattedTodate1, formattedFromdate1, false);
        }
      });
    });
    super.onInit();
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      transactionReportList.value = filteredData;
      return;
    }

    transactionReportList.value = filteredData
        .where((item) =>
            item.assetItemName!.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
    update(['stock_Mangement_Date']);
  }

  Future<void> getPmTaskList(int facilityId, dynamic startDate, dynamic endDate,
      bool isLoading) async {
    pmTaskList.value = <PmTaskListModel>[];
    // pmTaskList?.clear();
    final _pmTaskList = await transactionReportListPresenter.getPmTaskList(
        facilityId: facilityId,
        isLoading: isLoading,
        startDate: startDate,
        endDate: endDate);
    if (_pmTaskList != null) {
      for (var taskName in _pmTaskList) {
        pmTaskList.add(taskName);
      }
      selectedpmtaskId = pmTaskList[0]!.id ?? 0;
      selectedpmtask.value = pmTaskList[0]!.name ?? "";
      transactionReport(
          facilityId: facilityId,
          startDate: formattedTodate1,
          actorType: selectedactorTypeId,
          actorID: selectedpmtaskId,
          endDate: formattedFromdate1,
          isLoading: false);
    }
  }

  Future<void> transactionReport(
      {int? facilityId,
      dynamic startDate,
      int? actorType,
      int? actorID,
      dynamic endDate,
      bool? isLoading}) async {
    transactionReportList.value = <TransactionReportListModel>[];
    final _goodsordersList =
        await transactionReportListPresenter.transactionReport(
      isLoading: true,
      start_date: startDate,
      end_date: endDate,
      actorID: actorID,
      actorType: 3,
      facility_id: facilityId,
    );
    transactionReportList.value = _goodsordersList;
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<TypeModel>:
        {
          int userIndex = actorType.indexWhere((x) => x.name == value);
          selectedactorTypeId =
              int.tryParse(actorType[userIndex].id ?? "") ?? 0;
          selectedActorType.value = actorType[userIndex].name;
          if (selectedactorTypeId == 3) {
            getPmTaskList(
                facilityId, formattedTodate1, formattedFromdate1, false);
          } else if (selectedactorTypeId == 2) {
            getFacilityList();
          } else if (selectedactorTypeId == 4) {
            jobCardList(facilityId, true);
          } else if (selectedactorTypeId == 5) {
            getUserList(facilityId, true);
          } else if (selectedactorTypeId == 6) {
            inventoryList(facilityId: facilityId);
          } else if (selectedactorTypeId == 1) {
            //  getBusinessList();
          }
        }
        break;
      case RxList<PmTaskListModel?>:
        {
          int pmtaskIndex = pmTaskList.indexWhere((x) => x!.name == value);
          selectedpmtaskId = pmTaskList[pmtaskIndex]!.id ?? 0;
          selectedpmtask.value = value;
          transactionReport(
              facilityId: facilityId,
              startDate: formattedTodate1,
              actorType: selectedactorTypeId,
              actorID: selectedpmtaskId,
              endDate: formattedFromdate1,
              isLoading: false);
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<void> inventoryList({int? facilityId}) async {
    inventoryNameList.value = <InventoryModel>[];

    final _equipmentNameList =
        await transactionReportListPresenter.inventoryList(
      isLoading: true,
      facilityId: facilityId,
    );
    if (_equipmentNameList != null) {
      for (var equipmentName in _equipmentNameList) {
        inventoryNameList.add(equipmentName);
      }
    }
  }

  Future<void> getBusinessList() async {
    businessNameList?.value = <BusinessListModel>[];
    final _businessNameList =
        await transactionReportListPresenter.getBusinessList();

    if (_businessNameList != null) {
      businessNameList!.value = _businessNameList;

      for (var businessName in _businessNameList) {
        businessNameList?.add(businessName);
      }
    }
  }

  Future<void> getUserList(int facilityId, bool isLoading) async {
    userList.value = <UserListModel>[];
    final list = await transactionReportListPresenter.getUserList(
        facilityId: facilityId, isLoading: isLoading);
    if (list != null) {
      for (var _userList in list) {
        userList.add(_userList);
      }
    }
  }

  void getTransactionListByDate() {
    transactionReport(
        facilityId: facilityId,
        startDate: formattedTodate1,
        // actorType: actorType,
        actorID: facilityId,
        endDate: formattedFromdate1,
        isLoading: false);
  }

  Future<void> getFacilityList() async {
    facilityNameList.value = <FacilityModel>[];
    final _facilityNameList =
        await transactionReportListPresenter.getFacilityList(
      isLoading: true,
      // categoryIds: categoryIds,
    );
    for (var facility_list in _facilityNameList!) {
      facilityNameList.add(facility_list);
    }

    update(['permit_facility_list']);
  }

  Future<void> jobCardList(int facilityId, bool isLoading) async {
    jobList.value = <JobCardModel>[];
    final _jobList = await transactionReportListPresenter.jobCardList(
        facilityId: facilityId, isLoading: isLoading);

    for (var job_list in _jobList!) {
      jobList.add(job_list);
    }
    update(['job_list']);
  }
}
