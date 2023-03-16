import 'package:cmms/app/preventive_maintanance/preventive_presenter.dart';
import 'package:cmms/domain/usecases/preventive_usecase.dart';
import 'package:get/get.dart';

import 'create_preventive_checklist_controller.dart';

class PreventiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PreventiveCheckListController(
          // Get.put(
          //   PreventivePresenter(
          //     PreventiveUsecase(
          //       Get.find(),
          //     ),
          //   ),
          // ),
          ),
    );
  }
}
