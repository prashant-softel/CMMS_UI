import 'package:cmms/app/preventive_List/preventive_list_controller.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/business_type_list_usecase.dart';
import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/preventive_list_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'business_type_list_controller.dart';
import 'business_type_list_presenter.dart';

class BusinessTypeListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BusinessTypeListController(
        Get.put(
          BusinessTypeListPresenter(
            BusinessTypeListUsecase(
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
