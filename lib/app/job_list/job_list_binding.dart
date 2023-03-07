import 'package:cmms/app/job_list/job_list_controller.dart';
import 'package:get/get.dart';

import '../../domain/usecases/job_list_usecase.dart';
import 'job_list_presenter.dart';

class JobListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobListController>(
      () => JobListController(
        Get.put(
          JobListPresenter(
            JobListUsecase(
              Get.find(),
            ),
          ),
        ),
        //   Get.put(
        //     FacilityPresenter(
        //       FacilityUsecase(
        //         Get.find(),
        //       ),
        //     ),
        //   ),
        //   Get.put(
        //     HomePresenter(
        //       HomeUsecase(
        //         Get.find(),
        //       ),
        //     ),
        //   ),
      ),
    );
  }
}
