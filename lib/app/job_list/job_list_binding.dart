import 'package:cmms/app/job_list/job_list_controller.dart';
import 'package:get/get.dart';

class JobListBinding extends Bindings {
  @override
  void dependencies() {
    Get.find<JobListController>();
  }
}
