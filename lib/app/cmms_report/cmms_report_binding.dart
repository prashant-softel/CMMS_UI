import 'package:cmms/app/cmms_report/cmms_report_controller.dart';
import 'package:cmms/app/cmms_report/cmms_report_presenter.dart';
import 'package:cmms/domain/usecases/cmms_report_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class CmmsReportDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CmmsReportDashboardController>(
      () => CmmsReportDashboardController(
        CmmsReportDashboardPresenter(
          CmmsReportDashboardUsecase(
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
