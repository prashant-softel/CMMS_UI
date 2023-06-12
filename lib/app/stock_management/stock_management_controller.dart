import 'package:cmms/app/stock_management/stock_management_presenter.dart';
import 'package:get/get.dart';

import '../../domain/models/facility_model.dart';
import '../navigators/app_pages.dart';

class StockManagementDashboardController extends GetxController {
  StockManagementDashboardController(this.stockManagementDashboardPresenter);
  StockManagementDashboardPresenter stockManagementDashboardPresenter;

  @override
  void switchFacility(String? facilityName) {}
  Future<void> createChecklist() async {
    // Get.toNamed(
    //   Routes.preventiveList,
    // );
  }

  Future<void> checkPoint() async {
    Get.toNamed(
      Routes.stockManagementGoodsOrdersScreen,
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
}
