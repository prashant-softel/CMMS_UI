import 'package:cmms/app/app.dart';
import 'package:cmms/app/checklist_Inspection/ChecklistInsp_list_controller.dart';
import 'package:cmms/app/checklist_Inspection/ChecklistInsp_list_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/checklist_inspection_list_usecase.dart';

import 'package:get/get.dart';

class ChecklistInspectionListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ChecklistInspectionListController(
        Get.put(
          ChecklistInspectionListPresenter(
            ChecklistInspectionListUsecase(
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
