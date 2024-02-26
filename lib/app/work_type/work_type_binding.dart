import 'package:cmms/app/incident_risk_type/incident_risk_type_controller.dart';
import 'package:cmms/app/incident_risk_type/incident_risk_type_presenter.dart';
import 'package:cmms/app/work_type/work_type_controller.dart';
import 'package:cmms/app/work_type/work_type_presenter.dart';
import 'package:cmms/domain/usecases/incident_risk_type_usecase.dart';
import 'package:cmms/domain/usecases/work_type_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class WorkTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => WorkTypeController(
        Get.put(
          WorkTypePresenter(
            WorkTypeUsecase(
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
