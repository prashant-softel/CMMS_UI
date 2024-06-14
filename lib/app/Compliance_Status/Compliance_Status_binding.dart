
import 'package:cmms/app/Compliance_Status/Compliance_Status_controller.dart';
import 'package:cmms/app/Compliance_Status/Compliance_Status_presenter.dart';
import 'package:cmms/domain/usecases/Compliance_Status_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class ComplianceStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ComplianceStatusController(
        Get.put(
          ComplianceStatusPresenter(
            ComplianceStatusUsecase(
              Get.find(),
            )
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
