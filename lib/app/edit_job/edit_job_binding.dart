import 'package:cmms/domain/domain.dart';
import 'package:get/get.dart';

import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import '../job_details/job_details_presenter.dart';
import '../job_list/job_list_presenter.dart';
import 'edit_job_controller.dart';
import 'edit_job_presenter.dart';

class EditJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditJobController>(
      () => EditJobController(
        EditJobPresenter(
          EditJobUsecase(
            Get.find(),
          ),
        ),
        HomePresenter(
          HomeUsecase(
            Get.find(),
          ),
        ),
        JobListPresenter(
          JobListUsecase(
            Get.find(),
          ),
        ),
        JobDetailsPresenter(
          JobDetailsUsecase(
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
