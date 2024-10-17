import 'dart:async';

import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/transaction_report/transaction_report_list_presenter.dart';
import 'package:cmms/app/utils/app_constants.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:cmms/domain/models/transaction_report_list_model.dart';
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
  RxList<TransactionReportListModel?> filteredData =
      <TransactionReportListModel?>[].obs;
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
  RxList<BusinessListModel?>? businessNameList = <BusinessListModel>[].obs;
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
  RxString assettypeFilterText = ''.obs;
  RxString qtyFilterText = ''.obs;
  RxString lastUpdatedFilterText = ''.obs;
  RxString statusFilterText = ''.obs;

  RxString vendorFilterText = ''.obs;
  RxList<InventoryModel?> inventoryNameList = <InventoryModel>[].obs;
  Rx<bool> isSelectedInventory = true.obs;
  int selectedInventoryId = 0;
  Rx<String> selectedInventory = ''.obs;
  RxString userDateFilterText = ''.obs;
  RxList<PmTaskListModel?> pmTaskList = <PmTaskListModel>[].obs;
  Rx<bool> isSelectedpmtask = true.obs;
  int selectedpmtaskId = 0;
  Rx<String> selectedpmtask = ''.obs;
  RxList<FacilityModel?> facilityNameList = <FacilityModel>[].obs;
  Rx<bool> isSelectedfacility = true.obs;
  int selectedfacilityId = 0;
  Rx<String> selectedfacility = ''.obs;
  RxList<UserListModel?> userList = <UserListModel>[].obs;
  Rx<bool> isSelectedUser = true.obs;
  int selectedUserId = 0;
  Rx<String> selectedUser = ''.obs;
  RxList<JobModel?> jobList = <JobModel>[].obs;
  Rx<bool> isSelectedJob = true.obs;
  int selectedJobId = 0;
  Rx<String> selectedJob = ''.obs;

  int actorId = 0;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "From Actor ID": true,
    "From Actor Type": true,
    "From Actor Name": true,
    "To Actor Type": true,
    "To Actor Name": true,
    "Asset Item Name": true,
    "Asset type": true,
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
    "Asset type": 153,
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

  Rx<bool> isLoading = true.obs;
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
      "Asset type": assettypeFilterText,
      "Qty": qtyFilterText,
      "Last Updated": lastUpdatedFilterText,
      // "Status": statusFilterText
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      if (facilityId > 0) {
        Future.delayed(Duration(seconds: 1), () async {
          if (selectedactorTypeId == 3) {
            getPmTaskList(facilityId, formattedTodate1, formattedFromdate1);
          }
        });
      }
    });
    super.onInit();
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      transactionReportList.value = filteredData;
      return;
    }

    List<TransactionReportListModel?> filteredList = filteredData
        .where((item) =>
            (item?.fromActorID
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.fromActorType
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.fromActorName
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.toActorType
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.toActorName
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.assetItemName
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.lastUpdated?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.qty?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false))
        .toList();
    transactionReportList.value = filteredList;
    // update(['stock_Mangement_Date']);
  }

  Future<void> getPmTaskList(
    int facilityId,
    dynamic startDate,
    dynamic endDate,
  ) async {
    pmTaskList.value = <PmTaskListModel>[];
    // pmTaskList?.clear();
    final _pmTaskList = await transactionReportListPresenter.getPmTaskList(
      facilityId: facilityId,
      isLoading: isLoading.value,
      startDate: startDate,
      endDate: endDate,
    );
    isLoading.value = false;

    if (_pmTaskList!.isNotEmpty) {
      for (var taskName in _pmTaskList) {
        pmTaskList.add(taskName);
      }
      selectedpmtaskId = pmTaskList[0]!.id ?? 0;
      actorId = selectedpmtaskId;
      selectedpmtask.value = pmTaskList[0]!.name ?? "";
      transactionReport(
          facilityId: facilityId,
          startDate: formattedTodate1,
          actorType: selectedactorTypeId,
          actorID: actorId,
          endDate: formattedFromdate1,
          isLoading: isLoading.value);
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
      actorType: actorType,
      facility_id: facilityId,
    );
    filteredData.value = transactionReportList.toList();
    transactionReportList.value = _goodsordersList;
  }

  void onValueChanged(dynamic list, dynamic value) {
    print(value);

    switch (list.runtimeType) {
      case const (RxList<TypeModel>):
        {
          int userIndex = actorType.indexWhere((x) => x.name == value);
          selectedactorTypeId =
              int.tryParse(actorType[userIndex].id ?? "") ?? 0;
          selectedActorType.value = actorType[userIndex].name;
          if (selectedactorTypeId == AppConstants.kTask) {
            getPmTaskList(facilityId, formattedTodate1, formattedFromdate1);
          } else if (selectedactorTypeId == AppConstants.kStore) {
            getFacilityList();
          } else if (selectedactorTypeId == AppConstants.kJobCard) {
            jobCardList(facilityId);
          } else if (selectedactorTypeId == AppConstants.kEngineer) {
            getUserList(facilityId, true);
          } else if (selectedactorTypeId == AppConstants.kInventory) {
            inventoryList(facilityId: facilityId);
          } else if (selectedactorTypeId == AppConstants.kVendor) {
            //  getBusinessList();
          } else if (selectedactorTypeId == AppConstants.kScrap) {
            //  getBusinessList();
          }
        }
        break;
      case const (RxList<PmTaskListModel>):
        {
          int pmtaskIndex = pmTaskList.indexWhere((x) => x!.name == value);
          selectedpmtaskId = pmTaskList[pmtaskIndex]!.id ?? 0;
          actorId = selectedpmtaskId;
          selectedpmtask.value = value;
          transactionReport(
              facilityId: facilityId,
              startDate: formattedTodate1,
              actorType: selectedactorTypeId,
              actorID: actorId,
              endDate: formattedFromdate1,
              isLoading: isLoading.value);
        }
        break;
      case const (RxList<FacilityModel>):
        {
          int facilityIndex =
              facilityNameList.indexWhere((x) => x!.name == value);
          selectedfacilityId = facilityNameList[facilityIndex]!.id;
          actorId = selectedfacilityId;
          selectedfacility.value = value;
          transactionReport(
              facilityId: facilityId,
              startDate: formattedTodate1,
              actorType: selectedactorTypeId,
              actorID: actorId,
              endDate: formattedFromdate1,
              isLoading: isLoading.value);
        }
        break;
      case const (RxList<UserListModel>):
        {
          int userIndex = userList.indexWhere((x) => x!.name == value);
          selectedUserId = userList[userIndex]!.id ?? 0;
          selectedUser.value = value;
          actorId = selectedUserId;
          transactionReport(
              facilityId: facilityId,
              startDate: formattedTodate1,
              actorType: selectedactorTypeId,
              actorID: actorId,
              endDate: formattedFromdate1,
              isLoading: isLoading.value);
        }
        break;
      case const (RxList<InventoryModel>):
        {
          int inventoryIndex =
              inventoryNameList.indexWhere((x) => x!.name == value);
          selectedInventoryId = inventoryNameList[inventoryIndex]!.id ?? 0;
          selectedInventory.value = value;
          actorId = selectedInventoryId;
          transactionReport(
              facilityId: facilityId,
              startDate: formattedTodate1,
              actorType: selectedactorTypeId,
              actorID: actorId,
              endDate: formattedFromdate1,
              isLoading: isLoading.value);
        }
        break;
      case const (RxList<JobModel>):
        {
          int jobIndex = jobList.indexWhere((x) => x!.name == value);
          selectedJobId = jobList[jobIndex]!.id ?? 0;
          selectedJob.value = value;
          actorId = selectedJobId;
          transactionReport(
              facilityId: facilityId,
              startDate: formattedTodate1,
              actorType: selectedactorTypeId,
              actorID: actorId,
              endDate: formattedFromdate1,
              isLoading: isLoading.value);
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
      selectedInventoryId = inventoryNameList[0]!.id ?? 0;
      actorId - selectedInventoryId;
      selectedInventory.value = inventoryNameList[0]!.name ?? "";
      transactionReport(
          facilityId: facilityId,
          startDate: formattedTodate1,
          actorType: selectedactorTypeId,
          actorID: actorId,
          endDate: formattedFromdate1,
          isLoading: true);
    }
  }

  Future<void> getBusinessList() async {
    businessNameList?.value = <BusinessListModel>[];
    final _businessNameList =
        await transactionReportListPresenter.getBusinessList(facilityId);

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
      selectedUserId = userList[0]!.id ?? 0;
      actorId - selectedUserId;
      selectedUser.value = userList[0]!.name ?? "";
      transactionReport(
          facilityId: facilityId,
          startDate: formattedTodate1,
          actorType: selectedactorTypeId,
          actorID: actorId,
          endDate: formattedFromdate1,
          isLoading: true);
    }
  }

  void getTransactionListByDate() {
    if (selectedactorTypeId == AppConstants.kTask) {
      getPmTaskList(facilityId, formattedTodate1, formattedFromdate1);
    } else if (selectedactorTypeId == AppConstants.kStore) {
      getFacilityList();
    } else if (selectedactorTypeId == AppConstants.kJobCard) {
      jobCardList(facilityId);
    } else if (selectedactorTypeId == AppConstants.kEngineer) {
      getUserList(facilityId, true);
    } else if (selectedactorTypeId == AppConstants.kInventory) {
      inventoryList(facilityId: facilityId);
    } else if (selectedactorTypeId == AppConstants.kVendor) {
      //  getBusinessList();
    } else if (selectedactorTypeId == AppConstants.kScrap) {
      //  getBusinessList();
    }
    // transactionReport(
    //     facilityId: facilityId,
    //     startDate: formattedTodate1,
    //     actorType: selectedactorTypeId,
    //     actorID: actorId,
    //     endDate: formattedFromdate1,
    //     isLoading: true);
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
    selectedfacilityId = facilityNameList[0]!.id;
    actorId = selectedfacilityId;
    selectedfacility.value = facilityNameList[0]!.name;
    transactionReport(
        facilityId: facilityId,
        startDate: formattedTodate1,
        actorType: selectedactorTypeId,
        actorID: actorId,
        endDate: formattedFromdate1,
        isLoading: true);
    update(['permit_facility_list']);
  }

  Future<void> jobCardList(int facilityId) async {
    jobList.value = <JobModel>[];
    if (facilityId > 0) {
      final _jobList = await transactionReportListPresenter.getJobList(
        facilityId: facilityId,
        // userId: userId,
        self_view: varUserAccessModel.value.access_list!
                    .where((e) =>
                        e.feature_id == UserAccessConstants.kJobFeatureId &&
                        e.selfView == UserAccessConstants.kHaveSelfViewAccess)
                    .length >
                0
            ? true
            : false,
        isLoading: true, startDate: formattedTodate1,
        endDate: formattedFromdate1,
      );

      if (_jobList != null && _jobList.isNotEmpty) {
        jobList.value = _jobList;
      }
      selectedJobId = jobList[0]!.id ?? 0;
      actorId = selectedJobId;
      selectedJob.value = jobList[0]!.name ?? "";
      transactionReport(
          facilityId: facilityId,
          startDate: formattedTodate1,
          actorType: selectedactorTypeId,
          actorID: actorId,
          endDate: formattedFromdate1,
          isLoading: true);
      update(['job_list']);
    }
  }
}
