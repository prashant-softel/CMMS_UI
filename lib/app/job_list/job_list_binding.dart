import 'package:cmms/app/job_list/job_list_controller.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/job_list_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'job_list_presenter.dart';

class JobListBinding extends Bindings {
  @override
  void dependencies() {
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
