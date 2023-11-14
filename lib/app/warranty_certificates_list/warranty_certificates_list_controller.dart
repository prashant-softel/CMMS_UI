import 'dart:async';
import 'package:cmms/app/inventory_list/inventory_list_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/warranty_certificates_list/warranty_certificates_list_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:get/get.dart';
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

  InventoryModel? inventoryModelList;
  RxList<String> inventoryListTableColumns = <String>[].obs;

  //Edit
  /// Edit WarrantyClaim Details

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  ///
  int? id = 0;
  @override
  void onInit() async {
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

    inventoryList.value = filteredData
        .where(
            (item) => item!.name!.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
    update(['inventory_list']);
  }

  Future<void> getInventoryList(int facilityId) async {
    // eqipmentNameList.value = <InventoryModel>[];
    final _inventoryList = await inventoryListPresenter.inventoryList(
        isLoading: true, facilityId: facilityId, categoryId: 2);
    for (var inventory_list in _inventoryList) {
      inventoryList.add(inventory_list);
    }
    inventoryList.value = _inventoryList;
    filteredData.value = inventoryList;
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

  void showAddInventoryDetails({int? id}) {
    Get.toNamed(Routes.addInventoryScreen, arguments: id);
    print('Argument5:$id');
  }

  void viewAddInventoryDetails({int? id}) {
    Get.toNamed(Routes.viewAddInventoryScreen, arguments: id);
    print('Argument5:$id');
  }

  void addInventoryDetails({int? id}) {
    Get.toNamed(Routes.addInventoryScreen);
    print('Argument5:$id');
  }
}
