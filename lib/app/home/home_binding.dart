import 'package:cmms/app/app.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:cmms/app/new_permit/new_permit_presenter.dart';
import 'package:cmms/domain/usecases/new_permit_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';

/// A list of bindings which will be used in the route of [HomeScreen].
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.find<HomeController>();
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
