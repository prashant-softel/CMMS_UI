import 'package:get/get.dart';
import '../../domain/usecases/incident_riskType_usecase.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'incident_listContent_controller.dart';
import 'incident_listContent_presenter.dart';

class IncidentRiskTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => IncidentRiskTypeController(
        Get.put(
          IncidentRiskTypePresenter(
            IncidentRiskTypeUsecase(
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
