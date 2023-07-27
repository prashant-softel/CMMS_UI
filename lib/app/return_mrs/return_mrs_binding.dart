import 'package:cmms/app/return_mrs/return_mrs_controller.dart';
import 'package:cmms/app/return_mrs/return_mrs_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/return_mrs_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class ReturnMrsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReturnMrsListController>(
      () => ReturnMrsListController(
        ReturnMrsListPresenter(
          ReturnMrsListUsecase(
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
