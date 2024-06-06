import 'package:cmms/app/facility/facility_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:get/get.dart';
import '../home/home_presenter.dart';
import 'job_details_controller.dart';
import 'job_details_presenter.dart';
import '../home/home_controller.dart';

class JobDetailsBinding extends Bindings {
  @override
  void dependencies() {
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

