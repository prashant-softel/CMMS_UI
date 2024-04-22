import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/type_water_master/type_water_master_controller.dart';
import 'package:cmms/app/type_water_master/type_water_master_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/water_type_master_usecase.dart';
import 'package:get/get.dart';

class WaterTypeMasterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaterTypeMasterController>(
      () => WaterTypeMasterController(
        Get.put(
          WaterTypeMasterPresenter(
            WaterTypeMasterUsecase(
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
