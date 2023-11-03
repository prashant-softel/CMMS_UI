import 'package:get/get.dart';
import '../../domain/usecases/insurance_provider_usecase.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
// import 'incident_listContent_controller.dart';
import 'insurance_provider_listContent_controller.dart';
import 'insurance_provider_listContent_presenter.dart';
//
// import 'incident_listContent_presenter.dart';

class InsuranceProviderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => InsuranceProviderController(
        Get.put(
          InsuranceProviderPresenter(
            InsuranceProviderUsecase(
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
