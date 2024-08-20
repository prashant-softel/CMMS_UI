import 'dart:async';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/user_list/user_list_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/user_list_model.dart';
import '../home/home_controller.dart';

class UserListController extends GetxController {
  ///
  UserListController(
    this.userListPresenter,
  );

  UserListPresenter userListPresenter;
  final HomeController homecontroller = Get.find();

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<UserListModel> userList = <UserListModel>[].obs;
  RxList<UserListModel> filteredData = <UserListModel>[].obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  UserListModel? userListModel;
  RxList<String> userListTableColumns = <String>[].obs;
  UserListModel? selectedItem;

  RxString idFilterText = ''.obs;
  RxString userLoginIdFilterText = ''.obs;
  RxString userRoleFilterText = ''.obs;
  RxString userDesgnFilterText = ''.obs;
  RxString contractFilterText = ''.obs;
  RxString createdOnFilterText = ''.obs;
  RxString updatedOnFilterText = ''.obs;
  RxString facilitiesFilterText = ''.obs;
  RxString userDateFilterText = ''.obs;

  Rx<int> userId = 0.obs;
  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Profile": true,
    "User Login ID": true,
    "Role": true,
    "Designation": true,
    "Contact Number": true,
    "Created On": true,
    "Updated On": true,
    "Facilities": true,
    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "Profile": 123,
    "User Login ID": 300,
    "Role": 200,
    "Designation": 200,
    "Contact Number": 200,
    "Created On": 123,
    "Updated On": 123,
    "Facilities": 200
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    // print({"updated columnVisibility": columnVisibility});
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      userList.value = filteredData.value;
      return;
    }
    List<UserListModel> filteredList = filteredData
        .where((item) =>
            (item.name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.role_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.contact_no
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.facilities?.any((facility) =>
                    facility.name
                        ?.toString()
                        .toLowerCase()
                        .contains(keyword.toLowerCase()) ??
                    false) ??
                false))
        .toList();
    userList.value = filteredList;
  }

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    this.filterText = {
      "Profile": idFilterText,
      "User Login ID": userLoginIdFilterText,
      "Role": userRoleFilterText,
      "Designation": userDesgnFilterText,
      "Contact Number": contractFilterText,
      "Created On": createdOnFilterText,
      "Updated On": updatedOnFilterText,
      "Facilities": facilitiesFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getUserList(facilityId, false);
      });
    });

    super.onInit();
  }

  Future<void> getUserList(int facilityId, bool isExport) async {
    userList.value = <UserListModel>[];
    filteredData.value = <UserListModel>[];

    final _userList = await userListPresenter.getUserList(
        facilityId: facilityId, isLoading: isLoading.value, isExport: isExport);

    if (_userList != null) {
      userList.value = _userList;
      filteredData.value = userList.value;
      isLoading.value = false;
    }
    update(['user_list']);
  }

  void clearStoreData() {
    userListPresenter.clearValue();
  }

  void isDeleteDialog({String? user_id, String? user}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the user?',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: "[$user]",
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
                  deleteUser(user_id).then((value) {
                    Get.back();
                    getUserList(facilityId, false);
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

  Future<void> deleteUser(String? user_id) async {
    {
      await userListPresenter.deleteUser(
        user_id,
        isLoading: true,
      );
    }
  }

  void export() {
    getUserList(facilityId, true);
  }
}
