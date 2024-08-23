import 'package:cmms/app/cumulative_report/cumulative_report_controller.dart';
import 'package:cmms/app/cumulative_report/cumulative_report_presenter.dart';
import 'package:cmms/domain/usecases/cumulative_report_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class CumulativeReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CumulativeReportController>(
      () => CumulativeReportController(
        CumulativeReportPresenter(
          CumulativeReportUsecase(
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
