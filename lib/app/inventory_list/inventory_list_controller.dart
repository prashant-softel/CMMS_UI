import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/inventory_list/inventory_list_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/inventory_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class InventoryListController extends GetxController {
  InventoryListController(
    this.inventoryListPresenter,
  );
  InventoryListPresenter inventoryListPresenter;
  final HomeController homecontroller = Get.find();
  RxList<InventoryModel?> inventoryList = <InventoryModel?>[].obs;
  RxList<InventoryModel?> filteredData = <InventoryModel?>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;

  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  InventoryModel? inventoryListModel;
  RxList<String> inventoryListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> id = 0.obs;
  RxString idFilterText = ''.obs;
  RxString assetsNameFilterText = ''.obs;
  RxString serialNoFilterText = ''.obs;
  RxString parrentAssetFilterText = ''.obs;
  RxString catergoryFilterText = ''.obs;
  RxString assetFacilityNameFilterText = ''.obs;
  RxString statusFilterText = ''.obs;

  RxString userDateFilterText = ''.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Id": true,
    "Assets Name": true,
    "Serial No": true,
    "Parent Asset": true,
    "Category": true,
    "Block Name": true,

    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "Id": 153,
    "Assets Name": 320,
    "Serial No": 120,
    "Parent Asset": 200,
    "Category": 223,
    "Block Name": 153,
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
    this.filterText = {
      "Id": idFilterText,
      "Assets Name": assetsNameFilterText,
      "Serial No": serialNoFilterText,
      "Parent Asset": parrentAssetFilterText,
      "Category": catergoryFilterText,
      "Block Name": assetFacilityNameFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      if (facilityId > 0) {
        Future.delayed(Duration(seconds: 1), () async {
          await getInventoryAssetsList(facilityId, false);
        });
      }
    });
    super.onInit();
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      inventoryList.value = filteredData.value;
      return;
    }
    List<InventoryModel?> filteredList = filteredData
        .where((item) =>
                (item!.name
                        ?.toString()
                        .toLowerCase()
                        .contains(keyword.toLowerCase()) ??
                    false) ||
                (item.blockName
                        ?.toString()
                        .toLowerCase()
                        .contains(keyword.toLowerCase()) ??
                    false) ||
                (item.categoryName
                        ?.toString()
                        .toLowerCase()
                        .contains(keyword.toLowerCase()) ??
                    false) ||
                (item.parentName
                        ?.toString()
                        .toLowerCase()
                        .contains(keyword.toLowerCase()) ??
                    false) ||
                (item.id
                        ?.toString()
                        .toLowerCase()
                        .contains(keyword.toLowerCase()) ??
                    false) ||
                (item.serialNumber
                        ?.toString()
                        .toLowerCase()
                        .contains(keyword.toLowerCase()) ??
                    false) // Add this condition to filter by searchId
            )
        .toList();
    inventoryList.value = filteredList;
  }

  Future<void> getInventoryAssetsList(int facilityId, bool isExport) async {
    inventoryList.value = <InventoryModel>[];
    filteredData.value = <InventoryModel>[];
    final _inventoryList = await inventoryListPresenter.getInventoryAssetsList(
        isLoading: isLoading.value,
        facility_id: facilityId,
        isExport: isExport);
    inventoryList.value = _inventoryList;
    filteredData.value = inventoryList.value;
    isLoading.value = false;
    paginationController = PaginationController(
      rowCount: inventoryList.length,
      rowsPerPage: 10,
    );

    if (inventoryList.isNotEmpty) {
      inventoryListModel = inventoryList[0];
      var inventoryListJson = inventoryListModel?.toJson();
      inventoryListTableColumns.value = <String>[];
      for (var key in inventoryListJson?.keys.toList() ?? []) {
        inventoryListTableColumns.add(key);
      }
    }
  }

  void export() {
    getInventoryAssetsList(facilityId, true);
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }

  void showAddGoodsOrdersDetails({int? id}) {
    Get.toNamed(Routes.updateGoodsOrdersDetailsScreen, arguments: id);
    print('Argument5:$id');
  }

  void viewAddGoodsOrdersDetails({int? id}) {
    Get.toNamed(Routes.viewGoodsOrders, arguments: id);
    print('Argument5:$id');
  }

  void getPmTaskListByDate() {
    // getGoodsOrdersList(facilityId, formattedFromdate1, formattedTodate1, false);
  }
  void clearValueimportType() {
    inventoryListPresenter.clearValueimportType();
  }
  // Future<void> deleteGoodsOrders(String? id) async {
  //   await inventoryListPresenter.deleteFacility(
  //     id,
  //     isLoading: true,
  //   );
  // }

  void clearStoreData() {
    inventoryListPresenter.clearValue();
    // }

    // void clearTypeStoreData() {
    //   inventoryListPresenter.clearTypeValue();
  }
}





