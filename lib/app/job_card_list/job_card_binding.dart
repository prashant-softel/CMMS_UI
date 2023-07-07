import 'package:get/get.dart';

import '../../domain/usecases/job_card_usecase.dart';

import 'job_card_list_controller.dart';
import 'job_card_presenter.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
class JobCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobCardListController>(
      () => JobCardListController(
        Get.put(
          JobCardPresenter(
            JobCardUsecase(
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
  }
}
