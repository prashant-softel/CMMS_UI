import 'package:cmms/app/app.dart';

import 'package:cmms/app/view_incident_report.dart/view_incident_report_controller.dart';
import 'package:cmms/app/view_incident_report.dart/view_incident_report_presenter.dart';

import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/view_incident_report_usecase.dart';

/// A list of bindings which will be used in the route of [HomeScreen].
class ViewIncidentReportBinding extends Bindings {
  @override
  void dependencies() {
    // Get.find<IncidentReportListController>();
    Get.lazyPut(
      () => ViewIncidentReportController(
        Get.put(
          ViewIncidentReportPresenter(
            ViewIncidentReportUsecase(
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
