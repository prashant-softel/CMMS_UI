import 'package:cmms/app/Statutory/statutory_controller.dart';
import 'package:cmms/app/Statutory/statutory_presenter.dart';

import 'package:cmms/domain/usecases/statutory_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class StatutoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatutoryController>(
      () => StatutoryController(
        StatutoryPresenter(
          StatutoryUsecase(
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
