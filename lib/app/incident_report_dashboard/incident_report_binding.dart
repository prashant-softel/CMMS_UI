import 'package:cmms/app/incident_report_dashboard/incident_report_controller.dart';
import 'package:cmms/app/incident_report_dashboard/incident_report_presenter.dart';
import 'package:cmms/domain/usecases/incident_report_dashboard_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class IncidentReportDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IncidentReportDashboardController>(
      () => IncidentReportDashboardController(
        IncidentReportDashboardPresenter(
          IncidentReportDashboardUsecase(
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
