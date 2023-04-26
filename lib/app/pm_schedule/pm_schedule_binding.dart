import 'package:cmms/app/pm_schedule/pm_schedule_controller.dart';
import 'package:cmms/app/pm_schedule/pm_schedule_presenter.dart';
import 'package:get/get.dart';
import '../../../domain/usecases/pm_schedule_usecase.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class PmScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PmScheduleController(
        Get.put(
          PmSchedulePresenter(
            PmScheduleUsecase(
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
