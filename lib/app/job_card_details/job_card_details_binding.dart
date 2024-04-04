import 'package:cmms/app/facility/facility_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/job_details/job_details_controller.dart';
import 'package:cmms/app/job_details/job_details_presenter.dart';
import 'package:cmms/domain/usecases/facility_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/job_details_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/job_card_details_usecase.dart';

import 'job_card_details_controller.dart';
import 'job_card_details_presenter.dart';

class JobCardDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobCardDetailsController>(
      () => JobCardDetailsController(
        Get.put(
          JobCardDetailsPresenter(
            JobCardDetailsUsecase(
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
    Get.lazyPut(
      () => JobDetailsController(
        Get.put(
          JobDetailsPresenter(
            JobDetailsUsecase(
              Get.find(),
            ),
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
