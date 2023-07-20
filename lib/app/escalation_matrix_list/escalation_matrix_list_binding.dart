import 'package:cmms/app/app.dart';
import 'package:cmms/app/escalation_matrix_list/escalation_matrix_list_controller.dart';
import 'package:cmms/app/escalation_matrix_list/escalation_matrix_list_presenter.dart';
import 'package:cmms/domain/usecases/escalation_matrix_list_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';

/// A list of bindings which will be used in the route of [HomeScreen].
class EscalationMatrixListBinding extends Bindings {
  @override
  void dependencies() {
      // Get.find<EscalationMatrixListController>();
    Get.lazyPut(
      () => EscalationMatrixListController(
        Get.put(
          EscalationMatrixListPresenter(
            EscalationMatrixListUsecase(
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
