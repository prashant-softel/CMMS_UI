import 'package:cmms/domain/usecases/create_preventivechecklist_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'create_preventive_checklist_controller.dart';
import 'create_preventive_checklist_presenter.dart';

class CreatePreventiveListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PreventiveCheckListController(
        Get.put(
          CreateCheckListPresenter(
            CreatePreventiveChecklistUsecase(
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
