import 'dart:async';
import 'package:cmms/app/inventory_list/inventory_list_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/column_availability.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class InventoryListController extends GetxController {
  InventoryListController(this.inventoryListPresenter);
  InventoryListPresenter inventoryListPresenter;
  final HomeController homeController = Get.find();

  //block
  int facilityId = 0;
  StreamSubscription<int>? facilityIdStreamSubscription;
  var inventoryList = <InventoryModel>[];
  RxList<InventoryModel?> eqipmentNameList = <InventoryModel>[].obs;

  var inventoryColumnVisibility = <ColumnAvailability>[];
  var selectedInventoryColumnVisibility = <ColumnAvailability>[];

  //Edit
  /// Edit WarrantyClaim Details

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  void onInitializeData() {
    inventoryColumnVisibility = [];
    inventoryColumnVisibility.add(ColumnAvailability(
        text: 'assetName'.tr, value: null, isSelected: true));
    inventoryColumnVisibility
        .add(ColumnAvailability(text: 'serialNo'.tr, value: null));
    inventoryColumnVisibility
        .add(ColumnAvailability(text: 'Id'.tr, value: null, isSelected: true));
    inventoryColumnVisibility
        .add(ColumnAvailability(text: 'parrentAsset'.tr, value: null));
    inventoryColumnVisibility.add(ColumnAvailability(
        text: 'catergory'.tr, value: null, isSelected: true));
    inventoryColumnVisibility.add(ColumnAvailability(
        text: 'assetFacilityName'.tr, value: null, isSelected: true));
    inventoryColumnVisibility.add(
        ColumnAvailability(text: 'action'.tr, value: null, isSelected: true));
  }

  void buildSelectedInventoryColumnVisibility() {
    selectedInventoryColumnVisibility.clear();
    for (var i in inventoryColumnVisibility) {
      if (i.isSelected) {
        selectedInventoryColumnVisibility.add(i);
      }
    }
    update(['inventory_list']);
  }

  bool buildSelectedInventoryList({required String data}) {
    var boolVal = false;
    for (var i in selectedInventoryColumnVisibility) {
      // print('parent data $data ${i.text}');
      if (i.text == data) {
        boolVal = true;
      }
    }
    return boolVal;
  }

  bool checkSelectedColumnVisibility({required String columnName}) {
    var boolVal = false;
    for (var i in selectedInventoryColumnVisibility) {
      if (i.text == columnName) {
        boolVal = true;
      }
    }

    return boolVal;
  }

  ///
  int? id = 0;
  @override
  void onInit() async {
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getInventoryList(facilityId);
        onInitializeData();
      });
    });

    super.onInit();
  }

  void getInventoryList(int facilityId) async {
    eqipmentNameList.value = <InventoryModel>[];
    final _inventoryList = await inventoryListPresenter.inventoryList(
      isLoading: true,
      facilityId: facilityId,
    );
    eqipmentNameList.clear();
    for (var inventory_list in _inventoryList) {
      eqipmentNameList.add(inventory_list);
    }
    inventoryList = _inventoryList;
    // print('equipment Name List:$inventoryList');
    // print({"eqipmentNameList.length": eqipmentNameList.length});
    paginationController = PaginationController(
      rowCount: eqipmentNameList.length,
      rowsPerPage: 10,
    );
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
