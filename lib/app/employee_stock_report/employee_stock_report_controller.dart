import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/employee_stock_report/employee_stock_report_presenter.dart';
import 'package:cmms/domain/models/employe_stock_model.dart';
import 'package:cmms/domain/models/user_list_model.dart';

import 'package:get/get.dart';

class EmployeeStockReportController extends GetxController {
  EmployeeStockReportController(
    this.employeeStockReportPresenter,
  );

  EmployeeStockReportPresenter employeeStockReportPresenter;
  final HomeController homecontroller = Get.find();
  Rx<String> selectedUser = ''.obs;
  Rx<bool> isSelectedUser = true.obs;
  int selectedUserId = 0;

  RxList<UserListModel?> userList = <UserListModel?>[].obs;
  RxList<CmmrsItemsModel?> assetItemList = <CmmrsItemsModel?>[].obs;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
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
        getCmmsItemList(facilityId, 2);
      });
    }
  }

  Future<void> getCmmsItemList(int facilityId, int userId) async {
    final _assetList = await employeeStockReportPresenter.getCmmsItemList(
        facilityId: facilityId, userId: userId);
    if (_assetList != null) {
      assetItemList.value = _assetList.cmmrsItems ?? [];
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
          selectedUser.value = userList[0]?.name ?? '';

          getCmmsItemList(facilityId, selectedUserId);
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }
}
