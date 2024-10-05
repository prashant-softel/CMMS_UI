import 'package:cmms/app/IR_list/ir_list_controller.dart';
import 'package:cmms/app/IR_list/ir_list_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/domain/usecases/ir_list_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';

/// A list of bindings which will be used in the route of [HomeScreen].
class IRListBinding extends Bindings {
  @override
  void dependencies() {
      // Get.find<IncidentReportListController>();
    Get.lazyPut(
      () => IRListController(
        Get.put(
          IRListPresenter(
            IRListUsecase(
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
