import 'package:cmms/app/job_type_list/job_type_list_controller.dart';
import 'package:cmms/app/job_type_list/job_type_list_presenter.dart';
import 'package:cmms/domain/usecases/job_type_list_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class JobTypeListBinding extends Bindings {
  @override
  void dependencies() {
    

    Get.lazyPut(
      () => JobTypeListController(
        Get.put(
          JobTypeListPresenter(
            JobTypeListUsecase(
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
