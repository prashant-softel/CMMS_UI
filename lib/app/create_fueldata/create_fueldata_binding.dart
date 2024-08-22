

import 'package:cmms/app/create_fueldata/create_fueldata_controller.dart';
import 'package:cmms/app/create_fueldata/create_fueldata_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/create_fueldata_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

class FuelDataBinding extends Bindings {
  @override
  void dependencies() {
    // Binding CreateFuelDataController
    Get.lazyPut<CreateFuelDataController>(
      () => CreateFuelDataController(
        CreateFuelDataPresenter(
          CreateFuelDataUsecase(
            Get.find(), // Ensure this is properly registered in the dependency tree
          ),
        ),
      ),
    );

    // Binding HomeController
    Get.lazyPut<HomeController>(
      () => HomeController(
        HomePresenter(
          HomeUsecase(
            Get.find(), // Ensure this is properly registered in the dependency tree
          ),
        ),
      ),
    );
  }
}
