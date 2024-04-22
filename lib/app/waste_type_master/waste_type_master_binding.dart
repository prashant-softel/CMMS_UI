import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/waste_type_master/waste_type_master_controller.dart';
import 'package:cmms/app/waste_type_master/waste_type_master_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/waste_type_master_usecase.dart';
import 'package:get/get.dart';

class WasteTypeMasterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WasteTypeMasterController>(
      () => WasteTypeMasterController(
        Get.put(
          WasteTypeMasterPresenter(
            WasteTypeMasterUsecase(
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
