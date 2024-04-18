import 'package:cmms/app/grievance_type/grievance_type_controller.dart';
import 'package:cmms/app/grievance_type/grievance_type_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/grievance_type_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

class GrievanceTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GrievanceTypeController>(
      () => GrievanceTypeController(
        Get.put(
          GrievanceTypePresenter(
            GrievanceTypeListUsecase(
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
