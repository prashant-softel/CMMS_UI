import 'package:cmms/app/grievance_list/grievance_list_controller.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/grievance_list_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'grievance_list_presenter.dart';

class GrievanceListBinding extends Bindings {
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
      () => GrievanceController(
        Get.put(
          GrievanceListPresenter(
            Get.put(GrievanceListUsecase(Get.find())),
          ),
          permanent: true,
        ),
      ),
      //permanent: true,
    );
  }
}
