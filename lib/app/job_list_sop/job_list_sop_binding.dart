import 'package:cmms/app/job_list_sop/job_list_sop_controller.dart';
import 'package:cmms/app/job_list_sop/job_list_sop_presenter.dart';
import 'package:cmms/domain/usecases/job_list_sop_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class JobSOPListBinding extends Bindings {
  @override
  void dependencies() {
    

    Get.lazyPut(
      () => JobSOPListController(
        Get.put(
          JobSOPListPresenter(
            JobSOPListUsecase(
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
