import 'package:cmms/app/compliance_history/compliance_history_controller.dart';
import 'package:cmms/app/compliance_history/compliance_history_presenter.dart';
import 'package:cmms/domain/usecases/compliance_history_usecase.dart';

import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class ComplianceHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComplianceHistoryController>(
      () => ComplianceHistoryController(
        ComplianceHistoryPresenter(
          ComplianceHistoryUsecase(
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
