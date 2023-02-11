import 'package:cmms/app/facility/facility_presenter.dart';
import 'package:cmms/app/job_list/job_list_controller.dart';
import 'package:cmms/app/job_list/job_list_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:get/get.dart';

import '../home/home_presenter.dart';

class JobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobListController>(
      () => JobListController(
        JobListPresenter(
          JobListUsecase(
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