// import 'dart:async';
// import 'package:cmms/app/inventory_list/inventory_list_presenter.dart';
// import 'package:cmms/app/home/home_controller.dart';
// import 'package:cmms/app/navigators/app_pages.dart';
// import 'package:cmms/domain/domain.dart';
// import 'package:get/get.dart';
// import 'package:scrollable_table_view/scrollable_table_view.dart';

// class InventoryListController extends GetxController {
//   InventoryListController(this.inventoryListPresenter);
//   InventoryListPresenter inventoryListPresenter;
//   final HomeController homeController = Get.find();

//   //block
//   int facilityId = 0;
//   StreamSubscription<int>? facilityIdStreamSubscription;
//   RxList<InventoryModel?> inventoryList = <InventoryModel?>[].obs;
//   RxList<InventoryModel?> filteredData = <InventoryModel?>[].obs;
//   RxList<InventoryModel?> eqipmentNameList = <InventoryModel>[].obs;

//   InventoryModel? inventoryModelList;
//   RxList<String> inventoryListTableColumns = <String>[].obs;

//   //Edit
//   /// Edit WarrantyClaim Details

//   PaginationController paginationController = PaginationController(
//     rowCount: 0,
//     rowsPerPage: 10,
//   );

//   ///
//   int? id = 0;
//   @override
//   void onInit() async {
//     facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
//       facilityId = event;
//       Future.delayed(Duration(seconds: 2), () {
//         getInventoryList(facilityId);
//       });
//     });

//     super.onInit();
//   }

//   void search(String keyword) {
//     if (keyword.isEmpty) {
//       inventoryList.value = filteredData;
//       return;
//     }

//     inventoryList.value = filteredData
//         .where(
//             (item) => item!.name!.toLowerCase().contains(keyword.toLowerCase()))
//         .toList();
//     update(['inventory_list']);
//   }

//   Future<void> getInventoryList(int facilityId) async {
//     // eqipmentNameList.value = <InventoryModel>[];
//     final _inventoryList = await inventoryListPresenter.inventoryList(
//       isLoading: true,
//       facilityId: facilityId,
//     );
//     for (var inventory_list in _inventoryList) {
//       inventoryList.add(inventory_list);
//     }
//     inventoryList.value = _inventoryList;
//     filteredData.value = inventoryList;
//     // print('equipment Name List:$inventoryList');

//     paginationController = PaginationController(
//       rowCount: inventoryList.length,
//       rowsPerPage: 10,
//     );
//     if (filteredData.isNotEmpty) {
//       inventoryModelList = filteredData[0];
//       var inventoryListJson = inventoryModelList?.toJson();
//       inventoryListTableColumns.value = <String>[];
//       for (var key in inventoryListJson?.keys.toList() ?? []) {
//         inventoryListTableColumns.add(key);
//       }
//     }
//       update(['inventory_list']);
//   }

//   void showAddInventoryDetails({int? id}) {
//     Get.toNamed(Routes.addInventoryScreen, arguments: id);
//     print('Argument5:$id');
//   }

//   void viewAddInventoryDetails({int? id}) {
//     Get.toNamed(Routes.viewAddInventoryScreen, arguments: id);
//     print('Argument5:$id');
//   }

//   void addInventoryDetails({int? id}) {
//     Get.toNamed(Routes.addInventoryScreen);
//     print('Argument5:$id');
//   }
// }
