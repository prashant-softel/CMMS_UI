import 'package:cmms/app/app.dart';
import 'package:cmms/app/mis_summary/mis_summary_controller.dart';
import 'package:cmms/app/mis_summary/mis_summary_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/mis_summary_usecase.dart';

import 'package:get/get.dart';

class MisSummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MisSummaryController(
        Get.put(
          MisSummaryPresenter(
            MisSummaryUseCase(
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
