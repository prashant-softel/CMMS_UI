import 'package:get/get.dart';
import '../../domain/usecases/blood_list_usecase.dart';

import '../../domain/usecases/country_list_usecase.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'country_list_controller.dart';
import 'country_list_presenter.dart';

class CountryListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CountryListController(
        Get.put(
          CountryListPresenter(
            CountrylistUsecase(
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
