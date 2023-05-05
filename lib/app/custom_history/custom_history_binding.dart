import 'package:get/get.dart';

import '../../domain/usecases/custom_history_usecase.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'custom_history_controller.dart';
import 'custom_history_presenter.dart';

class CustomHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomHistoryController>(
      () => CustomHistoryController(
        CustomHistoryPresenter(
          CustomHistoryUsecase(
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
