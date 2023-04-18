import 'package:cmms/domain/domain.dart';
import 'package:get/get.dart';

import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import '../job_list/job_list_presenter.dart';
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
        JobListPresenter(
          JobListUsecase(
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
