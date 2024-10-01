import 'package:cmms/app/app.dart';
import 'package:cmms/app/stock_management/stock_management_presenter.dart';
import 'package:get/get.dart';
import '../navigators/app_pages.dart';

class StockManagementDashboardController extends GetxController {
  StockManagementDashboardController(this.stockManagementDashboardPresenter);
  StockManagementDashboardPresenter stockManagementDashboardPresenter;

  @override
  void switchFacility(String? facilityName) {}
  Future<void> createChecklist() async {}

  Future<void> checkPoint() async {
    Get.toNamed(
      Routes.stockManagementGoodsOrdersScreen,
    );
  }

  Future<void> receiveGoodsOrders() async {
    Get.toNamed(
      Routes.receiveGoodsOrders,
    );
  }

  Future<void> pmMapping() async {
    // Get.toNamed(
    //   Routes.preventiveMaintenanceMapping,
    // );
  }

  Future<void> pmSchedule() async {
    // Get.toNamed(
    //   Routes.pmSchedule,
    // );
  }

  Future<void> pmTask() async {
    // Get.toNamed(
    //   Routes.pmTask,
    // );
  }

  Future<void> pmExecution() async {
    // Get.toNamed(
    //   Routes.pmExecution,
    // );
  }
  Future<void> importMaterial() async {
    clearValueimportType();
    Get.toNamed(Routes.importInventory,
        arguments: {'importType': AppConstants.kImportMaterial});
  }

  void clearValueimportType() {
    stockManagementDashboardPresenter.clearValueimportType();
  }

  Future<void> materialCategory() async {
    clearValueimportType();
    Get.toNamed(
      Routes.materialCategory,
    );
  }
}
