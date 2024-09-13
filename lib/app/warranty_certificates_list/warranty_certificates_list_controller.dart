import 'dart:async';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/warranty_certificates_list/warranty_certificates_list_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class WarrantyCertificatesListController extends GetxController {
  WarrantyCertificatesListController(this.inventoryListPresenter);
  WarrantyCertificatesListPresenter inventoryListPresenter;
  final HomeController homeController = Get.find();

  //block
  int facilityId = 0;
  StreamSubscription<int>? facilityIdStreamSubscription;
  RxList<InventoryModel?> inventoryList = <InventoryModel?>[].obs;
  RxList<InventoryModel?> filteredData = <InventoryModel?>[].obs;
  RxList<InventoryModel?> eqipmentNameList = <InventoryModel>[].obs;
    // For sorting
  RxString currentSortColumn = ''.obs;
  RxBool isAscending = true.obs;

  InventoryModel? inventoryModelList;
  RxList<String> inventoryListTableColumns = <String>[].obs;
  Rx<int> id = 0.obs;

  bool openFromDateToStartDatePicker = false;
  //From and To date format
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  //WC Grid

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Name": true,
    "Serial Number": true,
    "Id": true,
    "Parent Name": true,
    "Category": true,
    "Asset Facility Name": true,
    "Status": true,

    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "Name": 153,
    "Serial Number": 320,
    "Id": 220,
    "Parent Name": 200,
    "Category": 250,
    "Asset Facility Name": 250,
    "Status": 250,
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  RxString nameFilterText = ''.obs;
  RxString serialNumberFilterText = ''.obs;
  RxString idFilterText = ''.obs;
  RxString parentNameFilterText = ''.obs;
  RxString categoryNameFilterText = ''.obs;
  RxString operatorNameFilterText = ''.obs;
  RxString statusFilterText = ''.obs;
  RxString actionFilterText = ''.obs;

  ///
  // int? id = 0;
  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    this.filterText = {
      "Name": nameFilterText,
      "Serial Number": serialNumberFilterText,
      "Id": idFilterText,
      "Parent Name": parentNameFilterText,
      "Category": categoryNameFilterText,
      "Asset Facility Name": operatorNameFilterText,
      "Status": statusFilterText,
    };

    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getInventoryList(facilityId);
      });
    });

    super.onInit();
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      inventoryList.value = filteredData;
      return;
    }

    List<InventoryModel?> filteredList = filteredData
        .where((item) =>
            (item?.name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.serialNumber
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.id
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.parentName
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.categoryName
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.operatorName
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.status
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    inventoryList.value = filteredList;

    // inventoryList.value = filteredData
    //     .where(
    //         (item) => item!.name!.toLowerCase().contains(keyword.toLowerCase()))
    //     .toList();
    // update(['inventory_list']);
  }

  Future<void> getInventoryList(int facilityId) async {
    // eqipmentNameList.value = <InventoryModel>[];
    final _inventoryList = await inventoryListPresenter.inventoryList(
        isLoading: isLoading.value, facilityId: facilityId, categoryId: 2);
    for (var inventory_list in _inventoryList) {
      inventoryList.add(inventory_list);
    }
    inventoryList.value = _inventoryList;
    filteredData.value = inventoryList;
    isLoading.value = false;
    // print('equipment Name List:$inventoryList');

    paginationController = PaginationController(
      rowCount: inventoryList.length,
      rowsPerPage: 10,
    );
    if (filteredData.isNotEmpty) {
      inventoryModelList = filteredData[0];
      var inventoryListJson = inventoryModelList?.toJson();
      inventoryListTableColumns.value = <String>[];
      for (var key in inventoryListJson?.keys.toList() ?? []) {
        inventoryListTableColumns.add(key);
      }
    }
    update(['inventory_list']);
  }

  // void showAddInventoryDetails({int? id}) {
  //   Get.toNamed(Routes.addInventoryScreen, arguments: id);
  //   print('Argument5:$id');
  // }

  // void viewAddInventoryDetails({int? id}) {
  //   Get.toNamed(Routes.viewAddInventoryScreen, arguments: id);
  //   print('Argument5:$id');
  // }

  // void addInventoryDetails({int? id}) {
  //   Get.toNamed(Routes.addInventoryScreen);
  //   print('Argument5:$id');
  // }
   void sortData(String columnName) {
    if (currentSortColumn.value == columnName) {
      isAscending.value = !isAscending.value;
    } else {
      currentSortColumn.value = columnName;
      isAscending.value = true;
    }
    switch (columnName) {
      case 'Name':
        inventoryList.sort((a, b) => isAscending.value
            ? (a?.name ?? '').compareTo(b?.name ?? '')
            : (b?.name ?? '').compareTo(a?.name ?? ''));
        break;
      case 'Serial Number':
        inventoryList.sort((a, b) => isAscending.value
            ? (a?.serialNumber ?? '').compareTo(b?.serialNumber ?? '')
            : (b?.serialNumber ?? '').compareTo(a?.serialNumber ?? ''));
        break;
      case 'Id':
        inventoryList.sort((a, b) => isAscending.value
            ? (a?.id ?? 0).compareTo(b?.id ?? 0)
            : (b?.id ?? 0).compareTo(a?.id ?? 0));
        break;
      case 'Parent Name':
        inventoryList.sort((a, b) => isAscending.value
            ? (a?.parentName ?? '')
                .compareTo(b?.parentName ?? '')
            : (b?.parentName ?? '')
                .compareTo(a?.parentName ?? ''));
        break;
      case 'Category':
        inventoryList.sort((a, b) => isAscending.value
            ? (a?.categoryName ?? '').compareTo(b?.categoryName ?? '')
            : (b?.categoryName ?? '').compareTo(a?.categoryName ?? ''));
        break;

      case 'Asset Facility Name':
        inventoryList.sort((a, b) => isAscending.value
            ? (a?.customerName ?? '').compareTo(b?.customerName ?? '')
            : (b?.customerName ?? '').compareTo(a?.customerName ?? ''));
        break;
      case 'Status':
        inventoryList.sort((a, b) => isAscending.value
            ? (a?.status ?? '').compareTo(b?.status ?? '')
            : (b?.status ?? '').compareTo(a?.status ?? ''));
        break;
      default:
        break;
    }
    update();
  }
}
