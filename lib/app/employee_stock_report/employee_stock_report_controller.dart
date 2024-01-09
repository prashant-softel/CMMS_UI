import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/employee_stock_report/employee_stock_report_presenter.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/models/user_list_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EmployeeStockReportController extends GetxController {
  EmployeeStockReportController(
    this.employeeStockReportPresenter,
  );

  EmployeeStockReportPresenter employeeStockReportPresenter;
  final HomeController homecontroller = Get.find();
  Rx<String> selectedUser = ''.obs;
  Rx<bool> isSelectedUser = true.obs;
  int selectedUserId = 0;
  bool openFromDateToStartDatePicker = false;

  RxList<UserListModel> userList = <UserListModel>[].obs;

  RxList<PlantStockListModel?>? plantStockList = <PlantStockListModel?>[].obs;
  RxList<StockDetails?>? StockDetailsList = <StockDetails?>[].obs;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  RxString assetNameFilterText = ''.obs;
  RxString assetsCodeFilterText = ''.obs;
  RxString assetTypeFilterText = ''.obs;

  RxString openingFilterText = ''.obs;
  RxString inwardFilterText = ''.obs;
  RxString outwardFilterText = ''.obs;
  RxString balanceFilterText = ''.obs;
  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Assets Name": true,
    "Assets Code": true,
    "Assets Type": true,
    "Opening": true,
    "Inward": true,
    "Outward": true,
    "Balance": true,
  });
  final Map<String, double> columnwidth = {
    "Assets Name": 300,
    "Assets Code": 250,
    "Assets Type": 250,
    "Opening": 100,
    "Inward": 100,
    "Outward": 100,
    "Balance": 100,
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    // print({"updated columnVisibility": columnVisibility});
  }

  @override
  void onInit() async {
    this.filterText = {
      "Assets Name": assetNameFilterText,
      "Assets Code": assetsCodeFilterText,
      "Assets Type": assetTypeFilterText,
      "Opening": openingFilterText,
      "Inward": inwardFilterText,
      "Outward": outwardFilterText,
      "Balance": balanceFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getUserList(facilityId, true);
      });
    });

    super.onInit();
  }

  Future<void> getUserList(int facilityId, bool isLoading) async {
    userList.value = <UserListModel>[];
    final list = await employeeStockReportPresenter.getUserList(
        facilityId: facilityId, isLoading: isLoading);
    if (list != null) {
      for (var _userList in list) {
        userList.add(_userList!);
      }
      selectedUser.value = userList[0].name ?? '';
      selectedUserId = userList[0].id ?? 0;
      Future.delayed(Duration(seconds: 1), () {
        getEmployeeStockReportList(
            facilityId, 12, formattedTodate1, formattedFromdate1, false);
      });
    }
  }

  Future<void> getEmployeeStockReportList(int facilityId, int userId,
      dynamic startDate, dynamic endDate, bool isLoading) async {
    plantStockList?.value = <PlantStockListModel>[];
    StockDetailsList?.value = <StockDetails>[];

    final _assetList =
        await employeeStockReportPresenter.getEmployeeStockReportList(
            facilityId: facilityId,
            userId: userId,
            isLoading: isLoading,
            startDate: startDate,
            endDate: endDate);
    if (_assetList != null) {
      for (var facility in _assetList) {
        for (var stockDetail in facility.stockDetails) {
          StockDetailsList!.add(stockDetail);
        }
      }
    }
    print({"eeee", _assetList});
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<UserListModel>:
        {
          int userIndex = userList.indexWhere((x) => x.name == value);
          selectedUserId = userList[userIndex].id ?? 0;
          selectedUser.value = userList[userIndex].name ?? '';
          getEmployeeStockReportList(facilityId, selectedUserId,
              formattedTodate1, formattedFromdate1, false);
                }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  void getEmployeeReportListListByDate() {
    getEmployeeStockReportList(facilityId, selectedUserId, formattedTodate1,
        formattedFromdate1, false);
  }
}
