import 'package:cmms/app/preventive_List/preventive_list_controller.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:get/get.dart';
import '../../domain/usecases/business_list_usecase.dart';
import '../../domain/usecases/module_list_usecase.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'business_list_controller.dart';
import 'business_list_presenter.dart';
// import 'module_list_controller.dart';
// import 'module_list_presenter.dart';

class BusinessListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BusinessListController(
        Get.put(
          BusinessListPresenter(
            BusinessListUsecase(
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
