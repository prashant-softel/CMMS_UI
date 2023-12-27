import 'package:cmms/app/add_waste_data/add_waste_data_controller.dart';
import 'package:cmms/app/add_waste_data/add_waste_data_presenter.dart';
import 'package:cmms/app/app.dart';

import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/add_waste_data_usecase.dart';

import 'package:get/get.dart';

class AddWasteDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AddWasteDataController(
        Get.put(
          AddWasteDataPresenter(
            AddWasteDataUsecase(
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
