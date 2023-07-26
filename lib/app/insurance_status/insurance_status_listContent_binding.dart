import 'package:cmms/app/preventive_List/preventive_list_controller.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:get/get.dart';
import '../../domain/usecases/incident_riskType_usecase.dart';
import '../../domain/usecases/insurance_provider_usecase.dart';
import '../../domain/usecases/insurance_status_usecase.dart';
import '../../domain/usecases/module_list_usecase.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'insurance_status_listContent_controller.dart';
import 'insurance_status_listContent_presenter.dart';
// import 'incident_listContent_controller.dart';
//
// import 'incident_listContent_presenter.dart';

class InsuranceStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => InsuranceStatusController(
        Get.put(
          InsuranceStatusPresenter(
            InsuranceStatusUsecase(
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
