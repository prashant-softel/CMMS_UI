

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/list_of_plantation/plantation_list_controller.dart';
import 'package:cmms/app/list_of_plantation/plantation_list_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/plantation_list_usecase.dart';
import 'package:get/get.dart';

class PlantationListBinding extends Bindings {
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
      () => PlantationListController(
        Get.put(
          PlantationListPresenter(
            Get.put(PlantationListUsecase(Get.find())),
          ),
          permanent: true,
        ),
      ),
      // permanent: true,
    );
  }
}
