import 'package:cmms/app/faulty_material_report/faulty_material_report_controller.dart';
import 'package:cmms/app/faulty_material_report/faulty_material_report_presenter.dart';
import 'package:cmms/domain/usecases/faulty_material_report_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class FaultyMaterialReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaultyMaterialReportController>(
      () => FaultyMaterialReportController(
        FaultyMaterialReportPresenter(
          FaultyMaterialReportUsecase(
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
