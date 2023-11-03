import 'package:get/get.dart';
import '../../domain/usecases/designation_list_usecase.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'designation_list_controller.dart';
import 'designation_list_presenter.dart';

class DesignationListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DesignationListController(
        Get.put(
          DesignationListPresenter(
            DesignationlistUsecase(
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
