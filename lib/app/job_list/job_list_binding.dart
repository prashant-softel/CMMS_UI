import 'package:cmms/app/job_list/job_list_controller.dart';
import 'package:get/get.dart';

import '../../domain/usecases/job_list_usecase.dart';
import 'job_list_presenter.dart';

class JobListBinding extends Bindings {
  @override
  void dependencies() {
//    Get.find<JobListController>();
    Get.lazyPut(
      () => JobListController(
        Get.put(
          JobListPresenter(
            Get.put(JobListUsecase(Get.find())),
          ),
          permanent: true,
        ),
      ),
      //permanent: true,
    );
  }
}
