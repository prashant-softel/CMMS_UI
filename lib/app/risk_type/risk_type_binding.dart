import 'package:cmms/app/risk_type/risk_type_controller.dart';
import 'package:cmms/app/risk_type/risk_type_presenter.dart';
import 'package:cmms/domain/usecases/SPV_list_usecase.dart';
import 'package:cmms/domain/usecases/risk_type_usecases.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class RiskTypeListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RiskTypeController(
        Get.put(
          RiskTypeListPresenter(
            RiskTypeUsecase(
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
