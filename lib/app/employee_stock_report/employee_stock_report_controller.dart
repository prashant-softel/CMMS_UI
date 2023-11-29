import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/employee_stock_report/employee_stock_report_presenter.dart';
import 'package:cmms/domain/models/user_list_model.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../domain/models/get_employee_stock_report_model.dart';

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

  RxList<UserListModel?> userList = <UserListModel?>[].obs;
  RxList<EmployeeStockReportListModel?> assetItemList =
      <EmployeeStockReportListModel?>[].obs;

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
  @override
  void onInit() async {
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
        userList.add(_userList);
      }
      selectedUser.value = userList[0]?.name ?? '';
      selectedUserId = userList[0]?.id ?? 0;
      Future.delayed(Duration(seconds: 1), () {
        getEmployeeStockReportList(
            facilityId, 12, formattedTodate1, formattedFromdate1, false);
      });
    }
  }

  Future<void> getEmployeeStockReportList(int facilityId, int userId,
      dynamic startDate, dynamic endDate, bool isLoading) async {
    assetItemList.value = <EmployeeStockReportListModel>[];

    final _assetList =
        await employeeStockReportPresenter.getEmployeeStockReportList(
            facilityId: facilityId,
            userId: userId,
            isLoading: isLoading,
            startDate: startDate,
            endDate: endDate);
    if (_assetList != null) {
      assetItemList.value = _assetList;
      //
    }
    print({"eeee", assetItemList});
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<UserListModel>:
        {
          int userIndex = userList.indexWhere((x) => x?.name == value);
          selectedUserId = userList[userIndex]?.id ?? 0;
          selectedUser.value = userList[userIndex]?.name ?? '';
          if (selectedUserId != null) {
            getEmployeeStockReportList(facilityId, selectedUserId,
                formattedTodate1, formattedFromdate1, false);
          }
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
