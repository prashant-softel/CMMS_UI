

import 'package:cmms/app/create_OccupationalHealth/create_occupationalhealth_controller.dart';
import 'package:cmms/app/create_occupationalhealth/create_occupationalhealth_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/create_occupationalhealth_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

class CreateOccupationalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateOccupationalhealthController>(
      () => CreateOccupationalhealthController(
        CreateOccupationalhealthPresenter(
          CreateOccupationalhealthUsecase(
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
