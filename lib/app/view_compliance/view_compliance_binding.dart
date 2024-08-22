import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/view_compliance_usecase.dart';
import 'package:cmms/app/view_compliance/view_compliance_controller.dart';
import 'package:cmms/app/view_compliance/view_compliance_presenter.dart';
import 'package:get/get.dart';

import '../../../domain/usecases/home_usecase.dart';

class ViewComplianceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewComplianceController>(
      () => ViewComplianceController(
        ViewCompliancePresenter(
          ViewComplianceUsecase(
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
