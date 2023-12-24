import 'package:cmms/app/compliance/compliance_controller.dart';
import 'package:cmms/app/compliance/compliance_presenter.dart';
import 'package:cmms/domain/usecases/compliance_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class ComplianceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComplianceController>(
      () => ComplianceController(
        CompliancePresenter(
          ComplianceUsecase(
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
