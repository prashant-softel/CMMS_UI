import 'package:cmms/domain/usecases/create_preventivechecklist_usecase.dart';
import 'package:get/get.dart';

import 'create_preventive_checklist_controller.dart';
import 'create_preventive_checklist_presenter.dart';

class CreatePriventiveListBinding extends Bindings {
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
  }
}
