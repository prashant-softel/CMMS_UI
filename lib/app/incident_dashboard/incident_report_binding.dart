import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/incident_report_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'incident_report_controller.dart';
import 'incident_report_presenter.dart';

class IncidentReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => IncidentReportController(
        Get.put(
          IncidentReportPresenter(
            IncidentReportUsecase(
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
