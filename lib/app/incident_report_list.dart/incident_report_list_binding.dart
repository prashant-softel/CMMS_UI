import 'package:cmms/app/app.dart';
import 'package:cmms/app/incident_report_list.dart/incident_report_list_controller.dart';
import 'package:cmms/app/incident_report_list.dart/incident_report_list_presenter.dart';
import 'package:cmms/domain/usecases/incident_report_list_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';

/// A list of bindings which will be used in the route of [HomeScreen].
class IncidentReportListBinding extends Bindings {
  @override
  void dependencies() {
      // Get.find<IncidentReportListController>();
    Get.lazyPut(
      () => IncidentReportListController(
        Get.put(
          IncidentReportListPresenter(
            IncidentReportListUsecase(
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
