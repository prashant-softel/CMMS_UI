import 'package:cmms/app/preventive_List/preventive_list_controller.dart';
import 'package:get/get.dart';

class PreventiveListBinding extends Bindings {
  @override
  void dependencies() {
    Get.find<PreventiveListController>();

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
