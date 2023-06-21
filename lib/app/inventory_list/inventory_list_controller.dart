import 'dart:async';
import 'package:cmms/app/inventory_list/inventory_list_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/domain.dart';
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

  void getInventoryList(int facilityId) async {
    eqipmentNameList.value = <InventoryModel>[];
    final _inventoryList = await inventoryListPresenter.inventoryList(
      isLoading: true,
      facilityId: facilityId,
    );
    for (var inventory_list in _inventoryList) {
      eqipmentNameList.add(inventory_list);
    }
    inventoryList = _inventoryList;
    // print('equipment Name List:$inventoryList');

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
