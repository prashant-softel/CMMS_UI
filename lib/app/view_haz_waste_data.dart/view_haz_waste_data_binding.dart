import 'package:cmms/app/app.dart';
import 'package:cmms/app/view_haz_waste_data.dart/view_haz_waste_data_controller.dart';
import 'package:cmms/app/view_haz_waste_data.dart/view_haz_waste_data_presenter.dart';

import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/view_haz_waste_data_usecase.dart';

import 'package:get/get.dart';

class ViewHazWasteDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ViewHazWasteDataController(
        Get.put(
          ViewHazWasteDataPresenter(
            ViewHazWasteDataUsecase(
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
