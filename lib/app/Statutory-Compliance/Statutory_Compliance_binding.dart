
import 'package:cmms/app/Statutory-Compliance/Statutory_Compliance_controller.dart';
import 'package:cmms/app/Statutory-Compliance/Statutory_Compliance_presenter.dart';
import 'package:cmms/domain/usecases/Statutory_Compliance_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class StatutoryComplianceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => StatutoryComplianceController(
        Get.put(
          StatutoryCompliancePresenter(
            StatutoryComplianceUsecase(
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
