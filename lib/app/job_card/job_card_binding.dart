import 'package:get/get.dart';

import '../../domain/usecases/job_card_usecase.dart';
import 'job_card_controller.dart';
import 'job_card_presenter.dart';

class JobCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobCardController>(
      () => JobCardController(
        Get.put(
          JobCardPresenter(
            JobCardUsecase(
              Get.find(),
            ),
          ),
        ),
      ),
    );
  }
}
