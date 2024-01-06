import 'package:cmms/app/waste_data/waste_data_controller.dart';
import 'package:cmms/app/waste_data/waste_data_presenter.dart';

import 'package:cmms/domain/usecases/waste_data_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class WasteDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WasteDataController>(
      () => WasteDataController(
        WasteDataPresenter(
          WasteDataUsecase(
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
