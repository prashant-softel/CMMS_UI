import 'dart:async';

import 'package:cmms/app/return_mrs/return_mrs_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/get_return_mrs_list.dart';
import '../home/home_controller.dart';

class ReturnMrsListController extends GetxController {
  ///
  ReturnMrsListController(
    this.returnmrsListPresenter,
  );
  ReturnMrsListPresenter returnmrsListPresenter;
  final HomeController homecontroller = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<ReturnMrsListModel?>? mrsList = <ReturnMrsListModel?>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  ReturnMrsListModel? returnMrsListModel;
  // ReturnMrsListModel? selectedItem;
  RxList<String> mrsTableColumns = <String>[].obs;
  // Rx<DateTime> fromDate = DateTime.now().obs;
  // Rx<DateTime> toDate = DateTime.now().obs;
  // String get formattedFromdate =>
  //     DateFormat('yyyy-MM-dd').format(fromDate.value);
  // String get formattedTodate => DateFormat('yyyy-MM-dd').format(toDate.value);

  ///
  RxString idFilterText = ''.obs;
  RxString mrsDetailFilterText = ''.obs;
  RxString orderDateFilterText = ''.obs;
  RxString activityFilterText = ''.obs;
  RxString whereusedFilterText = ''.obs;
  Rx<int> MrsId = 0.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "MRS ID": true,
    "MRS Details": true,
    "Order Date": true,
    "Activity": true,
    "Where Used": true,
  });
  final Map<String, double> columnwidth = {
    "MRS ID": 200,
    "MRS Details": 400,
    "Order Date": 200,
    "Activity": 200,
    "Where Used": 200,
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
      "MRS ID": idFilterText,
      "MRS Details": mrsDetailFilterText,
      "Order Date": orderDateFilterText,
      "Activity": activityFilterText,
      "Where Used": whereusedFilterText
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getReturnMrsList(facilityId, true);
      });
    });
    super.onInit();
  }

  Future<void> getReturnMrsList(int facilityId, bool isLoading) async {
    mrsList?.value = <ReturnMrsListModel>[];
    final _mrsList = await returnmrsListPresenter.getReturnMrsList(
      facilityId: facilityId,
      isLoading: isLoading,
    );

    if (_mrsList != null) {
      mrsList!.value = _mrsList;
      paginationController = PaginationController(
        rowCount: mrsList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (mrsList != null && mrsList!.isNotEmpty) {
        returnMrsListModel = mrsList![0];
        var mrsListJson = returnMrsListModel?.toJson();
        mrsTableColumns.value = <String>[];
        for (var key in mrsListJson?.keys.toList() ?? []) {
          mrsTableColumns.add(key);
        }
      }
    }
  }

  void clearStoreData() {
    returnmrsListPresenter.clearValue();
  }
}
