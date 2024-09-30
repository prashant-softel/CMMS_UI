import 'package:cmms/app/plant_stock_report/plant_stock_report_controller.dart';
import 'package:cmms/app/plant_stock_report/plant_stock_report_presenter.dart';
import 'package:cmms/app/sm_report/sm_report_list_controller.dart';
import 'package:cmms/app/sm_report/sm_report_list_presenter.dart';
import 'package:cmms/domain/usecases/sm_report_list_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/plant_stock_report_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class SmReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SmReportController>(
      () => SmReportController(
        SmReportPresenter(
          SmReportUsecase(
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
