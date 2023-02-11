import 'package:cmms/app/facility/facility_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:get/get.dart';

import '../home/home_presenter.dart';
import 'add_job_controller.dart';
import 'add_job_presenter.dart';

class AddJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddJobController>(
      () => AddJobController(
        AddJobPresenter(
          AddJobUsecase(
            Get.find(),
          ),
        ),
        FacilityPresenter(
          FacilityUsecase(
            Get.find(),
          ),
        ),
        HomePresenter(
          HomeUsecase(
            Get.find(),
          ),
        ),
      ),
    );
  }
}
