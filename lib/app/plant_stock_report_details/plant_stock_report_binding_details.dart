import 'package:cmms/app/app.dart';
import 'package:cmms/app/plant_stock_report_details/plant_stock_report_controller_details.dart';
import 'package:cmms/app/plant_stock_report_details/plant_stock_report_presenter_details.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/plant_stock_report_details_usecase.dart';

import 'package:get/get.dart';

class PlantStockReportDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PlantStockReportDetailsController(
        Get.put(
          PlantStockReportDetailsPresenter(
            PlantStockReportDetailsUsecase(
              Get.find(),
            ),
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
