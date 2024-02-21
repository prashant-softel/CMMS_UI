import 'package:cmms/app/incident_risk_type/incident_risk_type_controller.dart';
import 'package:cmms/app/incident_risk_type/incident_risk_type_presenter.dart';
import 'package:cmms/domain/usecases/incident_risk_type_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

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
