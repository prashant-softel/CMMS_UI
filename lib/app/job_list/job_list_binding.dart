import 'package:cmms/app/job_list/job_list_controller.dart';
import 'package:get/get.dart';

class JobListBinding extends Bindings {
  @override
  void dependencies() {
    Get.find<JobListController>();
    // Get.lazyPut<JobListController>(
    //   () => JobListController(
    //     Get.put(
    //       JobListPresenter(
    //         JobListUsecase(
    //           Get.find(),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
