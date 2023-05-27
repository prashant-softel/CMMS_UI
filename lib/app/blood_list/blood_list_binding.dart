import 'package:get/get.dart';
import '../../domain/usecases/blood_list_usecase.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'blood_list_controller.dart';
import 'blood_list_presenter.dart';

class BloodListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BloodListController(
        Get.put(
          BloodListPresenter(
            BloodlistUsecase(
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
