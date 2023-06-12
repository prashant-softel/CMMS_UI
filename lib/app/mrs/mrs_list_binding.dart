import 'package:cmms/app/mrs/Mrs_list_controller.dart';
import 'package:cmms/app/mrs/mrs_list_presenter.dart';
import 'package:cmms/domain/usecases/mrs_list_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class MrsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MrsListController>(
      () => MrsListController(
        MrsListPresenter(
          MrsListUsecase(
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
