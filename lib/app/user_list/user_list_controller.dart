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
// For sorting
  RxString currentSortColumn = ''.obs;
  RxBool isAscending = true.obs;
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
    "Created On": 143,
    "Updated On": 153,
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
   void sortData(String columnName) {
    if (currentSortColumn.value == columnName) {
      isAscending.value = !isAscending.value;
    } else {
      currentSortColumn.value = columnName;
      isAscending.value = true;
    }
    switch (columnName) {
      case 'Profile':
        userList.sort((a, b) => isAscending.value
            ? (a.photoPath ?? '').compareTo(b.photoPath ?? '')
            : (b.photoPath ?? '').compareTo(a.photoPath ?? ''));
        break;
      case 'User Login ID':
        userList.sort((a, b) => isAscending.value
            ? (a.name ?? '').compareTo(b.name ?? '')
            : (b.name ?? '').compareTo(a.name ?? ''));
        break;
      case 'Role':
        userList.sort((a, b) => isAscending.value
            ? (a.role_name ?? '').compareTo(b.role_name ?? '')
            : (b.role_name ?? '').compareTo(a.role_name ?? ''));
        break;
      case 'Designation':
        userList.sort((a, b) => isAscending.value
            ? (a.designation ?? '')
                .compareTo(b.designation ?? '')
            : (b.designation ?? '')
                .compareTo(a.designation ?? ''));
        break;
      case 'Contact Number':
        userList.sort((a, b) => isAscending.value
            ? (a.mobileNumber ?? '').compareTo(b.mobileNumber ?? '')
            : (b.mobileNumber ?? '').compareTo(a.mobileNumber ?? ''));
        break;

      case 'Created On':
        userList.sort((a, b) => isAscending.value
            ? (a.created_at ?? '').compareTo(b.created_at ?? '')
            : (b.created_at ?? '').compareTo(a.created_at ?? ''));
        break;
      case 'Updated On':
        userList.sort((a, b) => isAscending.value
            ? (a.updated_at ?? '').compareTo(b.updated_at ?? '')
            : (b.updated_at ?? '').compareTo(a.updated_at ?? ''));
        break;
      // case 'Facilities':
      //   userList.sort((a, b) => isAscending.value
      //       ? (a.facilities ?? 0).compareTo(b.facilities ?? '')
      //       : (b.facilities ?? '').compareTo(a.facilities ?? ''));
      //   break;
      default:
        break;
    }
    update();
  }
}
