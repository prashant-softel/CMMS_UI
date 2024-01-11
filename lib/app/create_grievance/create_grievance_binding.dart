import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/create_grievance_usecase.dart';
import 'package:get/get.dart';

import 'create_grievance_controller.dart';
import 'create_grievance_presenter.dart';

class CreateGrievanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CreateGrievanceController(
        Get.put(
          CreateGrievancePresenter(
            CreateGrievanceUsecase(
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
