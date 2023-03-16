import 'package:cmms/app/preventive_maintanance/preventive_controller.dart';
import 'package:cmms/app/preventive_maintanance/preventive_presenter.dart';
import 'package:cmms/domain/usecases/preventive_usecase.dart';
import 'package:get/get.dart';

class PreventiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.find<PreventiveController>();

    // Get.lazyPut(
    //   () => PreventiveController(
    //     Get.put(
    //       PreventivePresenter(
    //         PreventiveUsecase(
    //           Get.find(),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
