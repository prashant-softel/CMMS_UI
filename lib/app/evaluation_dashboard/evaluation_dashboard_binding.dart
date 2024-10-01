import 'package:cmms/app/evaluation_dashboard/evaluation_dashboard_controller.dart';
import 'package:cmms/app/evaluation_dashboard/evaluation_dashboard_presenter.dart';
import 'package:cmms/domain/usecases/evaluation_dashboard_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class EvaluationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EvaluationController(
        Get.put(
          EvaluationPresenter(
            EvaluationUsecase(
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
