import 'package:cmms/app/app.dart';
import 'package:cmms/app/view_escalation_matrix/view_escalation_matrix_controller.dart';
import 'package:cmms/app/view_escalation_matrix/view_escalation_matrix_presenter.dart';

import 'package:cmms/domain/usecases/view_escalation_matrix_usecase.dart';

import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';

/// A list of bindings which will be used in the route of [HomeScreen].
class ViewEscalationMatrixBinding extends Bindings {
  @override
  void dependencies() {
    // Get.find<IncidentReportListController>();
    Get.lazyPut(
      () => ViewEscalationMatrixController(
        Get.put(
          ViewEscalationMatrixPresenter(
            ViewEscalationMatrixUsecase(
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
