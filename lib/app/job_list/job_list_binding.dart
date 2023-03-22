import 'package:cmms/app/job_list/job_list_controller.dart';
import 'package:cmms/app/job_list/job_list_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/job_list_usecase.dart';

class JobListBinding extends Bindings {
  @override
  void dependencies() {
    //Get.find<JobListController>();
    Get.lazyPut<JobListController>(
      () => JobListController(
        Get.put(
          JobListPresenter(
            JobListUsecase(
              Get.find(),
            ),
          ),
        ),
      ),
    );
  }
}
