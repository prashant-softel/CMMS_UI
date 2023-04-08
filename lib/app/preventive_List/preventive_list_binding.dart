import 'package:cmms/app/preventive_List/preventive_list_controller.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/preventive_list_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class PreventiveListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PreventiveListController(
        Get.put(
          PreventiveListPresenter(
            PreventivelistUsecase(
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
