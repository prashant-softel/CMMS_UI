import 'package:cmms/domain/usecases/stock_management_usecase.dart';
import 'package:get/get.dart';

import 'stock_management_controller.dart';
import 'stock_management_presenter.dart';

class StockManagementDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => StockManagementDashboardController(
        Get.put(
          StockManagementDashboardPresenter(
            StockManagementDashboardUsecase(
              Get.find(),
            ),
          ),
        ),
      ),
    );
  }
}
