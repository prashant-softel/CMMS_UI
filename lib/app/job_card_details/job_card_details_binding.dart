import 'package:get/get.dart';

import '../../domain/usecases/job_card_usecase.dart';

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
  }
}
