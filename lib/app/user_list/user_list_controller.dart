import 'dart:async';

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

  Map<String, bool> colHeaderMap = {
    "Profile": false,
    "User Login ID": false,
    "User Role": false,
    "Contact Number": false,
    "Created On": false,
    "Updated On": false,
    'Actions': false,
  };

  final streamController = StreamController<int>();

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
  RxString contractFilterText = ''.obs;
  RxString createdOnFilterText = ''.obs;
  RxString updatedOnFilterText = ''.obs;
  RxString userDateFilterText = ''.obs;

  Rx<int> userId = 0.obs;
  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Profile": true,
    "User Login ID": true,
    "User Role": true,
    "Contact Number": true,
    "Created On": true,
    "Updated On": true,
    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "Profile": 123,
    "User Login ID": 400,
    "User Role": 200,
    "Contact Number": 123,
    "Created On": 123,
    "Updated On": 123,
  };
  // Map<String, RxString> filterText = {};
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      userList.value = filteredData;
      return;
    }

    userList.value = filteredData
        .where(
            (item) => item.name!.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
    update(['user_list']);
  }

  @override
  void onInit() async {
    this.filterText = {
      "Profile": idFilterText,
      "User Login ID": userLoginIdFilterText,
      "User Role": userRoleFilterText,
      "Contact Number": contractFilterText,
      "Created On": createdOnFilterText,
      "Updated On": updatedOnFilterText,
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
    final _userList = await userListPresenter.getUserList(
        facilityId: facilityId, isLoading: isLoading);

    if (_userList != null) {
      userList.value = _userList;
      filteredData.value = userList;
      paginationController = PaginationController(
        rowCount: userList.length,
        rowsPerPage: 10,
      );

      if (filteredData != null && filteredData.isNotEmpty) {
        userListModel = filteredData[0];
        var userListJson = userListModel?.toJson();
        userListTableColumns.value = <String>[];
        for (var key in userListJson?.keys.toList() ?? []) {
          userListTableColumns.add(key);
        }
      }
    }
    update(['user_list']);
  }
}

extension DataRowModelExtensions on UserListModel {
  String? columnByName(String name) {
    switch (name) {
      case 'Profile':
        return "Profile image";
      case 'User Login ID':
        return name;
      case 'User Role':
        return role_name;
      case 'Contact Number':
        return contact_no;
      case 'Created On':
        return "2023-03-26";
      case 'Updated On':
        return "2023-03-26";
      default:
        return null;
    }
  }
}
