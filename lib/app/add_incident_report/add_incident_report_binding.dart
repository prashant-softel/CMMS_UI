import 'package:cmms/app/add_incident_report/add_incident_report_controller.dart';
import 'package:cmms/app/add_incident_report/add_incident_report_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/domain/usecases/add_incident_report_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';

/// A list of bindings which will be used in the route of [HomeScreen].
class AddIncidentReportBinding extends Bindings {
  @override
  void dependencies() {
      // Get.find<IncidentReportListController>();
    Get.lazyPut(
      () => AddIncidentReportController(
        Get.put(
          AddIncidentReportPresenter(
            AddIncidentReportUsecase(
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
