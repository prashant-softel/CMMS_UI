import 'package:cmms/app/app.dart';
import 'package:cmms/app/view_waste_data/view_waste_data_controller.dart';
import 'package:cmms/app/view_waste_data/view_waste_data_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/view_waste_data_usecase.dart';
import 'package:get/get.dart';

class ViewWasteDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ViewWasteDataController(
        Get.put(
          ViewWasteDataPresenter(
            ViewWasteDataUsecase(
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
