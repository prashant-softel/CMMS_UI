import 'package:cmms/app/plant_stock_report/plant_stock_report_controller.dart';
import 'package:cmms/app/plant_stock_report/plant_stock_report_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/plant_stock_report_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class PlantStockReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlantStockReportController>(
      () => PlantStockReportController(
        PlantStockReportPresenter(
          PlantStockReportUsecase(
            Get.find(),
          ),
        ),
      ),
    );
    Get.lazyPut(
      () => HomeController(
        Get.put(
          HomePresenter(
            HomeUsecase(
              Get.find(),
            ),
          ),
        ),
      ),
    );
  }
}
